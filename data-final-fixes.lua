local DEEP_PREFIX = "deep-"
local DEEP_TINT = {r = 0.65, g = 0.95, b = 0.65, a = 1.0}
local RECIPE_IRON_COUNT = 10
local RECIPE_OUTPUT_COUNT = 2
local distance_value = settings.startup["config-under-lengths"].value

local function apply_tint_to_structure(structure, tint)
  for _, key in pairs({"direction_in", "direction_out", "direction_in_side_loading", "direction_out_side_loading"}) do
    local dir = structure[key]
    if dir and dir.sheet then
      dir.sheet.tint = tint
      if dir.sheet.hr_version then
        dir.sheet.hr_version.tint = tint
      end
    end
  end
end

local function build_deep_icons(source, tint)
  if source.icons then
    local icons = util.table.deepcopy(source.icons)
    for _, layer in pairs(icons) do
      layer.tint = tint
    end
    return icons
  elseif source.icon then
    return {{
      icon = source.icon,
      icon_size = source.icon_size or 64,
      tint = tint,
    }}
  end
  return nil
end

local function find_recipe_for_item(item_name)
  for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.results then
      for _, result in pairs(recipe.results) do
        if result.name == item_name then
          return recipe.name
        end
      end
    end
    if recipe.result == item_name then
      return recipe.name
    end
  end
  return nil
end

local function find_tech_for_recipe(recipe_name)
  for tech_name, tech in pairs(data.raw["technology"]) do
    if tech.effects then
      for _, effect in pairs(tech.effects) do
        if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
          return tech_name, tech
        end
      end
    end
  end
  return nil, nil
end

local entities = {}
local items = {}
local recipes = {}

for name, belt in pairs(data.raw["underground-belt"]) do
  if name:sub(1, #DEEP_PREFIX) == DEEP_PREFIX then
    goto continue
  end

  local deep_name = DEEP_PREFIX .. name

  -- Entity
  local deep_entity = util.table.deepcopy(belt)
  deep_entity.name = deep_name
  if deep_entity.minable then
    deep_entity.minable.result = deep_name
  end
  local entity_base_name = belt.localised_name or {"entity-name." .. name}
  deep_entity.localised_name = {"", entity_base_name, " (Deep)"}
  if distance_value > -1 then
    deep_entity.max_distance = distance_value
  end
  if deep_entity.structure then
    apply_tint_to_structure(deep_entity.structure, DEEP_TINT)
  end
  deep_entity.icons = build_deep_icons(belt, DEEP_TINT)
  deep_entity.icon = nil
  deep_entity.icon_size = nil
  deep_entity.factoriopedia_alternative = nil
  table.insert(entities, deep_entity)

  -- Item
  local source_item = data.raw["item"][name]
  if source_item then
    local deep_item = util.table.deepcopy(source_item)
    deep_item.name = deep_name
    deep_item.place_result = deep_name
    local item_base_name = source_item.localised_name or {"item-name." .. name}
    deep_item.localised_name = {"", item_base_name, " (Deep)"}
    deep_item.icons = build_deep_icons(source_item, DEEP_TINT)
    deep_item.icon = nil
    deep_item.icon_size = nil
    table.insert(items, deep_item)
  else
    goto continue
  end

  -- Recipe
  local source_recipe_name = find_recipe_for_item(name)
  local recipe_enabled = true
  if source_recipe_name then
    local source_recipe = data.raw["recipe"][source_recipe_name]
    if source_recipe and source_recipe.enabled == false then
      recipe_enabled = false
    end
  end

  local deep_recipe = {
    type = "recipe",
    name = deep_name,
    localised_name = {"", item_base_name, " (Deep)"},
    enabled = recipe_enabled,
    ingredients = {
      {type = "item", name = "iron-plate", amount = RECIPE_IRON_COUNT},
      {type = "item", name = name, amount = 1},
    },
    results = {{type = "item", name = deep_name, amount = RECIPE_OUTPUT_COUNT}},
  }
  table.insert(recipes, deep_recipe)

  -- Technology: append deep recipe unlock to the same tech that unlocks the source belt
  if not recipe_enabled and source_recipe_name then
    local source_tech_name, source_tech = find_tech_for_recipe(source_recipe_name)
    if source_tech_name and source_tech then
      if not source_tech.effects then source_tech.effects = {} end
      table.insert(source_tech.effects, {type = "unlock-recipe", recipe = deep_name})
    else
      deep_recipe.enabled = true
    end
  end

  ::continue::
end

data:extend(entities)
data:extend(items)
data:extend(recipes)

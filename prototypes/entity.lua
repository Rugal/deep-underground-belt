local distance_value = settings.startup["config-under-lengths"].value

local function apply_tint_to_structure(structure, tint)
    for _, key in pairs({"direction_in", "direction_out", "direction_in_side_loading", "direction_out_side_loading"}) do
        local dir = structure[key]
        if dir then
            if dir.sheet then
                dir.sheet.tint = tint
                if dir.sheet.hr_version then
                    dir.sheet.hr_version.tint = tint
                end
            end
        end
    end
end

local deep_undergroundbelt = util.table.deepcopy(data.raw["underground-belt"]["underground-belt"])
if distance_value > -1 then deep_undergroundbelt.max_distance = distance_value end
deep_undergroundbelt.name = "deep-underground-belt"
deep_undergroundbelt.minable.result = "deep-underground-belt"
deep_undergroundbelt.icon = "__deep-underground-belt-2__/graphics/icons/deep-underground-belt.png"
apply_tint_to_structure(deep_undergroundbelt.structure, {r=0.7, g=1.0, b=0.7, a=1})
data:extend({deep_undergroundbelt})

local deep_fast_undergroundbelt = util.table.deepcopy(data.raw["underground-belt"]["fast-underground-belt"])
if distance_value > -1 then deep_fast_undergroundbelt.max_distance = distance_value end
deep_fast_undergroundbelt.name = "deep-fast-underground-belt"
deep_fast_undergroundbelt.minable.result = "deep-fast-underground-belt"
deep_fast_undergroundbelt.icon = "__deep-underground-belt-2__/graphics/icons/deep-fast-underground-belt.png"
apply_tint_to_structure(deep_fast_undergroundbelt.structure, {r=1.0, g=0.6, b=1.0, a=1})
data:extend({deep_fast_undergroundbelt})

local deep_express_undergroundbelt = util.table.deepcopy(data.raw["underground-belt"]["express-underground-belt"])
if distance_value > -1 then deep_express_undergroundbelt.max_distance = distance_value end
deep_express_undergroundbelt.name = "deep-express-underground-belt"
deep_express_undergroundbelt.minable.result = "deep-express-underground-belt"
deep_express_undergroundbelt.icon = "__deep-underground-belt-2__/graphics/icons/deep-express-underground-belt.png"
apply_tint_to_structure(deep_express_undergroundbelt.structure, {r=0.6, g=0.7, b=1.0, a=1})
data:extend({deep_express_undergroundbelt})

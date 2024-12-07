local distance_value = settings.startup["config-under-lengths"].value

local deep_undergroundbelt = util.table.deepcopy(data.raw["underground-belt"]["underground-belt"])
if distance_value > -1 then deep_undergroundbelt.max_distance = distance_value end
deep_undergroundbelt.name = "deep-underground-belt"
deep_undergroundbelt.minable.result = "deep-underground-belt"
deep_undergroundbelt.icon = "__deep-underground-belt-2__/graphics/icons/deep-underground-belt.png"
deep_undergroundbelt.structure.direction_in.sheet =
    {   
        filename = "__deep-underground-belt-2__/graphics/entity/deep-underground-belt-structure.png",
        priority = "extra-high",
        width = 96,
        height = 96,
        y = 96,
        hr_version =
        {
            filename = "__deep-underground-belt-2__/graphics/entity/hr-deep-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
            scale = 0.5
        }
    }
deep_undergroundbelt.structure.direction_out.sheet =
    {
        filename = "__deep-underground-belt-2__/graphics/entity/deep-underground-belt-structure.png",
        priority = "extra-high",
        width = 96,
        height = 96,
        y = 96,
        hr_version =
        {
            filename = "__deep-underground-belt-2__/graphics/entity/hr-deep-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
            scale = 0.5
        }
    }



data:extend({deep_undergroundbelt})






local deep_fast_undergroundbelt = util.table.deepcopy(data.raw["underground-belt"]["fast-underground-belt"]);
if distance_value > -1 then deep_fast_undergroundbelt.max_distance = distance_value end
deep_fast_undergroundbelt.name = "deep-fast-underground-belt";
deep_fast_undergroundbelt.minable.result = "deep-fast-underground-belt"
deep_fast_undergroundbelt.icon = "__deep-underground-belt-2__/graphics/icons/deep-fast-underground-belt.png"
deep_fast_undergroundbelt.structure.direction_in.sheet =
    {
        filename = "__deep-underground-belt-2__/graphics/entity/deep-fast-underground-belt-structure.png",
        priority = "extra-high",
        width = 96,
        height = 96,
        y = 96,
        hr_version =
        {
            filename = "__deep-underground-belt-2__/graphics/entity/hr-deep-fast-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
            scale = 0.5
        }
    }

deep_fast_undergroundbelt.structure.direction_out.sheet =
    {
        filename = "__deep-underground-belt-2__/graphics/entity/deep-fast-underground-belt-structure.png",
        priority = "extra-high",
        width = 96,
        height = 96,
        y = 96,
        hr_version =
        {
            filename = "__deep-underground-belt-2__/graphics/entity/hr-deep-fast-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
            scale = 0.5
        }
    }


data:extend({deep_fast_undergroundbelt})






local deep_express_undergroundbelt = util.table.deepcopy(data.raw["underground-belt"]["express-underground-belt"]);
if distance_value > -1 then deep_express_undergroundbelt.max_distance = distance_value end
deep_express_undergroundbelt.name = "deep-express-underground-belt";
deep_express_undergroundbelt.minable.result = "deep-express-underground-belt"
deep_express_undergroundbelt.icon = "__deep-underground-belt-2__/graphics/icons/deep-express-underground-belt.png"
deep_express_undergroundbelt.structure.direction_in.sheet =
    {
        filename = "__deep-underground-belt-2__/graphics/entity/deep-express-underground-belt-structure.png",
        priority = "extra-high",
        width = 96,
        height = 96,
        y = 96,
        hr_version =
        {
            filename = "__deep-underground-belt-2__/graphics/entity/hr-deep-express-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
            scale = 0.5
        }
    }
deep_express_undergroundbelt.structure.direction_out.sheet =
    {
        filename = "__deep-underground-belt-2__/graphics/entity/deep-express-underground-belt-structure.png",
        priority = "extra-high",
        width = 96,
        height = 96,
        y = 96,
        hr_version =
        {
            filename = "__deep-underground-belt-2__/graphics/entity/hr-deep-express-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
            scale = 0.5
        }
    }

data:extend({deep_express_undergroundbelt})

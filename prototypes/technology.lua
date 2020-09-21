data:extend({
  
  {
    type = "technology",
    name = "deep-underground-belt",
    icon = "__deep-underground-belt__/graphics/icons/deep-underground-belt.png",
    icon_size = 64,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "deep-underground-belt"
      }
    },
    unit =
    {
      count = 10,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time =10
    },
    prerequisites = {"logistics"},
    --upgrade = true
  },

  {
    type = "technology",
    name = "deep-underground-belt-2",
    icon = "__deep-underground-belt__/graphics/icons/deep-fast-underground-belt.png",
    icon_size = 64,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "deep-fast-underground-belt"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time =20,
    },
    prerequisites = {"logistics-2","deep-underground-belt"},
    --upgrade = true
  },



  {
    type = "technology",
    name = "deep-underground-belt-3",
    icon = "__deep-underground-belt__/graphics/icons/deep-express-underground-belt.png",
    icon_size = 64,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "deep-express-underground-belt"
      }
    },
    unit =
    {
      count = 80,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time =30
    },
    prerequisites = {"logistics-3","deep-underground-belt-2"},
  },
  --upgrade = true


})
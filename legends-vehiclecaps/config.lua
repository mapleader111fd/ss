Config = {}
-- Set Config.kmh to false if you want to use mph
Config.kmh = true

-- Set Config.maxSpeed to false if you want to use same speed for all vehicles
-- Set the max speed for all vehicles on Config.maxSpeed
Config.useCategories = true
Config.maxSpeed = 150

Config.Categories = {
   -- COMPACTS
   {category = 0, maxSpeed = 205},
   -- SEDANS
   {category = 1, maxSpeed = 208},
   -- SUV'S
   {category = 2, maxSpeed = 208},
   -- COUPES
   {category = 3, maxSpeed = 208},
   -- MUSCLE
   {category = 4, maxSpeed = 208},
   -- SPORT CLASSIC
   {category = 5, maxSpeed = 220},
   -- SPORT
   {category = 6, maxSpeed = 235},
   -- SUPER
   {category = 7, maxSpeed = 250},
   -- MOTORCYCLES
   {category = 8, maxSpeed = 240},
   -- OFFROAD
   {category = 9, maxSpeed = 208},
   -- INDUSTRIAL
   {category = 10, maxSpeed = 208},
   -- UTILITY
   {category = 11, maxSpeed = 208},
   -- VANS
   {category = 12, maxSpeed = 208},
   -- BICYCLES
   {category = 13, maxSpeed = 250},
   -- BOATS
   {category = 14, maxSpeed = 208},

   --#region PLANES AND HELIS
   -- YOU MUST NOT LOCK THIS ONES OR YOU WON'T BE ABLE TO FLY THEM!!!
   {category = 15, maxSpeed = nil},
   {category = 16, maxSpeed = nil},
   --#endregion

   -- SERVICE
   {category = 17, maxSpeed = 208},
   -- EMERGENCY
   {category = 18, maxSpeed = 260},
   -- MILITARY
   {category = 19, maxSpeed = 208}
}

-- DO NOT MODIFY
Config.kmhValue = 3.6
Config.mphValue = 2.23694
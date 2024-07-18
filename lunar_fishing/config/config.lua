Config = {}

Config.progressPerCatch = 0.05 -- The progress per one fish caught

---@class Fish
---@field price integer | { min: integer, max: integer }
---@field chance integer Percentage chance
---@field skillcheck SkillCheckDifficulity }

---@type table<string, Fish>
Config.fish = {
    ['anchovy'] = { price = { min = 40, max = 76 }, chance = 35, skillcheck = { 'easy', 'medium' } },
    ['trout'] = { price = { min = 12, max = 30 }, chance = 35, skillcheck = { 'easy', 'medium' } },
    ['haddock'] = { price = { min = 44, max = 98 }, chance = 20, skillcheck = { 'easy', 'medium' } },
    ['salmon'] = { price = { min = 58, max = 78 }, chance = 10, skillcheck = { 'easy', 'medium', 'medium' } },
    ['grouper'] = { price = { min = 78, max = 118 }, chance = 25, skillcheck = { 'easy', 'medium', 'medium', 'medium' } },
    ['piranha'] = { price = { min = 75, max = 132 }, chance = 25, skillcheck = { 'easy', 'medium', 'hard' } },
    ['red_snapper'] = { price = { min = 110, max = 132 }, chance = 20, skillcheck = { 'easy', 'medium', 'medium', 'medium' } },
    ['mahi_mahi'] = { price = { min = 139, max = 139 }, chance = 20, skillcheck = { 'easy', 'medium', 'medium', 'medium' } },
    ['tuna'] = { price = { min = 399, max = 501 }, chance = 5, skillcheck = { 'easy', 'medium', 'hard' } },
    ['shark'] = { price = { min = 710, max = 851 }, chance = 1, skillcheck = { 'easy', 'medium', 'hard' } },
}

---@class FishingRod
---@field name string
---@field price integer
---@field minLevel integer The minimal level
---@field breakChance integer Percentage chance

---@type FishingRod[]
Config.fishingRods = {
    { name = 'basic_rod', price = 1000, minLevel = 1, breakChance = 3 },
    { name = 'graphite_rod', price = 2500, minLevel = 2, breakChance = 2 },
    { name = 'titanium_rod', price = 10000, minLevel = 3, breakChance = 0 },
}

---@class FishingBait
---@field name string
---@field price integer
---@field minLevel integer The minimal level
---@field waitDivisor number The total wait time gets divided by this value

---@type FishingBait[]
Config.baits = {
    { name = 'worms', price = 8, minLevel = 1, waitDivisor = 1.0 },
    { name = 'artificial_bait', price = 15, minLevel = 2, waitDivisor = 3.0 },
}

---@class FishingZone
---@field locations vector3[] One of these gets picked at random
---@field radius number
---@field minLevel integer
---@field waitTime { min: integer, max: integer }
---@field includeOutside boolean Whether you can also catch fish from Config.outside
---@field blip BlipData?
---@field message { enter: string, exit: string }?
---@field fishList string[]

---@type FishingZone[]
Config.fishingZones = {
    {
        blip = {
            name = 'Залив',
            sprite = 317,
            color = 24,
            scale = 0.6
        },
        locations = {
            vector3(-1758.51, 5351.25, 1.0),
        },
        radius = 220.0,
        minLevel = 1,
        waitTime = { min = 5, max = 10 },
        includeOutside = false,
        message = { enter = 'Влезнахте в залива.', exit = 'Напуснахте залива.' },
        fishList = { 'mahi_mahi', 'red_snapper' }
    },
    {
       
blip = {
    name = 'Дълбоки Води',
    sprite = 317,
    color = 29,
    scale = 0.6
},
        locations = {
            vector3(-2433.85, 7006.82, 1.0),
        },
        radius = 500.0,
        minLevel = 1,
        waitTime = { min = 20, max = 40 },
        includeOutside = false,
        message = { enter = 'Влезнахте в дълбоки води.', exit = 'Излезнахте от дълбоките води.' },
        fishList = { 'grouper', 'tuna', 'shark', 'anchovy', 'haddock' }
    },
    {
        blip = {
            name = 'Блато',
            sprite = 317,
            color = 56,
            scale = 0.6
        },
        locations = {
            vector3(-2368.64, 2567.50, 32.82),
        },
        radius = 200.0,
        minLevel = 1,
        waitTime = { min = 10, max = 20 },
        includeOutside = false,
        message = { enter = 'Влезнахте в блато пълно с жаби.', exit = 'Напуснахте блатото, проверете дрехите си за жаби.' },
        fishList = { 'piranha' }
    },
}

-- Outside of all zones
Config.outside = {
    waitTime = { min = 5, max = 10 },

    ---@type string[]
    fishList = {
        'trout', 'anchovy', 'haddock', 'salmon'
    }
}

Config.ped = {
    model = `s_m_m_cntrybar_01`,
    buyAccount = 'money',
    sellAccount = 'money',
    blip = {
        name = 'Дъртия Рибар',
        sprite = 780,
        color = 74,
        scale = 0.75
    },

    ---@type vector4[]
    locations = {
        vector4(-1593.48, 5212.7, 3.99, 297.73),
    }
}

Config.renting = {
    model = `a_f_y_beach_01`, -- The ped model
    account = 'money',
    boats = {
        { model = `speeder`, price = 500, image = 'https://i.postimg.cc/mDSqWj4P/164px-Speeder.webp' },
        { model = `dinghy`, price = 750, image = 'https://i.postimg.cc/ZKzjZgj0/164px-Dinghy2.webp'  },
        { model = `tug`, price = 1250, image = 'https://i.postimg.cc/jq7vpKHG/164px-Tug.webp' }
    },
    blip = {
        name = 'Наеми Лодка',
        sprite = 455,
        color = 74,
        scale = 0.80
    },
    returnDivider = 5, -- Players can return it and get some cash back
    returnRadius = 30.0, -- The save radius

    ---@type { coords: vector4, spawn: vector4 }[]
    locations = {
        { coords = vector4(-1604.61, 5256.62, 2.07, 292.01), spawn = vector4(-1599.48, 5259.76, -0.47, 29.37) }
    }
}
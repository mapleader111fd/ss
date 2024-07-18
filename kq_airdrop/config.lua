Config = {}

-- Enabled additional debug prints as well as displays all the possible (automatic) drop zones on the map
Config.debug = false

Config.MinCops = 6
Config.pedModel = `mp_m_execpa_01`
Config.pedCoords = vector3(844.11, -2118.45, 29.52)
Config.pedHeading = 97.51
Config.neededItem = "hackingdevice2"
Config.delay = 3600*2

--- SETTINGS FOR ESX
Config.esxSettings = {
    enabled = false,

    -- Whether or not to use the new ESX export method
    useNewESXExport = false,
}

--- SETTINGS FOR QBCORE
Config.qbSettings = {
    enabled = true,
}

-------------------------------------------------
--- ITEM
-------------------------------------------------
Config.item = {
    enabled = true,

    flareItemName = 'kq_airdrop_flare',
    cooldown = 120, -- time in seconds

    drop = {
        flare = true,
        crates = {
            'coke',
            'tequila',
        },
    }
}

-------------------------------------------------
--- GENERAL
-------------------------------------------------

Config.misc = {
    -- Time in minutes as how long the loot should remain on the ground for
    dropLifetime = 20,

    -- Size of the flare/smoke
    flareScale = 1.5,

    -- How long the smoke should stay for
    flareLifetime = 120, -- time in seconds

    -- Whether or not to show the planes on the map
    planeBlips = true,

    -- Whether or not to show the crates on the map
    crateBlips = true,

    crateBlipsLifetime = 120, -- time in seconds
}

-------------------------------------------------
--- LOOT PICKUP ANIMATION
-------------------------------------------------
Config.pickupAnimation = {
    duration = 7, -- in seconds
    dict = 'mp_take_money_mg',
    anim = 'put_cash_into_bag_loop',
    flag = 1,
}

-------------------------------------------------
--- PLANE
-------------------------------------------------

Config.plane = {
    -- Model of the plane. We recommend using bigger planes to make them more visible to the players
    -- Recommended: titan, streamer216
    model = 'titan',

    -- Color of the plane
    color = { r = 3, g = 252, b = 227 }, -- cyan

    -- Velocity of the plane in m/s
    -- This only affects the flight speed before the drop is dropped. The plane will always slow down right
    -- before dropping the crates

    -- Recommended values between 20 and 100. Anything under or over may cause visual issues
    flightSpeed = 40.0,
}

-------------------------------------------------
--- AUTOMATIC DROPS
-------------------------------------------------

Config.automaticDrop = {
    enabled = false,
    -- Time in minutes
    timeBetweenDrops = 600
}

-- Drop zones for the automatic drop
-- coords = coordinates of the zone
-- radius = radius of the potential drop zone
-- flare = true/false, whether to spawn the flare when the crates hit the ground
-- crates = type of crates that will be dropped. As defined per Config.types. Any amount can be given. Will drop in the stated order with slight delay between each drop
Config.drops = {
    {
        coords = vector3(1929.8, 3332.1, 45.5),
        radius = 500.0,
        flare = true,
        crates = {
            'coke',
            'tequila',
            'coke',
        },
    },
    {
        coords = vector3(751.41, 3000.0, 50.0),
        radius = 500.0,
        flare = true,
        crates = {
            'coke',
            'tequila',
            'coke',
        },
    },
    {
        coords = vector3(1430.78, 2044.9, 130.0),
        radius = 500.0,
        flare = true,
        crates = {
            'coke',
            'tequila',
            'coke',
        },
    },
    {
        coords = vector3(-669.5, 2756.3, 80.0),
        radius = 400.0,
        flare = true,
        crates = {
            'coke',
            'tequila',
            'coke',
        },
    },
    {
        coords = vector3(-1558.0, 4601.2, 70.0),
        radius = 300.0,
        flare = true,
        crates = {
            'coke',
            'tequila',
            'coke',
        },
    },
}

-- Types of drops
-- amount = amount of the crates it should drop
-- model = model of the crate
-- chunks = little parts which will be spawned upon crate crash

-- loot
-- -- radius = radius of the loot spawn upon crate crashing
-- -- amount = amount of little crates/items that will spawn
-- -- loot - table of different item crates
-- -- -- hash = model of the drop item
-- -- -- items = list of items, amounts and chances
-- -- -- chance = chance of said "loot" to spawn in relation to other loots
-- -- -- textureVariation = texture variation of the prop
-- -- -- minimumDistanceBetween = minimum distance between the props/loot
-- -- -- offset = object offset
-- -- -- animation = animation used for the pickup
-- -- -- labelSingular = label for one of the items
-- -- -- labelPlurar = label for multiple items
-- -- -- collectMessage = message players will to pickup the item
-- -- -- icon = icon used for target systems
Config.types = {
    ['coke'] = {
        amount = 1,
        model = 'xm3_prop_xm3_box_pile_tq_01a',
        chunks = 'prop_ld_crate_lid_01',
        loot = {
            -- Radius around which items will spawn from the crashed plane
            radius = 5.0,
            -- Amount of loot items that will be spawned
            amount = 5,
            loot = {
                {
                    hash = 'm23_1_prop_m31_roostercrate_03a',
                    items = {
                        {
                            item = 'armour',
                            chance = 30,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'WEAPON_COMBATPISTOL',
                            chance = 15,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'ammo-9',
                            chance = 30,
                            amount = {
                                min = 10,
                                max = 15,
                            },
                        },
                        -- {
                        --     item = 'recipe_1',
                        --     chance = 2,
                        --     amount = {
                        --         min = 1,
                        --         max = 1,
                        --     },
                        -- },
                        -- {
                        --     item = 'recipe_2',
                        --     chance = 2,
                        --     amount = {
                        --         min = 1,
                        --         max = 1,
                        --     },
                        -- },
                        -- {
                        --     item = 'recipe_3',
                        --     chance = 2,
                        --     amount = {
                        --         min = 1,
                        --         max = 1,
                        --     },
                        -- },
                        -- {
                        --     item = 'recipe_4',
                        --     chance = 2,
                        --     amount = {
                        --         min = 1,
                        --         max = 1,
                        --     },
                        -- }
                    },
                    chance = 100,
                    textureVariation = 0,
                    minimumDistanceBetween = 1.0,
                    offset = {
                        x = 0.0, y = 0.0, z = 0.0,
                    },
                    animation = Config.pickupAnimation,
                    labelSingular = 'Cocaine brick',
                    labelPlurar = 'Cocaine brick',
                    collectMessage = 'отворите тайната пратка',
                    icon = 'fas fa-box',
                },
            },
        },
    },
    ['tequila'] = {
        amount = 1,
        model = 'prop_lev_crate_01',
        chunks = 'prop_ld_crate_lid_01',
        loot = {
            -- Radius around which items will spawn from the crashed plane
            radius = 5.0,
            -- Amount of loot items that will be spawned
            amount = 5,
            loot = {
                {
                    hash = 'xm3_prop_xm3_product_box_01',
                    items = {
                        {
                            item = 'money',
                            chance = 80,
                            amount = {
                                min = 1500,
                                max = 3500,
                            },
                        },
                        {
                            item = 'money',
                            chance = 60,
                            amount = {
                                min = 1500,
                                max = 2500,
                            },
                        }
                    },
                    chance = 70,
                    textureVariation = 0,
                    minimumDistanceBetween = 1.0,
                    offset = {
                        x = 0.0, y = 0.0, z = 0.0,
                    },
                    animation = Config.pickupAnimation,
                    labelSingular = 'Tequila box',
                    labelPlurar = 'Tequila boxes',
                    collectMessage = 'отворите тайната пратка',
                    icon = 'fas fa-box',
                },
            },
        },
    },
}

Config = {}

Config.Debug = false

--SERVER SETTINGS
Config.HouseType = "Both" -- AllHouses | OnlyMission | Both
Config.InteractionType = "target" -- target or textui or 3dtext | which type of interaction you want
Config.QuasarLockpickMinigame = false -- if you use lockpick resource from qusar set this to true
Config.Framework = "qbcore" -- Set your framework! types: qbcore, ESX, standalone
Config.NewESX = true -- if you use esx 1.1 set this to false
Config.Target = "ox_target" -- Which Target system do u use? types: qb-target, qtarget, ox_target
Config.Dispatch = { enabled = true, script = "ps-dispatch" } -- cd_dispatch, linden_outlawalert, ps-disptach, core-dispatch
Config.NotificationType = "ox_lib" -- Notifications | types: ESX, ox_lib, qbcore
Config.Progress = "ox_lib" -- ProgressBars | types: progressBars, ox_lib, qbcore
Config.TextUI = "ox_lib" -- TextUIs | types: esx, ox_lib, luke
Config.Context = "ox_lib" -- Context | types: ox_lib, qbcore
Config.Input = "ox_lib" -- Input | types: ox_lib, qb-input
Config.TimeChange = true -- for realistic interior night time, can cause error when you dont use correct time sync!
Config.TimeSync = "none" -- Time Sync | types: cd_easytime, none, realtime
Config.PoliceJobs = { 'police', 'sheriff' } -- jobs for police counting
--PLAYER CONTROL
Config.Logs = { enabled = true, type = "webhook" } --Change webhook in  use webhook or ox_lib (datadog) Can be changed in server > sv_utils.lua
Config.DropPlayer = false -- Drop (Kick) Player if tries to cheat!
Config.AnticheatBan = false -- Change in server/sv_Utils.lua!!! WIll not work by default you need to add your custom trigger to ban player!

Config.DirtyMoney = false

Config.ResetHousesAfterTime = true -- reset houses
Config.ResetTime = 120 -- in minutes

Config.Lockpick = { item = "lockpick", remove = true } -- item for lockpicking house

Config.NeedBag = {
    enabled = true, -- if needed to enter the house 
    var = 44, --ID of the bag
    color = 0 -- Color ID of the bag
}

Config.NightRob = {
    enabled = false, -- if you want rob house only in night
    time = { 
        from = 22,  -- from 10:00 PM
        to = 6     -- to 6:00 AM
    }
}     

Config.Tier = {
    ["Low Tier"] = {
        chance = 50, -- change in mission to get this house type
        ReportChanceWhenEntering = 5,
        NeedPoliceCount = 0,
        InsidePositions = {
            ["Exit"] = { 
                coords = vector4(266.03, -1007.61, -101.0, 40.0),        
            },
            ["Saffron"] = {
                ChanceToFindNothing = 10,
                coords = vector3(265.937714, -999.368348, -99.008666),        
                Items = {
                    { Item = "romantic_book", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "notepad", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                    { Item = "pencil", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                    { Item = "weapon_knife", Chance = 70.5, MinCount = 1, MaxCount = 2 },
                    { Item = "bong", Chance = 80.5, MinCount = 1, MaxCount = 2 },
                }
            },
        },
        CreateProps = { -- Spawned props by script --
            ["pogo"] = { model = `vw_prop_vw_pogo_gold_01a`, Label = "Произведение на изкуството", Item = "pogo", Coords = vec4(262.03, -1000.62, -99.21, 3.4+180.0), propPlacement = { pos = vec3( 0.17, 0.0, 0.05), rot = vec3(16.0, 0.0, 0.0), bone = 18905 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, }
        },
        Safes = {
            ["safe"] = { model = `prop_ld_int_safe_01`, Label = "Сейф", NeedItem = true, Item = "lockpick", Coords = vec4(259.54, -1003.65, -99.01, 120.98), 
            ChanceToFindNothing = 0,
                Items = {
                    { Item = "gold_watch", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                    { Item = "gold_bracelet", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                    { Item = "earings", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                },
            }
        },
        Ped = {
            chance = 100, model = `s_m_y_dealer_01`, coords = vec4(262.6, -1004.04, -99.26, 86.94), weapon = { enabled = true, chance = 50, weapon = `WEAPON_COMBATPISTOL`, DisableWeaponDrop = true }
        },
        StaticProps = { --Props that are already in interior
            TV = { model = `prop_tv_03`, Label = "Телевизор", Item = "television", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, Robbed = false },
            SHOEBOX = { model = `v_res_fa_shoebox2`, Label = "Кутия за обувки", Item = "shoebox", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = false, Robbed = false },
            DECK = { model = `prop_dj_deck_02`, Label = "DJ пулт", Item = "dj_deck", propPlacement = { pos = vec3(-0.03, 0.07, -0.11), rot = vec3(-60.0, -60.0, 0.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, Robbed = false },
            CONSOLE = { model = `prop_console_01`, Label = "Конзола", Item = "console", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = false, Robbed = false },
            BOOMBOX = { model = `prop_boombox_01`, Label = "Бумбокс", Item = "boombox", propPlacement = { pos = vec3(0.26, 0.1, 0.23), rot = vec3(-150.0, -74.0, -14.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, Robbed = false },
            BONG = { model = `prop_bong_01`, Label = "Бонг", Item = "bong", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = false, Robbed = false },
        },
        HackDevice = {
            ["HackDevice"] = { model = `v_res_tre_alarmbox`, Label = "Хакване на аларма", NeedItem = true, Item = "hack_laptop", Coords = vec4(264.13, -1002.68, -98.81, 85.72) }
        },
        LaserChance = 100,
        Lasers = {
            ["laser_low1"] = { FromCoords = vector3(256.502, -994.856, -97.32), ToCoords = vector3(266.916, -1000.504, -99.618), Visible = true, chance = 30, spawned = false },
            ["laser_low2"] = { FromCoords = vector3(266.732, -994.51, -97.194), ToCoords = vector3(259.326, -1001.644, -99.938), Visible = false, chance = 100, spawned = false },
        },
    },
    ["Mid Tier"] = {
        chance = 50, -- change in mission to get this house type
        ReportChanceWhenEntering = 10,
        NeedPoliceCount = 0,
        InsidePositions = {
            ["Exit"] = { 
                coords = vector4(346.61, -1013.14, -99.2, 357.81),        
            },
            ["Bag of Cocaine"] = {
                ChanceToFindNothing = 10,
                coords = vector3(349.19, -994.83, -99.2),        
                Items = {
                    { Item = "notepad", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "pencil", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "weapon_knife", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "watch", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "necklace", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "bong", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                },
            },
            ["Book"] = {
                ChanceToFindNothing = 10,
                coords = vector3(345.3, -995.76, -99.2),        
                Items = {
                    { Item = "book", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "romantic_book", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "book", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                }
            },
            ["Bathroom"] = {
                ChanceToFindNothing = 10,
                coords = vector3(347.23, -994.09, -99.2),        
                Items = {
                    { Item = "toothpaste", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "body_spray", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "weapon_knife", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "toothpaste", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "watch", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "necklace", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "bracelet", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                }
            },
        },
        CreateProps = { -- Spawned props by script --
            ["laptop"] = { model = `xm_prop_x17_laptop_lester_01`, Label = "Лаптоп", Item = "laptop", Coords = vec4(349.67, -993.23, -99.19, 179.57), propPlacement = { pos = vec3( 0.17, 0.0, 0.05), rot = vec3(16.0, 0.0, 0.0), bone = 18905 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, }
        },
        Safes = {
            ["safe"] = { model = `prop_ld_int_safe_01`, Label = "Сейф", NeedItem = true, Item = "lockpick", Coords = vec4(347.7, -1000.0, -99.2, 266.0), 
            ChanceToFindNothing = 0,
                Items = {
                    { Item = "gold_watch", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                    { Item = "gold_bracelet", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                    { Item = "earings", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                },
            }
        },
        Ped = {
            chance = 100, model = `s_m_y_dealer_01`, coords = vec4(262.6, -1004.04, -99.26, 86.94), weapon = { enabled = true, chance = 50, weapon = `WEAPON_COMBATPISTOL`, DisableWeaponDrop = true }
        },
        StaticProps = { --Props that are already in interior
            TV = { model = `prop_tv_03`, Label = "Телевизор", Item = "television", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, Robbed = false },
            SHOEBOX = { model = `v_res_fa_shoebox2`, Label = "Кутия за обувки", Item = "shoebox", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = false, Robbed = false },
            DECK = { model = `prop_dj_deck_02`, Label = "DJ пулт", Item = "dj_deck", propPlacement = { pos = vec3(-0.03, 0.07, -0.11), rot = vec3(-60.0, -60.0, 0.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, Robbed = false },
            CONSOLE = { model = `prop_console_01`, Label = "Конзола", Item = "console", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = false, Robbed = false },
            BOOMBOX = { model = `prop_boombox_01`, Label = "Бумбокс", Item = "boombox", propPlacement = { pos = vec3(0.26, 0.1, 0.23), rot = vec3(-150.0, -74.0, -14.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, Robbed = false },
            BONG = { model = `prop_bong_01`, Label = "Бонг", Item = "bong", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = false, Robbed = false },
        },
        HackDevice = {
            ["HackDevice"] = { model = `v_res_tre_alarmbox`, Label = "Хакване на аларма", NeedItem = true, Item = "hack_laptop", Coords = vec4(264.13, -1002.68, -98.81, 85.72) }
        },
        LaserChance = 100,
        Lasers = {
            ["laser_mid1"] = { FromCoords = vector3(260.726, -997.249, -97.386), ToCoords = vector3(268.01, -1000.978, -98.26), Visible = true, chance = 30, spawned = false },
            ["laser_mid2"] = { FromCoords = vector3(263.539, -994.54, -97.34), ToCoords = vector3(258.004, -1003.52, -99.118), Visible = true, chance = 100, spawned = false },
        },
    },
    ["High Tier"] = {
        chance = 50, -- change in mission to get this house type
        ReportChanceWhenEntering = 15,
        NeedPoliceCount = 0,
        InsidePositions = {
            ["Exit"] = { 
                coords = vector4(346.61, -1013.14, -99.2, 357.81),        
            },
            ["Bag of Cocaine"] = {
                ChanceToFindNothing = 10,
                coords = vector3(349.19, -994.83, -99.2),        
                Items = {
                    { Item = "notepad", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "pencil", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "weapon_knife", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "watch", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "necklace", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "bong", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                },
            },
            ["Book"] = {
                ChanceToFindNothing = 10,
                coords = vector3(345.3, -995.76, -99.2),        
                Items = {
                    { Item = "book", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "romantic_book", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "book", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                }
            },
            ["Bathroom"] = {
                ChanceToFindNothing = 10,
                coords = vector3(347.23, -994.09, -99.2),        
                Items = {
                    { Item = "toothpaste", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "body_spray", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "weapon_knife", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "toothpaste", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "watch", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "necklace", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                    { Item = "bracelet", Chance = 30.9, MinCount = 1, MaxCount = 2 },
                }
            },
        },
        CreateProps = { -- Spawned props by script --
            ["laptop"] = { model = `xm_prop_x17_laptop_lester_01`, Label = "Лаптоп", Item = "laptop", Coords = vec4(349.67, -993.23, -99.19, 179.57), propPlacement = { pos = vec3( 0.17, 0.0, 0.05), rot = vec3(16.0, 0.0, 0.0), bone = 18905 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, }
        },
        Safes = {
            ["safe"] = { model = `prop_ld_int_safe_01`, Label = "Сейф", NeedItem = true, Item = "lockpick", Coords = vec4(347.7, -1000.0, -99.2, 266.0), 
            ChanceToFindNothing = 0,
                Items = {
                    { Item = "gold_watch", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                    { Item = "gold_bracelet", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                    { Item = "earings", Chance = 90.5, MinCount = 1, MaxCount = 2 },
                },
            }
        },
        Ped = {
            chance = 100, model = `s_m_y_dealer_01`, coords = vec4(262.6, -1004.04, -99.26, 86.94), weapon = { enabled = true, chance = 50, weapon = `WEAPON_COMBATPISTOL`, DisableWeaponDrop = true }
        },
        StaticProps = { --Props that are already in interior
            TV = { model = `prop_tv_03`, Label = "Телевизор", Item = "television", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, Robbed = false },
            SHOEBOX = { model = `v_res_fa_shoebox2`, Label = "Кутия за обувки", Item = "shoebox", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = false, Robbed = false },
            DECK = { model = `prop_dj_deck_02`, Label = "DJ пулт", Item = "dj_deck", propPlacement = { pos = vec3(-0.03, 0.07, -0.11), rot = vec3(-60.0, -60.0, 0.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, Robbed = false },
            CONSOLE = { model = `prop_console_01`, Label = "Конзола", Item = "console", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = false, Robbed = false },
            BOOMBOX = { model = `prop_boombox_01`, Label = "Бумбокс", Item = "boombox", propPlacement = { pos = vec3(0.26, 0.1, 0.23), rot = vec3(-150.0, -74.0, -14.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = true, Robbed = false },
            BONG = { model = `prop_bong_01`, Label = "Бонг", Item = "bong", propPlacement = { pos = vec3(0.1, 0.42, 0.26), rot = vec3(-172.0, 182.0, -38.0), bone = 60309 }, CarryAnim = { dict = "anim@heists@box_carry@", anim = "idle" }, NeedTrunk = false, Robbed = false },
        },
        HackDevice = {
            ["HackDevice"] = { model = `v_res_tre_alarmbox`, Label = "Хакване на аларма", NeedItem = true, Item = "hack_laptop", Coords = vec4(264.13, -1002.68, -98.81, 85.72) }
        },
        LaserChance = 100,
        Lasers = {
            ["laser_high1"] = { FromCoords = vector3(261.737, -999.014, -97.386), ToCoords = vector3(268.5, -1002.138, -99.226), Visible = true, chance = 30, spawned = false },
            ["laser_high2"] = { FromCoords = vector3(261.206, -996.43, -97.224), ToCoords = vector3(260.293, -1001.16, -98.806), Visible = false, chance = 100, spawned = false },
        },
        HackDevice = {
            ["HackDevice"] = { model = `v_res_tre_alarmbox`, Label = "Хакване на аларма", NeedItem = true, Item = "hack_laptop", Coords = vec4(-781.71, 322.85, 188.19, 178.39 + 180.0) }
        },
        LaserChance = 100,
        Lasers = {
            ["laser_high1"] = { FromCoords = vector3(-791.046, 323.082, 190.122), ToCoords = vector3(-784.37, 327.042, 186.39), Visible = true, chance = 100 },
            ["laser_high2"] = { FromCoords = vector3(-792.338, 332.824, 192.952), ToCoords = vector3(-790.828, 343.812, 186.186), Visible = true, chance = 100 },
            ["laser_high3"] = { FromCoords = vector3(-794.62, 339.754, 192.808), ToCoords = vector3(-801.228, 331.73, 189.854), Visible = true, chance = 100 },
            ["laser_high4"] = { FromCoords = vector3(-781.26, 324.88, 190.46), ToCoords = vector3(-793.62, 332.88, 186.27), Visible = true, chance = 100 },
        },
        
    }
}

Config.HousesToRob = {
    ["Low Tier 1"] = {
        Coords = vec3(430.2, -1559.48, 32.82),
        Residence = Config.Tier["Low Tier"],
        Hints = {
            'ПОДСКАЗКА: Има скара близо до вратите',
            'ПОДСКАЗКА: На втория етаж е',
            'ПОДСКАЗКА: Има стълби близо до вратите',
            'ПОДСКАЗКА: Има столове близо до вратите',
            'ПОДСКАЗКА: Това е голяма жилищна сграда'
        }
    },
    ["Low Tier 2"] = {
        Coords = vec3(1391.078, -1508.35, 58.43),
        Residence = Config.Tier["Low Tier"],
        Hints = {
            'ПОДСКАЗКА: Светлокафява къща',
            'ПОДСКАЗКА: Графит на Исус на оградата',
            'ПОДСКАЗКА: Счупен ван близо до къщата',
            'ПОДСКАЗКА: Син гараж до тази къща',
        }
    },
    ["Low Tier 3"] = {
        Coords = vec3(1344.677, -1513.24, 54.585),
        Residence = Config.Tier["Low Tier"],
        Hints = {
            'ПОДСКАЗКА: Светлозелена към бяла къща',
            'ПОДСКАЗКА: Счупена кола на верандата',
            'ПОДСКАЗКА: Гуми близо до вратите',
            'ПОДСКАЗКА: Трябва да влезете през задната врата',
        }
    },
    ["Low Tier 4"] = {
        Coords = vec3(1334.00, -1566.46, 54.447),
        Residence = Config.Tier["Low Tier"],
        Hints = {
            'ПОДСКАЗКА: Син чадър близо до вратата',
            'ПОДСКАЗКА: Червен гараж до тази къща',
            'ПОДСКАЗКА: Червена и бяла ограда',
        }
    },
    ["Low Tier 5"] = {
        Coords = vec3(1205.712, -1607.179, 50.7),
        Residence = Config.Tier["Low Tier"],
        Hints = {
            'ПОДСКАЗКА: Син кош за боклук',
            'ПОДСКАЗКА: Кутии близо до вратите',
            'ПОДСКАЗКА: Цвете близо до вратите',
        }
    },
    ["Low Tier 6"] = {
        Coords = vec3(1203.47, -1670.49, 42.98),
        Residence = Config.Tier["Low Tier"],
        Hints = {
            'ПОДСКАЗКА: Синя къща',
            'ПОДСКАЗКА: Дълги стълби водещи към тази къща',
            'ПОДСКАЗКА: Жълт хидрант и червен боклук',
        }
    },
    ["Mid Tier 1"] = {
        Coords = vec3(-957.30, -1566.75, 5.0187458992004),
        Residence = Config.Tier["Mid Tier"],
        Hints = {
            'ПОДСКАЗКА: Долни врати',
            'ПОДСКАЗКА: Тунел',
            'ПОДСКАЗКА: Бели врати с прозорец',
        }
    },
    ["Mid Tier 2"] = {
        Coords = vector4(-1063.09, -1641.55, 4.4, 312.95495605468),
        Residence = Config.Tier["Mid Tier"],
        Hints = {
            'ПОДСКАЗКА: Електричество близо до вратите',
            'ПОДСКАЗКА: Сива къща',
            'ПОДСКАЗКА: Зад бяла ограда близо до кактус',
        }
    },
    ["Mid Tier 3"] = {
        Coords = vector4(-1093.91, -1608.44, 8.39, 302.19357299804),
        Residence = Config.Tier["Mid Tier"],
        Hints = {
            'ПОДСКАЗКА: Врати нагоре по стълбите',
            'ПОДСКАЗКА: Климатик',
            'ПОДСКАЗКА: До розова къща',
            'ПОДСКАЗКА: Бяла и синя къща',
            'ПОДСКАЗКА: Ограден храст',
            'ПОДСКАЗКА: Син кош за боклук',
        }
    },
    ["High Tier 1"] = {
        Coords = vector4(216.44, 620.49, 187.75, 74.529731750488),
        Residence = Config.Tier["High Tier"],
        Hints = {
            'ПОДСКАЗКА: Светлокафява къща',
            'ПОДСКАЗКА: Камера до вратите',
            'ПОДСКАЗКА: Знак за продажба',
            'ПОДСКАЗКА: Кафяв гараж',
            'ПОДСКАЗКА: 2 етажа',
            'ПОДСКАЗКА: Няма къща отдясно',
        }
    },
    ["High Tier 2"] = {
        Coords = vector4(128.08, 565.98, 183.959, 13.116044998168),
        Residence = Config.Tier["High Tier"],
        Hints = {
            'ПОДСКАЗКА: Бяла къща',
            'ПОДСКАЗКА: Светлина до вратите',
            'ПОДСКАЗКА: Знак Bobcat',
            'ПОДСКАЗКА: Кафяв гараж',
            'ПОДСКАЗКА: 1 етаж',
            'ПОДСКАЗКА: Бяла ограда близо до вратите с мотоциклет отзад',
        }
    },
}

--Shop
Config.Shop = {
    enabled = true,   
    Header = "Tech guy Shop",
    Items = {
        { label = 'Лазерен прах', item = 'powder', description = "Купете лазерен откриващ прах за: $", price = 20, MinAmount = 1, MaxAmount = 20},
        { label = 'Хакерски лаптоп', item = 'hack_laptop', description = "Купете лаптоп за: $", price = 500, MinAmount = 1, MaxAmount = 2 },
        { label = 'Шперц', item = 'lockpick', description = "Купете шперц за: $", price = 120, MinAmount = 1, MaxAmount = 20 },
        { label = 'Сак', item = 'loot_bag', description = "Купете сак за: $", price = 100, MinAmount = 1, MaxAmount = 20 },
        { label = 'Локатор на къща', item = 'house_locator', description = "Купете локатор за: $", price = 100, MinAmount = 1, MaxAmount = 20 },

    },
    Ped = {
        model = `s_m_y_waretech_01`, 
        coords = vec4(190.05, 307.92, 104.39, 173.98), 
        scenario = "WORLD_HUMAN_AA_SMOKE"
    },
    blip = {
        name = "Tech Guy", 
    },
}

--SellShop
Config.SellShop = {
    enabled = true,   
    EnabledSellAll = true,
    Header = "Sell",
    Items = {
        { label = 'Телевизор', item = 'television', description = "Продайте квадратен телевизор за: $", price = 100, MinAmount = 1, MaxAmount = 20},
        { label = 'Кутия за обувки', item = 'shoebox', description = "Продайте кутия за обувки за: $", price = 40, MinAmount = 1, MaxAmount = 2},
        { label = 'DJ пулт', item = 'dj_deck', description = "Продайте DJ пулт за: $", price = 120, MinAmount = 1, MaxAmount = 20 },
        { label = 'Конзола', item = 'console', description = "Продайте конзола за: $", price = 90, MinAmount = 1, MaxAmount = 20 },
        { label = 'Бумбокс', item = 'boombox', description = "Продайте бумбокс за: $", price = 150, MinAmount = 1, MaxAmount = 20 },
        { label = 'Бонг', item = 'bong', description = "Продайте бонг за: $", price = 50, MinAmount = 1, MaxAmount = 20 },
        { label = 'Статуя Pogo', item = 'pogo', description = "Продайте художествена творба за: $", price = 1500, MinAmount = 1, MaxAmount = 20 },
        { label = 'Плосък телевизор', item = 'flat_television', description = "Продайте плосък телевизор за: $", price = 500, MinAmount = 1, MaxAmount = 20 },
        { label = 'Кафе машина', item = 'coffemachine', description = "Продайте кафе машина за: $", price = 90, MinAmount = 1, MaxAmount = 20 },
        { label = 'Сешоар', item = 'hairdryer', description = "Продайте сешоар за: $", price = 20, MinAmount = 1, MaxAmount = 20 },
        { label = 'Телефон', item = 'j_phone', description = "Продайте телефон за: $", price = 40, MinAmount = 1, MaxAmount = 20 },
        { label = 'Скулптура', item = 'sculpture', description = "Продайте скулптура за: $", price = 300, MinAmount = 1, MaxAmount = 20 },
        { label = 'Тоалетни принадлежности', item = 'toiletry', description = "Продайте тоалетни принадлежности за: $", price = 10, MinAmount = 1, MaxAmount = 20 },
        { label = 'Лаптоп', item = 'laptop', description = "Продайте лаптоп за: $", price = 80, MinAmount = 1, MaxAmount = 20 },
        { label = 'Монитор', item = 'monitor', description = "Продайте монитор за: $", price = 80, MinAmount = 1, MaxAmount = 20 },
        { label = 'Принтер', item = 'printer', description = "Продайте принтер за: $", price = 60, MinAmount = 1, MaxAmount = 20 },
        { label = 'Часовник', item = 'watch', description = "Продайте часовник за: $", price = 90, MinAmount = 1, MaxAmount = 20 },
        { label = 'Паста за зъби', item = 'toothpaste', description = "Продайте паста за зъби за: $", price = 4, MinAmount = 1, MaxAmount = 20 },
        { label = 'Сапун', item = 'soap', description = "Продайте сапун за: $", price = 2, MinAmount = 1, MaxAmount = 20 },
        { label = 'Шампоан', item = 'shampoo', description = "Продайте шампоан за: $", price = 16, MinAmount = 1, MaxAmount = 20 },
        { label = 'Романтична книга', item = 'romantic_book', description = "Продайте романтична книга за: $", price = 20, MinAmount = 1, MaxAmount = 20 },
        { label = 'Колие', item = 'necklace', description = "Продайте колие за: $", price = 150, MinAmount = 1, MaxAmount = 20 },
        { label = 'Златен часовник', item = 'gold_watch', description = "Продайте златен часовник за: $", price = 300, MinAmount = 1, MaxAmount = 20 },
        { label = 'Златна гривна', item = 'gold_bracelet', description = "Продайте златна гривна за: $", price = 200, MinAmount = 1, MaxAmount = 20 },
        { label = 'Гривна', item = 'bracelet', description = "Продайте гривна за: $", price = 50, MinAmount = 1, MaxAmount = 20 },
        { label = 'Обеци', item = 'earings', description = "Продайте обеци за: $", price = 110, MinAmount = 1, MaxAmount = 20 },
        { label = 'Книга', item = 'book', description = "Продайте книга за: $", price = 10, MinAmount = 1, MaxAmount = 20 },
        { label = 'Черепнo изкуство', item = 'skull', description = "Продайте черепнo изкуство за: $", price = 1000, MinAmount = 1, MaxAmount = 20 },
        { label = 'Молив', item = 'pencil', description = "Продайте молив за: $", price = 10, MinAmount = 1, MaxAmount = 20 },
        { label = 'Бележник', item = 'notepad', description = "Продайте бележник за: $", price = 20, MinAmount = 1, MaxAmount = 20 },
        { label = 'Магнетофон', item = 'tapeplayer', description = "Продайте магнетофон за: $", price = 100, MinAmount = 1, MaxAmount = 20 },
    },
    Ped = {
        model = `a_m_m_eastsa_01`, 
        coords = vec4(453.66, -1305.08, 29.12, 243.6), 
        scenario = "WORLD_HUMAN_AA_COFFEE"
    },
}

Config.StartMission = {
    SendToTechGuy = true,
    time = { -- in Hours
        enabled = false,
        from = 22,  -- from 10:00 PM
        to = 6      -- to 6:00 AM
    },
    Ped = {
        model = `cs_fbisuit_01`, 
        coords = vec4(-570.56, 311.4, 83.49, 356.13), 
        scenario = "WORLD_HUMAN_SMOKING" 
    },
    Vehicle = {    
        enabled = true,    
        Model = "burrito3",
        SpawnPoints = {
            { Coords = vector3(-573.5, 314.88, 83.54), Heading = 356.13, Radius = 3.0 },
            { Coords = vector3(-577.1, 315.14, 83.66), Heading = 356.13, Radius = 3.0 }
        }, 
    }
}
--ONLY CONFIG NAMED sh_config.lua will work!

Config = {}

Config.Debug = false -- Debug
--SERVER SETTINGS
Config.Framework = "qbcore" -- Framework | types: auto-detect, qbcore, ESX, standalone

Config.NewESX = false

Config.Target = "ox_target" -- Target | types: auto-detect, qb-target, qtarget, ox_target
Config.BossMenu = "qb-management" -- BossMenu | types: auto-detect, esx_society, qb-management

Config.NotificationType = "ox_lib" -- Notifications | types: ESX, ox_lib, qbcore
Config.Progress = "ox_lib_circle" -- ProgressBar | types: progressBars, ox_lib_square, ox_lib_circle, qbcore | Preview: ox_lib_square = https://imgur.com/bgVWs4u , ox_lib_circle = https://imgur.com/Tfq8CA0 , qbcore = https://imgur.com/ru33FYA
Config.Clothing = "auto-detect" -- Skin / Clothing | types: auto-detect, esx_skin, qb-clothing, fivem-appearance, ox_appearance
Config.Context = "ox_lib" -- Context | types: ox_lib, qbcore
Config.Input = "ox_lib" -- Input | types: ox_lib, qb-input
Config.PoliceJobs = { 'police' } -- Jobs which can be alerted
Config.Dispatch = { enabled = false, script = "ps-disptach" } -- cd_dispatch, linden_outlawalert, ps-disptach
--PLAYER SETTINGS
Config.JobName = "beanmachine" -- Job name for beanmachine
Config.BossGrade = 5 -- Boss Grade
Config.NeedDuty = true -- Required duty to make drinks etc.
Config.NeedCleanHands = false -- Required to clean hands to make drinks etc.

Config.Logs = { enabled = true, type = "webhook" } -- use webhook or ox_lib (datadog) Can be changed in server > sv_utils.lua
Config.DropPlayer = false -- Drop (Kick) Player if tries to cheat!
Config.AnticheatBan = false -- Change in server/sv_Utils.lua!!! WIll not work by default you need to add your custom trigger to ban player!

Config.Inventory = "ox" -- auto-detect, ox, quasar, chezza, qb

Config.MLO = "gabz" -- gabz, uj, slth -- dont change!

Config.beanmachine = {

    PolyZone = {
        coords = vector3(299.01, -924.04, 57.84), size = vec3(100.0, 100.0, 100.0), rotation = 270, debug = false, RemovePeds = true, radius = 50.0
    },

    Garage = {
        Ped = {
            { Model = "s_m_y_xmech_01", Coords = vec4(308.28, -910.82, 28.30, 13.15),
                Scenario = "WORLD_HUMAN_CLIPBOARD_FACILITY"
            }
        },
        Vehicles = {
            { Model = "nspeedo", Label = "Vapid Speedo", livery = 0, image = "https://cdn.discordapp.com/attachments/936585783761051658/1107928643906314251/image.png", metadata = {""}, },
        },
        SpawnPoints = {
            { Coords = vector3(303.36, -904.66, 29.29), Heading = 67.40, Radius = 3.0 }
        },
    },

    AlertPolice = vec3(303.36, -904.66, 29.29),

    Delivery = vec3(329.40, -885.95, 60.16),

    SpawnObjects = true,

    Sinks = {
        Zones = {
            Sink = {
                coords = vector3(332.23, -884.85, 60.12),
                radius = 0.35,
                debug = false,
                WaterStream = vector3(332.23, -885.85, 61.12),
            },
        },

        Crafting = {
            CleanLatteCup = {
                Title = "Изчисти мръсната чаша за лате", 
                description = "Изисква предмет: Мръсна чаша за лате",
                image = "https://i.imgur.com/v6vULUD.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dirty_latte_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "latte_cup ", count = 1 },
                }
            },
            CleanDirtyGlass = {
                Title = "Изчисти мръсна чаша", 
                description = "Изисква предмет: Мръсна чаша",
                image = "https://i.imgur.com/ys9lxDt.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dirty_glass", count = 1, remove = true },
                },
                AddItems = {
                    { item = "glass", count = 1 },
                }
            },
            CleanPlate = {
                Title = "Изчисти мръсна чиния",
                description = "Requited Item: Мръсна чиния",
                image = "https://i.imgur.com/gmXbU25.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dirty_plate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "plate", count = 1 },
                }
            },
        },
    },
    ToiletSinks = {

    },

    Toilets = {

    },
    Duty = {
        Main = { coords = vector3(298.98, -928.73, 58.37), radius = 0.4, debug = false },
    },

    CloakRoom = {
        Main = { coords = vector3(0, 0, 0), radius = 0.4, debug = false },
    },

    Coffeemachine = {
        Zones = {
            Main = { coords = vector3(327.60, -890.13, 60.43), radius = 0.40, debug = false },
            -- Main2 = { coords = vector3(122.72, -1041.56, 29.46), radius = 0.25, debug = false },
        },

        Crafting = {
            espresso = {
                Title = "Еспресо",
                description = "Изисквания: Чаша за кафе, Кафени зърна",
                image = "https://i.imgur.com/hdRUFC5.png",
                metadata = {""},
                RequiredItems = {
                    { item = "coffee_cup", count = 1, remove = true },
                    { item = "coffee_beans", count = 1, remove = true },
                },
                AddItems = {
                    { item = "espresso", count = 1 },
                }
            },
            latte = {
                Title = "Лате макиато",
                description = "Изисквания: Еспресо, Мляко, Чаша за лате",
                image = "https://i.imgur.com/lwWKDj3.png",
                metadata = {""},
                RequiredItems = {
                    { item = "espresso", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "latte_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "latte_macchiato", count = 1 },
                }
            },
            cappucino = {
                Title = "Капучино",
                description = "Изисквания: Еспресо, Мляко, Чаша за кафе",
                image = "https://i.imgur.com/Wc90YUr.png",
                metadata = {""},
                RequiredItems = {
                    { item = "espresso", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "coffee_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "cappuccino", count = 1 },
                }
            },
            ristretto = {
                Title = "Ристрето",
                description = "Изисквания: Еспресо, Сметана, Чаша за кафе",
                image = "https://i.imgur.com/QYxQNsF.png",
                metadata = {""},
                RequiredItems = {
                    { item = "espresso", count = 1, remove = true },
                    { item = "crema", count = 1, remove = true },
                    { item = "coffee_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "ristretto", count = 1 },
                }
            },
            lungo = {
                Title = "Еспресо Лунго",
                description = "Изисквания: Еспресо, Сметана, Чаша за кафе",
                image = "https://i.imgur.com/uzHiCMJ.png",
                metadata = {""},
                RequiredItems = {
                    { item = "espresso", count = 1, remove = true },
                    { item = "crema", count = 1, remove = true },
                    { item = "coffee_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "lungo", count = 1 },
                }
            },
            flatwhite = {
                Title = "Еспресо с мляко",
                description = "Изисквания: Еспресо, Мляко, Чаша за кафе",
                image = "https://i.imgur.com/OEV5zdR.png",
                metadata = {""},
                RequiredItems = {
                    { item = "espresso", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "coffee_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "flatwhite", count = 1 },
                }
            },
            affogato = {
                Title = "Кафе мелба",
                description = "Изисквания: Еспресо, Сладолед, Чаша за кафе",
                image = "https://i.imgur.com/G1yFYXS.png",
                metadata = {""},
                RequiredItems = {
                    { item = "espresso", count = 1, remove = true },
                    { item = "icecream", count = 1, remove = true },
                    { item = "coffee_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "affogato", count = 1 },
                }
            },
            irish = {
                Title = "Ирландско",
                description = "Изисквания: Еспресо, Уйски, Захар, Сметана, Чаша за лате",
                image = "https://i.imgur.com/3ygf0C3.png",
                metadata = {""},
                RequiredItems = {
                    { item = "espresso", count = 1, remove = true },
                    { item = "whiskey", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "crema", count = 1, remove = true },
                    { item = "latte_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "irish", count = 1 },
                }
            },
            turkish_coffee = {
                Title = "Турско кафе",
                description = "Изисквания: Захар, Турски кафе зърна, Чаша за кафе",
                image = "https://i.imgur.com/Xo045VU.png",
                metadata = {""},
                RequiredItems = {
                    { item = "sugar", count = 1, remove = true },
                    { item = "turkish_coffee_beans", count = 1, remove = true },
                    { item = "coffee_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "turkish_coffee", count = 1 },
                }
            },
            hot_chocolate = {
                Title = "Топъл шоколад",
                description = "Изисквания: Шоколад, Шоколадов топинг, Сметана, Чаша за лате",
                image = "https://i.imgur.com/2HHVP1E.png",
                metadata = {""},
                RequiredItems = {
                    { item = "chocolate", count = 1, remove = true },
                    { item = "chocolate_topping", count = 1, remove = true },
                    { item = "crema", count = 1, remove = true },
                    { item = "latte_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "hot_chocolate", count = 1 },
                }
            },
        },
    },

    Desert = {
        Zones = {
            Main = { coords = vector3(vector3(332.50, -882.01, 60.69)), radius = 0.46, debug = false },
        },
        Crafting = {
            blackberry_muffin = {
                Title = "Къпинов мъфин",
                description = "Изисква предмет: Чаша за мъфин, Къпина, Мъфин",
                image = "https://i.imgur.com/DU3dU2k.png",
                metadata = {""},
                RequiredItems = {
                    { item = "muffin_cups", count = 1, remove = true },
                    { item = "blackberry", count = 1, remove = true },
                    { item = "muffin", count = 1, remove = true },
                },
                AddItems = {
                    { item = "blackberry_muffin", count = 1 },
                }
            },
            lychee_muffin = {
                Title = "Личи мъфин",
                description = "Изисква предмет: Чаша за мъфин, Личи, Мъфин",
                image = "https://i.imgur.com/jAFNaps.png",
                metadata = {""},
                RequiredItems = {
                    { item = "muffin_cups", count = 1, remove = true },
                    { item = "lychee", count = 1, remove = true },
                    { item = "muffin", count = 1, remove = true },
                },
                AddItems = {
                    { item = "lychee_muffin", count = 1 },
                }
            },
            oreo_muffin = {
                Title = "Орео мъфин",
                description = "Изисква предмет: Чаша за мъфин, Орео, Мъфин",
                image = "https://i.imgur.com/tlLH6gY.png",
                metadata = {""},
                RequiredItems = {
                    { item = "muffin_cups", count = 1, remove = true },
                    { item = "oreo", count = 1, remove = true },
                    { item = "muffin", count = 1, remove = true },
                },
                AddItems = {
                    { item = "oreo_muffin", count = 1 },
                }
            },
            chocolate_muffin = {
                Title = "Шоколадов мъфин",
                description = "Изисква предмет: Чаша за мъфин, Шоколад, Мъфин",
                image = "https://i.imgur.com/Wrq7PWZ.png",
                metadata = {""},
                RequiredItems = {
                    { item = "muffin_cups", count = 1, remove = true },
                    { item = "chocolate", count = 1, remove = true },
                    { item = "muffin", count = 1, remove = true },
                },
                AddItems = {
                    { item = "chocolate_muffin", count = 1 },
                }
            },
            pink_donut = {
                Title = "Розова поничка",
                description = "Изисква предмет: Поничка, Розов топинг",
                image = "https://i.imgur.com/GDDiTmf.png",
                metadata = {""},
                RequiredItems = {
                    { item = "donut", count = 1, remove = true },
                    { item = "pink_topping", count = 1, remove = true },
                },
                AddItems = {
                    { item = "pink_donut", count = 1 },
                }
            },
            vanilla_donut = {
                Title = "Ванилова поничка",
                description = "Изисква предмет: Поничка, Бял топинг, Пръчици с цветовете на дъгата",
                image = "https://i.imgur.com/3xVihSc.png",
                metadata = {""},
                RequiredItems = {
                    { item = "donut", count = 1, remove = true },
                    { item = "white_topping", count = 1, remove = true },
                    { item = "rainbow_sprinkles", count = 1, remove = true },
                },
                AddItems = {
                    { item = "vanilla_donut", count = 1 },
                }
            },
            classic_donut = {
                Title = "Класическа поничка",
                description = "Изисква предмет: Поничка, Захар",
                image = "https://i.imgur.com/K0t6z7u.png",
                metadata = {""},
                RequiredItems = {
                    { item = "donut", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                },
                AddItems = {
                    { item = "donut", count = 1 },
                }
            },
            chocolate_donut = {
                Title = "Шоколадова поничка",
                description = "Изисква предмет: Поничка, Шоколадов топинг, Фъстъчени пръчици",
                image = "https://i.imgur.com/XOfVX8v.png",
                metadata = {""},
                RequiredItems = {
                    { item = "donut", count = 1, remove = true },
                    { item = "chocolate_topping", count = 1, remove = true },
                    { item = "peanuts_sprinkles", count = 1, remove = true },
                },
                AddItems = {
                    { item = "chocolate_donut", count = 1 },
                }
            },
        },
    },

    Tables = {
        Zones = {
            Main = { coords = vector3(332.11, -889.98, 59.84), radius = 0.55, debug = false },
        },
        
        Crafting = {
            toast = {
                Title = "Тост с шунка и кашкавал",
                description = "Изисква предмет: Препечен хляб, Масло, Шунка, Кашкавал, Чиния",
                image = "https://i.imgur.com/2BHt7j5.png",
                metadata = {""},
                RequiredItems = {
                    { item = "toast_bread", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                    { item = "ham", count = 1, remove = true },
                    { item = "cheese", count = 1, remove = true },
                    { item = "plate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "toast", count = 1 },
                }
            },
        },
    },

    Dispensor = {
        Zones = {
            Main = { coords = vector3(327.60, -890.13, 60.43), radius = 0.40, debug = false },
        },
        
        Crafting = {
            MintTea = {
                Title = "Ментов чай",
                description = "Изисква предмет: Чаена чаша, Мента",
                image = "https://i.imgur.com/MW99QlQ.png",
                metadata = {""},
                RequiredItems = {
                    { item = "glass", count = 1, remove = true },
                    { item = "mint", count = 1, remove = true },
                },
                AddItems = {
                    { item = "mintea", count = 1 },
                }
            },
            GreenTea = {
                Title = "Зелен чай",
                description = "Изисква предмет: Чаена чаша, Зелени листа",
                image = "https://i.imgur.com/yXqrYkk.png",
                metadata = {""},
                RequiredItems = {
                    { item = "glass", count = 1, remove = true },
                    { item = "greenleaf", count = 1, remove = true },
                },
                AddItems = {
                    { item = "greentea", count = 1 },
                }
            },
            JasmineTea = {
                Title = "Жасминов чай",
                description = "Изисква предмет: Чаена чаша, Жасмин",
                image = "https://i.imgur.com/hP4e8JT.png",
                metadata = {""},
                RequiredItems = {
                    { item = "glass", count = 1, remove = true },
                    { item = "jasmine", count = 1, remove = true },
                },
                AddItems = {
                    { item = "jasminetea", count = 1 },
                }
            },
        },
    },

    CrushedIce = {
        Zones = {
            Main = { coords = vector3(330.88, -891.51, 59.73), radius = 0.50, debug = false },
        },
        
        Crafting = {
            multivitamin_crushedice = {
                Title = "Мултивитамини",
                description = "Изисква предмет: Чаша",
                image = "https://i.imgur.com/WLbt94L.png",
                metadata = {""},
                RequiredItems = {
                    { item = "cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "multivitamin_crushedice", count = 1 },
                }
            },
            lemon_crushedice = {
                Title = "Лимон",
                description = "Изисква предмет: Чаша",
                image = "https://i.imgur.com/EOQ3vrH.png",
                metadata = {""},
                RequiredItems = {
                    { item = "cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "lemon_crushedice", count = 1 },
                }
            },
        },
    },

    BossMenu = {
          Main = { coords = vector3(301.23, -929.01, 58.6), radius = 0.4, debug = false },
     },

    Registers = {
        FrontBar = { coords = vector3(301.23, -929.01, 58.6), radius = 0.4, debug = false, amount = 0 },
        FrontBar2 = { coords = vector3(328.26, -885.6, 60.5), radius = 0.4, debug = false, amount = 0 },
    },


    Stashes = {
        Stash1 = {
            name = "beanmachine_stash1",
            label = "Stash #1",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 40000, -- 40 KG
            coords = vector3(329.77, -891.55, 59.49),
            radius = 0.4,
            debug = false,
            job = "beanmachine"
        },

        Stash2 = {
            name = "beanmachine_stash2",
            label = "Stash #2",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 40000, -- 40 KG
            coords = vector3(301.33, -926.91, 58.38),
            radius = 0.4,
            debug = false,
            job = "beanmachine"
        },

        -- Stash3 = {
        --     name = "beanmachine_stash3",
        --     label = "Stash #3",
        --     TargetIcon = "fas fa-warehouse",
        --     TargetLabel = "Stash",
        --     Slots = 40,
        --     Weight = 40000, -- 40 KG
        --     coords = vector3(332.04, -884.94, 58.93),
        --     radius = 0.4,
        --     debug = false,
        --     job = "beanmachine"
        -- },

        -- Stash4 = {
        --     name = "beanmachine_stash4",
        --     label = "Stash #4",
        --     TargetIcon = "fas fa-warehouse",
        --     TargetLabel = "Stash",
        --     Slots = 40,
        --     Weight = 40000, -- 40 KG
        --     coords = vector3(332.04, -884.94, 58.93),
        --     radius = 0.4,
        --     debug = false,
        --     job = "beanmachine"
        -- },

        -- Stash5 = {
        --     name = "beanmachine_stash4",
        --     label = "Stash #4",
        --     TargetIcon = "fas fa-warehouse",
        --     TargetLabel = "Stash",
        --     Slots = 40,
        --     Weight = 40000, -- 40 KG
        --     coords = vector3(332.04, -884.94, 58.93),
        --     radius = 0.4,
        --     debug = false
        -- },
        -- Stash6 = {
        --     name = "beanmachine_stash4",
        --     label = "Stash #4",
        --     TargetIcon = "fas fa-warehouse",
        --     TargetLabel = "Stash",
        --     Slots = 40,
        --     Weight = 40000, -- 40 KG
        --     coords = vector3(332.04, -884.94, 58.93),
        --     radius = 0.4,
        --     debug = false
        -- },

        Table1 = {
            name = "beanmachine_table1",
            label = "Beanmachine Tray #1",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Tray",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(302.78, -931.11, 62.02),
            radius = 0.4,
            debug = false
        },
        Table2 = {
            name = "beanmachine_table2",
            label = "Beanmachine Tray #2",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Tray",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(301.27, -925.38, 62.02),
            radius = 0.4,
            debug = false
        },

        Table3 = {
            name = "beanmachine_table3",
            label = "Beanmachine Table #3",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(298.1, -930.45, 62.02),
            radius = 0.4,
            debug = false
        },
        Table4 = {
            name = "beanmachine_table4",
            label = "Beanmachine Table #4",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(327.40, -888.83, 60.24),
            radius = 0.4,
            debug = false
        },
        Table5 = {
            name = "beanmachine_table5",
            label = "Beanmachine Table #5",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 1000, -- 10 KG
            coords = vector3(292.52, -921.99, 57.83),
            radius = 0.4,
            debug = false
        },
        Table6 = {
            name = "beanmachine_table6",
            label = "Beanmachine Table #6",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(290.94, -926.26, 57.83),
            radius = 0.4,
            debug = false
        },
        Table7 = {
            name = "beanmachine_table7",
            label = "Beanmachine Table #7",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(289.31, -930.77, 57.83),
            radius = 0.4,
            debug = false
        },
        Table8 = {
            name = "beanmachine_table8",
            label = "Beanmachine Table #8",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(285.9, -935.66, 57.89),
            radius = 0.4,
            debug = false
        },
        Table9 = {
            name = "beanmachine_table9",
            label = "Beanmachine Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(292.82, -932.13, 57.83),
            radius = 0.4,
            debug = false
        },
        Table10 = {
            name = "beanmachine_table9",
            label = "Beanmachine Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(294.52, -927.89, 57.83),
            radius = 0.4,
            debug = false
        },
        Table11 = {
            name = "beanmachine_table9",
            label = "Beanmachine Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(288.56, -920.52, 57.83),
            radius = 0.4,
            debug = false
        },
        Table12 = {
            name = "beanmachine_table9",
            label = "Beanmachine Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(286.89, -924.84, 57.89),
            radius = 0.4,
            debug = false
        },
        Table13 = {
            name = "beanmachine_table9",
            label = "Beanmachine Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(285.28, -929.21, 57.83),
            radius = 0.4,
            debug = false
        },
        Table14 = {
            name = "beanmachine_table9",
            label = "Beanmachine Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(302.05, -891.88, 59.53),
            radius = 0.4,
            debug = false
        },
        Table15 = {
            name = "beanmachine_table9",
            label = "Beanmachine Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(303.85, -886.84, 59.54),
            radius = 0.4,
            debug = false
        },
        Table16 = {
            name = "beanmachine_table9",
            label = "Beanmachine Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(305.24, -922.65, 57.77),
            radius = 0.4,
            debug = false
        },
        Table17 = {
            name = "beanmachine_table9",
            label = "Beanmachine Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(308.1, -925.54, 57.77),
            radius = 0.4,
            debug = false
        },
        Table18 = {
            name = "beanmachine_table9",
            label = "Beanmachine Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 10000, -- 10 KG
            coords = vector3(305.06, -928.49, 57.77),
            radius = 0.4,
            debug = false
        },

    },
}

--BLIPS
Config.Blips = {
   --[[  beanmachine = { -- do not use same value twice (will result in overwriting of blip)
         BlipCoords = vec3(287.67, -915.29, 56.21), -- Blip coords
         Sprite = 106, -- Blip Icon
         Display = 4, -- keep 4
         Scale = 0.7, -- Size of blip
         Colour = 31, -- colour
         Name = "Rooftop Cafe" -- Blip name
     },]]
 }

-- --Job BLIPS
 Config.JobBlips = {
   --[[  PawnShop = { -- do not use same value twice (will result in overwriting of blip)
         BlipCoords = vec3(332.52, -880.39, 60.13), -- Blip coords
         Sprite = 59, -- Blip Icon
         Display = 4, -- keep 4
         Scale = 0.5, -- Size of blip
         Colour = 2, -- colour
         Name = "Bean Machine - Shop" -- Blip name
     },]]
}

--Shop
Config.Shop = {
    Header = "Beanmachine Shop",
    Items = {
        { label = 'Kъпина', item = 'blackberry', description = "Купи къпини за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/UEZxgA7.png", metadata = {""}  },
        { label = 'Масло', item = 'butter', description = "Купи масло за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/frquDAj.png", metadata = {""}  },
        { label = 'Поничка', item = 'donut', description = "Купи понички за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/k4Xmfdh.png", metadata = {""}  },
        { label = 'Зелено листо', item = 'greenleaf', description = "Купи зелени листа за чай за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/znAtmdr.png", metadata = {""}  },
        { label = 'Шунка', item = 'ham', description = "Купи шунка за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/74vwtgm.png", metadata = {""}  },
        { label = 'Кашкавал', item = 'cheese', description = "Купи кашкавал за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/CO2lOTm.png", metadata = {""}  },
        { label = 'Шоколад', item = 'chocolate', description = "Купи шоколад за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/PLjDqb0.png", metadata = {""}  },
        { label = 'Шоколадов топинг', item = 'chocolate_topping', description = "Купи шоколадови топинги за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/hHObKAL.png", metadata = {""}  },
        { label = 'Жасминов чай', item = 'jasmine', description = "Купи Жасминов чай за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/AsdX0um.png", metadata = {""}  },
        { label = 'Личи', item = 'lychee', description = "Купи личи за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/JnO0WhA.png", metadata = {""}  },
        { label = 'Мента', item = 'mint', description = "Купи мента за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/cHwwFki.png", metadata = {""}  },
        { label = 'Мъфин', item = 'muffin', description = "Купи мъфини за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/JdrtPyi.png", metadata = {""}  },
        { label = 'Чаша за мъфини', item = 'muffin_cups', description = "Купи чаши за мъфини за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/yekTYEH.png", metadata = {""}  },
        { label = 'Орео', item = 'oreo', description = "Купи орео за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/iSkwvc9.png", metadata = {""}  },
        { label = 'Фъстъчени пръчици', item = 'peanuts_sprinkles', description = "Купи фъстъчени пръчици за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/QBtRAGD.png", metadata = {""}  },
        { label = 'Розов топинг', item = 'pink_topping', description = "Купи розов топинг за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/NbKaZxd.png", metadata = {""}  },
        { label = 'Пръчици с цветовете на дъгата', item = 'rainbow_sprinkles', description = "Купи пръчици с цветовете на дъгата за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/NbKaZxd.png", metadata = {""}  },
        { label = 'Захар', item = 'sugar', description = "Купи захар за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/r5cnZKZ.png", metadata = {""}  },
        { label = 'Турски кафе зърна', item = 'turkish_coffee_beans', description = "Купи турски кафе зърна за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/r5cnZKZ.png", metadata = {""}  },
        { label = 'Препечен хляб', item = 'toast_bread', description = "Купи препечен хляб за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/HsedIgK.png", metadata = {""}  },
        { label = 'Бял топинг', item = 'white_topping', description = "Купи бял топинг за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/FMipyPU.png", metadata = {""}  },
        { label = 'Чаша за кафе', item = 'coffee_cup', description = "Купи чаши за кафе за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/SeeMx0F.png", metadata = {""}  },
        { label = 'Кафени зърна', item = 'coffee_beans', description = "Купи кафени зърна за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/uIxaXo5.png", metadata = {""}  },
        { label = 'Мляко', item = 'milk', description = "Купи мляко за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/orOyyzE.png", metadata = {""}  },
        { label = 'Сметана', item = 'crema', description = "Купи сметана за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/5levntK.png", metadata = {""}  },
        { label = 'Сладолед', item = 'icecream', description = "Купи сладолед за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/c33IvUK.png", metadata = {""}  },
        { label = 'Уйски', item = 'whiskey', description = "Купи уйски за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/UI0gnHc.png", metadata = {""}  },
        { label = 'Чаена чаша', item = 'glass', description = "Купи чаени чаши за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/6RZCFoh.png", metadata = {""}  },
        { label = 'Чаша за лате', item = 'latte_cup', description = "Купи чаши за лате за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/psJRnj8.png", metadata = {""}  },
        { label = 'Чиния', item = 'plate', description = "Купи чинии за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/cwBtUCs.png", metadata = {""}  },
        { label = 'Чаша', item = 'cup', description = "Купи чаши за: $", price = 2, MinAmount = 1, MaxAmount = 200, image = "https://i.imgur.com/DXpB5Yw.png", metadata = {""}  },

    },
    Ped = {
        { model = "u_m_y_mani", coords = vector4(328.61, -890.73, 59.19, 93.52), scenario = "WORLD_HUMAN_SMOKING" },
    },
}

-- Consumables / Drinking / Eating  
Config.Consumables = {

    --EAT
    blackberry_muffin = { -- Item name
        Log = "You ate Blackberry Mufin",
        Remove = true, -- Remove item
        RemoveItem = "blackberry_muffin", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "dirty_plate", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { { status = "hunger", add = 100000 }, { status = "thirst", add = 100000 }, },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    donut = { -- Item name
        Log = "You ate Donut",
        Remove = true, -- Remove item
        RemoveItem = "donut", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    chocolate_donut = { -- Item name
        Log = "You ate Chocolate Donut",
        Remove = true, -- Remove item
        RemoveItem = "chocolate_donut", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    chocolate_muffin = { -- Item name
        Log = "You ate Chocolate Muffin",
        Remove = true, -- Remove item
        RemoveItem = "chocolate_muffin", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    lychee_muffin = { -- Item name
        Log = "You ate Lychee Muffin ",
        Remove = true, -- Remove item
        RemoveItem = "lychee_muffin", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    muffin = { -- Item name
        Log = "You ate Muffin",
        Remove = true, -- Remove item
        RemoveItem = "muffin", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    oreo_muffin = { -- Item name
        Log = "You ate Oreo Muffin",
        Remove = true, -- Remove item
        RemoveItem = "oreo_muffin", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    toast = { -- Item name
        Log = "You ate Toast",
        Remove = true, -- Remove item
        RemoveItem = "toast", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'v_res_fa_bread03',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    pink_donut = { -- Item name
        Log = "You ate Pink Donut",
        Remove = true, -- Remove item
        RemoveItem = "pink_donut", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    vanilla_donut = { -- Item name
        Log = "You ate Vanilla Donut",
        Remove = true, -- Remove item
        RemoveItem = "vanilla_donut", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    lemon_crushedice = { -- Item name
        Log = "You drunk Lemon Crushedice",
        Remove = true, -- Remove item
        RemoveItem = "lemon_crushedice", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 28422,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    multivitamin_crushedice = { -- Item name
        Log = "You drunk Multivitamin Crushedice",
        Remove = true, -- Remove item
        RemoveItem = "multivitamin_crushedice", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 28422,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    affogato = { -- Item name
        Log = "You drunk Affogato",
        Remove = true, -- Remove item
        RemoveItem = "affogato", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
	turkish_coffee = { -- Item name
        Log = "You drunk Turkish Coffee",
        Remove = true, -- Remove item
        RemoveItem = "turkish_coffee", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    hot_chocolate = { -- Item name
        Log = "You drunk Hot Chocolate",
        Remove = true, -- Remove item
        RemoveItem = "hot_chocolate", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    espresso = { -- Item name
        Log = "You drunk Espresso",
        Remove = true, -- Remove item
        RemoveItem = "espresso", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    flatwhite = { -- Item name
        Log = "You drunk Flat White",
        Remove = true, -- Remove item
        RemoveItem = "flatwhite", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    irish = { -- Item name
        Log = "You drunk Irish",
        Remove = true, -- Remove item
        RemoveItem = "irish", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    latte_macchiato = { -- Item name
        Log = "You drunk Latte Macchiato",
        Remove = true, -- Remove item
        RemoveItem = "latte_macchiato", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
	cappuccino = { -- Item name
        Log = "You drunk Cappuccino",
        Remove = true, -- Remove item
        RemoveItem = "cappuccino", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
	ristretto = { -- Item name
        Log = "You drunk Ristretto",
        Remove = true, -- Remove item
        RemoveItem = "ristretto", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    lungo = { -- Item name
        Log = "You drunk Lungo",
        Remove = true, -- Remove item
        RemoveItem = "lungo", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
	minttea = { -- Item name
        Log = "You drunk Mint Tea",
        Remove = true, -- Remove item
        RemoveItem = "minttea", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
	greentea = { -- Item name
        Log = "You drunk Green Tea",
        Remove = true, -- Remove item
        RemoveItem = "greentea", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
	jasminetea = { -- Item name
        Log = "You drunk Jasmine Tea",
        Remove = true, -- Remove item
        RemoveItem = "jasminetea", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_latte_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
}

Config.ChairsDebug = false
Config.Chairs = {
    -- CHAIRS 1
    -- {
    --     coords = vector3(304.18, -928.17, 57.81), offsetZ = -0.10, heading = 77.64, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(304.48, -927.63, 58.36, 337.48)
    -- },
    -- {
    --     coords = vector3(305.9, -928.12, 57.82), offsetZ = -0.10, heading = 37.8, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(305.5, -927.54, 58.36, 17.84)
    -- },
    -- {
    --     coords = vector3(307.88, -926.46, 57.81), offsetZ = -0.10, heading = 351.34, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(118.0733, -1047.3110, 28.2779, 348.5029)
    -- },
    -- {
    --     coords = vector3(307.81, -924.7, 57.81), offsetZ = -0.10, heading = 314.01, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(116.7916, -1046.4565, 28.2730, 314.0121)
    -- },
    -- {
    --     coords = vector3(306.06, -922.95, 57.8), offsetZ = -0.10, heading = 335.23, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(114.6283, -1045.6519, 28.9220, 342.1502)
    -- },
    -- {
    --     coords = vector3(304.35, -922.93, 57.82), offsetZ = -0.10, heading = 281.37, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(114.0551, -1044.3232, 28.9220, 281.7205)
    -- },
    -- {
    --     coords = vector3(117.66, -1035.8, 28.75), offsetZ = -0.10, heading = 335.09, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(117.8733, -1035.3700, 28.2624, 332.4528)
    -- },
    -- {
    --     coords = vector3(117.01, -1034.38, 28.76), offsetZ = -0.10, heading = 243.65, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(117.6691, -1034.4951, 28.2779, 250.1158)
    -- },
    -- {
    --     coords = vector3(117.45, -1033.36, 28.76), offsetZ = -0.10, heading = 249.4, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(117.9648, -1033.7018, 28.2779, 248.5954)
    -- },
    -- {
    --     coords = vector3(117.67, -1032.54, 28.76), offsetZ = -0.10, heading = 250.34, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(118.2701, -1032.7531, 28.2777, 250.3433)
    -- },
    -- {
    --     coords = vector3(119.14, -1031.51, 28.81), offsetZ = -0.10, heading = 180.01, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(119.1447, -1032.4293, 28.2735, 180.0145)
    -- },
    -- {
    --     coords = vector3(119.1, -1028.63, 28.8), offsetZ = -0.10, heading = 248.89, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(119.6790, -1028.8517, 28.2731, 248.8879)
    -- },
    -- {
    --     coords = vector3(120.68, -1027.71, 28.81), offsetZ = -0.10, heading = 170.72, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(120.5509, -1028.4436, 28.2761, 170.6650)
    -- },
    -- {
    --     coords = vector3(123.56, -1028.67, 29.12), offsetZ = -0.10, heading = 163.62, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(123.3796, -1029.1089, 28.2779, 149.7903)
    -- },
    -- {
    --     coords = vector3(125.1, -1029.19, 29.07), offsetZ = -0.10, heading = 159.92, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(124.9735, -1029.7040, 28.2768, 160.9883)
    -- },
    -- {
    --     coords = vector3(124.49, -1032.45, 29.09), offsetZ = -0.10, heading = 160.77, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(124.6916, -1031.9022, 28.2779, 181.3369)
    -- },
    -- {
    --     coords = vector3(122.9, -1032.46, 29.14), offsetZ = -0.10, heading = 205.34, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(122.6216, -1031.8962, 28.2779, 215.1225)
    -- },
    -- {
    --     coords = vector3(122.19, -1033.41, 29.11), offsetZ = -0.10, heading = 249.24, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(121.6669, -1033.2433, 28.2779, 246.6754)
    -- },
    -- {
    --     coords = vector3(121.68, -1034.41, 29.11), offsetZ = -0.10, heading = 250.46, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(121.2065, -1034.3096, 28.2779, 250.4107)
    -- },
    -- {
    --     coords = vector3(119.06, -1041.72, 29.1), offsetZ = -0.10, heading = 249.68, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(118.5429, -1041.5582, 28.2779, 250.1793)
    -- },
    -- {
    --     coords = vector3(118.77, -1042.79, 29.11), offsetZ = -0.10, heading = 234.25, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(118.2971, -1042.3878, 28.2779, 262.9703)
    -- },
    -- {
    --     coords = vector3(118.75, -1044.01, 29.12), offsetZ = -0.10, heading = 295.27, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(118.2913, -1044.3926, 28.2779, 310.7941)
    -- },
    -- {
    --     coords = vector3(119.89, -1044.96, 29.15), offsetZ = -0.10, heading = 337.24, radius = 0.5, distance = 1.7,
    --     LeaveCoords = vector4(119.5739, -1045.3955, 28.2779, 345.6711)
    -- },
}

Config.Delivery = {
    {     
        item = "donut", -- Item name
        Label = "Донът", -- Item label
        MinPrice = 85, -- Min price
        MaxPrice = 100, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
    {   
        item = "lemon_crushedice", -- Item name
        Label = "Лимонов натрошен лед", -- Item label
        MinPrice = 85, -- Min price
        MaxPrice = 100, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
    {   
        item = "oreo_muffin", -- Item name
        Label = "Орео мъфин", -- Item label
        MinPrice = 85, -- Min price
        MaxPrice = 100, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
    {   
        item = "pink_donut", -- Item name
        Label = "Розова поничка", -- Item label
        MinPrice = 85, -- Min price
        MaxPrice = 100, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
}
Config = {}

Config.Debug = false
--SERVER SETTINGS
Config.Framework = "qbcore"    -- Framework | types: auto-detect, qbcore, ESX, standalone
Config.NewESX = false -- if you use esx 1.1 version set this to false

Config.InteractionType = "target" -- target / 3dtext / textui
Config.Target = "ox_target"   -- Target | types: auto-detect, qb-target, qtarget, ox_target

Config.Progress = "ox_lib" -- ProgressBar | types: progressBars, ox_lib, qbcore
Config.Context = 'ox_lib' -- Context | types: ox_lib, qbcore
Config.TextUI = 'ox_lib' -- TextUIs | types: esx, ox_lib, luke

Config.AutoClothing = true -- if you want to change player clothes
Config.Clothing = "illenium-appearance" -- Skin / Clothing | types: auto-detect, esx_skin, qb-clothing, fivem-appearance, ox_appearance, illenium-appearance

Config.RequireJob = false -- If player needs job to do job
Config.Job = 'gardener' -- name of the require job only work with RequireJob = true

Config.VehicleModel = 'burrito' -- Vehicle model for gardener to use
Config.FuelType = 'cdn_fuel' --'legacy_fuel' -- legacy_fuel / ox_fuel / ps_fuel
Config.qsKeys = false -- set true for QS_keys support

Config.SpawnCoords = {-488.5718, -58.9089, 39.9907, 356.1456}

Config.Offset = vec3(0.77, 0, 0)

Config.StartJobLocation = vec4(-517.0587, -65.6794, 39.8363, 155.4374)

Config.Blip = {
    BlipCoords = vec3(-517.0587, -65.6794, 39.8363), -- Blip coords
    Sprite = 237, -- Blip Icon
    Display = 4, -- keep 4
    Scale = 0.9, -- Size of blip
    Colour = 69, -- colour
    Name = "Gardener" -- Blip name
}

Config.CustomerBlip = {
    Sprite = 480,
    Colour = 5
}

Config.Missions = {}


Config.MaxExperience = 100

Config.Missions.RakingLeaves = {
    AddToPlayer = {
        AddExperience = 15,
        Money = {300, 1000},
    },
    Missions = {
        ["Mission1"] = {
            npc_coords = vec4(969.3279, -502.3466, 61.1409, 46.2358),
            pile1 = vec3(965.9605, -496.6353, 60.7757),
            pile2 = vec3(971.4554, -491.9084, 60.8457),
            pile3 = vec3(976.9664, -489.0092, 61.1225),
            pile4 = vec3(977.9433, -492.9162, 61.1150),
        },
        ["Mission2"] = {
            npc_coords = vec4(-840.7773, -927.6354, 14.8791, 88.0349),
            pile1 = vec3(-838.7026, -924.8059, 15.0237),
            pile2 = vec3(-835.7042, -925.3527, 15.2009),
            pile3 = vec3(-834.0089, -930.4804, 15.3029),
            pile4 = vec3(-835.3348, -934.5846, 15.1591),
            pile5 = vec3(-830.7275, -935.1727, 15.4142),
        },
        ["Mission3"] = {
            npc_coords = vec4(861.7046, -582.2391, 57.1573, 332.3071),
            pile1 = vec3(854.3747, -575.5153, 56.8884),
            pile2 = vec3(856.1555, -573.6362, 56.7509),
            pile3 = vec3(853.0672, -572.3131, 56.7611),
            pile4 = vec3(859.9323, -571.2383, 56.5923),
            pile5 = vec3(862.9066, -574.1180, 56.6693),
        },
        ["Mission4"] = {
            npc_coords = vec4(934.0009, -637.1838, 56.8601, 302.3448),
            pile1 = vec3(936.2700, -635.5218, 56.9569),
            pile2 = vec3(938.2381, -633.4910, 56.7603),
            pile3 = vec3(940.5510, -635.0389, 56.7561),
            pile4 = vec3(931.7380, -631.6094, 56.9142),
            pile5 = vec3(932.2642, -628.2191, 56.7390),
            pile6 = vec3(934.5267, -629.1412, 56.6813),
        },
        ["Mission5"] = {
            npc_coords = vec4(1214.4069, -699.0596, 59.2947, 87.3511),
            pile1 = vec3(1214.2496, -701.4090, 59.3616),
            pile2 = vec3(1216.6294, -701.1245, 59.6531),
            pile3 = vec3(1219.6213, -700.5314, 59.9055),
            pile4 = vec3(1214.2543, -696.0114, 59.6705),
            pile5 = vec3(1213.6753, -693.3996, 59.7163),
            pile6 = vec3(1213.0026, -689.8580, 59.8270),
        },
    }
}
Config.Missions.PlantingTrees = {
    AddToPlayer = {
        AddExperience = 15,
        Money = {300, 1000},
    },
    Missions = {
        ["Mission1"] = {
        npc_coords = vec4(990.8698, -441.4105, 62.7721, 243.1758),
        sapling1 = vec3(997.0593, -441.6669, 62.9508),
        sapling2 = vec3(995.7840, -442.5928, 62.8763),
        sapling3 = vec3(993.9689, -443.9674, 62.7723),
        },
        ["Mission2"] = {
            npc_coords = vec4(1192.2286, -601.9547, 62.9502, 100.2178),
            sapling1 = vec3(1195.1958, -599.5179, 66.9904),
            sapling2 = vec3(1195.1105, -597.5477, 66.9894),
            sapling3 = vec3(1194.9121, -595.7457, 66.9891),
            sapling4 = vec3(1194.6155, -592.9788, 66.9891),
            sapling5 = vec3(1196.6672, -594.4377, 66.9893),
         },
            ["Mission3"] = {
                npc_coords = vec4(1192.2286, -601.9547, 62.9502, 100.2178),
                sapling1 = vec3(857.7657, -532.5310, 56.3289),
                sapling2 = vec3(857.5664, -534.1605, 56.3289),
                sapling3 = vec3(857.1187, -536.2701, 56.3289),
                sapling4 = vec3(856.7445, -537.8790, 56.3289),
                sapling5 = vec3(860.0118, -527.8931, 56.3272),
                sapling6 = vec3(857.0424, -527.3738, 56.3219),
            },
            ["Mission4"] = {
                npc_coords = vec4(950.6689, -252.5199, 66.5764, 110.2194),
                sapling1 = vec3(950.8433, -254.6856, 66.6197),
                sapling2 = vec3(950.1409, -255.5921, 66.6451),
                sapling3 = vec3(949.7927, -256.7761, 66.6370),
                sapling4 = vec3(948.6697, -258.1325, 66.5013),
                sapling5 = vec3(947.6275, -259.7542, 66.3546),
            },
            ["Mission5"] = {
                npc_coords = vec4(-573.7588, -996.2295, 21.1789, 250.7438),
                sapling1 = vec3(-576.1263, -995.4774, 21.2787),
                sapling2 = vec3(-576.0078, -993.6233, 21.2787),
                sapling3 = vec3(-575.9738, -991.0770, 21.2787),
                sapling4 = vec3(-576.0079, -988.6609, 21.2787),
                sapling5 = vec3(-575.9927, -986.0328, 21.2787),
                sapling6 = vec3(-576.0864, -983.2761, 21.2787),
                sapling7 = vec3(-576.1064, -980.5214, 21.2787),
            },
    }
}

Config.Missions.CleaningWeeds = {
AddToPlayer = {
    AddExperience = 15,
    Money = {300, 1000},
},
    Missions = {
        ["Mission1"] = {
        npc_coords = vec4(850.6296, -532.3691, 56.9254, 252.6808),
        weed1 = vec4(858.10, -533.22, 55.97, 339.44),
        weed2 = vec4(857.36, -535.87, 55.70, 336.60),
        weed3 = vec4(857.11, -537.34, 55.98, 346.37)
     },
     ["Mission2"] = {
        npc_coords = vec4(292.3271, -905.8131, 28.2162, 51.1240),
        weed1 = vec4(297.1531, -898.0298, 28.2838, 336.2406),
        weed2 = vec4(299.9749, -899.0565, 28.2923, 334.1530),
        weed3 = vec4(303.1777, -900.2231, 28.2948, 336.3535),
        weed4 = vec4(303.1715, -909.3328, 28.2933, 159.0358)
     },
     ["Mission3"] = {
        npc_coords = vec4(129.9982, -1029.3477, 28.3570, 306.0691),
        weed1 = vec4(129.4822, -1031.2333, 28.4335, 82.1779),
        weed2 = vec4(128.5934, -1033.6187, 28.4335, 79.0115),
        weed3 = vec4(127.8813, -1035.6775, 28.4335, 67.2464),
        weed4 = vec4(126.6720, -1038.8196, 28.4335, 66.7585),
        weed5 = vec4(130.9581, -1037.0298, 28.4335, 249.1073),
        weed6 = vec4(132.0330, -1034.1993, 28.4335, 250.0823),
     },
     ["Mission4"] = {
        npc_coords = vec4(64.0022, -138.7652, 54.0701, 205.5728),
        weed1 = vec4(61.4105, -138.4862, 54.0687, 356.1698),
        weed2 = vec4(59.7213, -137.8864, 54.0067, 338.0343),
        weed3 = vec4(58.1120, -137.2962, 54.9966, 359.5681),
        weed4 = vec4(55.9695, -136.5139, 54.0574, 359.6319),
     },
     ["Mission5"] = {
        npc_coords = vec4(1017.3979, -565.0938, 58.7132, 303.5102),
        weed1 = vec4(1013.5132, -561.0999, 59.1995, 353.7287),
        weed2 = vec4(1010.7545, -560.7391, 59.1995, 359.5822),
        weed3 = vec4(1007.7498, -560.3934, 59.1995, 0.7139),
        weed4 = vec4(1004.3952, -559.9174, 59.1995, 18.6651),
        weed5 = vec4(1002.1114, -559.7202, 59.1995, 349.3628),
        weed6 = vec4(999.4298, -560.5426, 59.2495, 32.9215),
        weed7 = vec4(997.3569, -562.0817, 59.2495, 35.6140),
        weed8 = vec4(994.8129, -563.8020, 59.2495, 47.3254),
     },
    }
}

Config.Missions.WateringPlants = {
    AddToPlayer = {
        AddExperience = 15,
        Money = {300, 1000},
    },

    Missions = {
        ["Mission1"] = {
        npc_coords = vec4(966.1359, -542.8436, 58.3591, 205.2195),
        plant1 = vec3(963.5701, -546.6447, 59.3589),
        plant2 = vec3(962.1029, -547.8755, 59.3588),
        plant3 = vec3(960.3389, -548.8728, 59.3586)
    },
    ["Mission2"] = {
        npc_coords = vec4(912.6827, -617.8937, 56.9042, 264.0297),
        plant1 = vec3(910.8616, -616.3309, 58.0928),
        plant2 = vec3(907.6899, -614.0260, 58.0918),
        plant3 = vec3(902.9125, -609.2996, 58.0917),
        plant4 = vec3(916.5391, -616.0798, 57.6948)
    },
    ["Mission3"] = {
        npc_coords = vec4(960.7908, -669.2843, 57.4509, 294.2350),
        plant1 = vec3(965.4473, -672.4285, 58.0537),
        plant2 = vec3(964.5616, -678.8165, 57.9540),
        plant3 = vec3(961.1960, -679.3245, 58.0661),
        plant4 = vec3(965.9732, -683.7194, 58.0662),
        plant5 = vec3(962.6708, -675.4239, 58.0138),
        plant6 = vec3(958.5796, -681.3015, 57.9883)
    },
    ["Mission4"] = {
        npc_coords = vec4(-14.8124, 10.3443, 70.5185, 321.7428),
        plant1 = vec3(-18.5477, 8.0784, 71.4535),
        plant2 = vec3(-22.8663, 10.5149, 71.4535),
        plant3 = vec3(-23.5015, 8.3743, 71.4535),
        plant4 = vec3(-26.0012, 11.0794, 71.4535),
        plant5 = vec3(-27.8466, 9.4694, 71.4535),
    },
    ["Mission5"] = {
        npc_coords = vec4(457.6120, 23.5211, 86.7257, 222.5366),
        plant1 = vec3(452.8117, 18.3820, 86.6581),
        plant2 = vec3(445.6230, 15.8169, 87.3094),
        plant3 = vec3(447.3637, 27.7953, 87.5665),
        plant4 = vec3(438.8681, 26.6647, 89.0129),
        plant5 = vec3(428.8678, 25.0426, 89.6409),
        plant6 = vec3(428.6201, 27.6297, 90.1203),
        plant7 = vec3(417.7583, 34.7311, 91.1602),
    },
}
}

Config.Missions.Lawnmower = {
    AddToPlayer = {
        AddExperience = 15,
        Money = {150, 1000},
    },
    Missions = {
        ["Mission1"] = { 
        marker = vec3(-1634.637330, 52.312088, 62.457154),
        npc_coords = vec4(-1629.323120, 38.479122, 61.524536, 337.322846),
        grass1 = vec3(-1632.936280, 48.052746, 61.0),
        grass2 = vec3(-1628.202148, 49.213188, 61.0),
        grass3 = vec3(-1629.428588, 53.050548, 61.0),
        grass4 = vec3(-1632.567016, 54.725274, 61.0),
        grass5 = vec3(-1635.665894, 56.756042, 61.0),
        grass6 = vec3(-1639.028564, 55.687912, 61.0),
        grass7 = vec3(-1637.406616, 52.087914, 61.0),
        grass8 = vec3(-1627.384644, 50.268132, 61.0),
        grass9 = vec3(-1633.002198, 56.953846, 61.0),
        grass10 = vec3(-1634.808838, 58.971428, 61.0),

    },  
        ["Mission2"] = { 
        marker = vec3(-1736.188964, 156.896698, 64.361206),
        npc_coords = vec4(-1694.927490, 141.454940, 63.327514, 209.763778),
        grass1 = vec3(-1713.639526, 149.103302, 62.5),
        grass2 = vec3(-1715.934082, 157.318680, 62.5),
        grass3 = vec3(-1722.197754, 163.450546, 62.5),
        grass4 = vec3(-1730.742920, 167.327468, 62.5),
        grass5 = vec3(-1734.290162, 159.995606, 62.5),
        grass6 = vec3(-1738.760498, 167.010986, 62.5),
        grass7 = vec3(-1739.934082, 175.160446, 62.5),
        grass8 = vec3(-1745.789062, 175.503296, 62.5),
        grass9 = vec3(-1749.824218, 168.435166, 62.5),
        grass10 = vec3(-1751.973632, 160.101104, 62.5),
        grass11 = vec3(-1747.701050, 153.586822, 62.5),
        grass12 = vec3(-1746.052734, 146.083526, 62.5),
        grass13 = vec3(-1742.703248, 147.876922, 62.5),
        grass14 = vec3(-1734.382446, 146.914292, 62.5),
        grass15 = vec3(-1729.978028, 141.560440, 62.5),
        grass16 = vec3(-1722.632934, 141.217590, 62.5),

    },
    ["Mission3"] = { 
        marker = vec3(221.934066, 775.832946, 204.669556),
        npc_coords = vec4(227.973632, 766.114258, 203.770752, 48.188972),
        grass1 = vec3(224.320878, 775.806580, 203.0),
        grass2 = vec3(225.309890, 778.865906, 203.0),
        grass3 = vec3(222.316482, 778.180236, 203.0),
        grass4 = vec3(219.890106, 774.487916, 203.0),
        grass5 = vec3(219.665940, 771.006592, 203.0),
        grass6 = vec3(217.912094, 768.026368, 203.0),
        grass7 = vec3(215.657136, 769.371398, 203.0),
        grass8 = vec3(214.140656, 771.890136, 203.0),
        grass9 = vec3(213.468140, 774.395630, 203.0),
        grass10 = vec3(214.298904, 776.980224, 203.0),
        grass11 = vec3(216.791214, 777.296692, 203.0),
        grass12 = vec3(222.830764, 771.903320, 203.0),
        grass13 = vec3(225.613190, 772.747254, 203.0),

    },
    ["Mission4"] = { 
        marker = vec3(1349.090088, -619.846130, 74.504760),
        npc_coords = vec4(1342.483520, -597.626342, 73.690064, 323.149598),
        grass1 = vec3(1328.756104, -612.567016, 73.0),
        grass2 = vec3(1330.747314, -614.479126, 73.0),
        grass3 = vec3(1332.764892, -616.536254, 73.0),
        grass4 = vec3(1335.626342, -618.870300, 73.0),
        grass5 = vec3(1338.685668, -620.848328, 73.0),
        grass6 = vec3(1342.061524, -622.074708, 73.0),
        grass7 = vec3(1344.316528, -618.197814, 73.0),
        grass8 = vec3(1350.000000, -618.593384, 73.0),
        grass9 = vec3(1348.338500, -623.960450, 73.0),
        grass10 = vec3(1347.243896, -622.523072, 73.0),
        grass11 = vec3(1350.263794, -624.026368, 73.0),
        grass12 = vec3(1351.912110, -622.562622, 73.0),
        grass13 = vec3(1352.109864, -619.028564, 73.0),
        grass14 = vec3(1351.265992, -616.114258, 73.0),
        grass15 = vec3(1349.960450, -612.751648, 73.0),
        grass16 = vec3(1352.756104, -611.274720, 73.0),
        grass17 = vec3(1350.843994, -609.837342, 73.0),

    },
    ["Mission5"] = { 
        marker = vec3(-266.347260, -1662.118652, 31.841064),
        npc_coords = vec4(-251.208786, -1662.487916, 30.857910, 99.212594),
        grass1 = vec3(-265.424164, -1665.850586, 30.0),
        grass2 = vec3(-261.072540, -1671.389038, 30.0),
        grass3 = vec3(-257.643952, -1668.593384, 30.0),
        grass4 = vec3(-255.362640, -1660.879150, 30.0),
        grass5 = vec3(-257.683502, -1658.663696, 30.0),
        grass6 = vec3(-258.540650, -1655.604370, 30.0),
        grass7 = vec3(-261.151642, -1653.665894, 30.0),
        grass8 = vec3(-264.171418, -1652.281372, 30.0),
        grass9 = vec3(-262.246154, -1663.358276, 30.0),
        grass10 = vec3(-257.578034, -1669.661500, 30.0),
        grass11 = vec3(-263.419770, -1673.551636, 30.0),
        grass12 = vec3(-269.327484, -1666.562622, 30.0),
        grass13 = vec3(-275.169220, -1661.419800, 30.0),
        grass14 = vec3(-276.303284, -1653.705444, 30.0),
        grass15 = vec3(-274.430786, -1648.298950, 30.0),
    },
}
}

Config.Outfits = {
    [`mp_m_freemode_01`] = { -- Skin model
            label = "Gardener",
            description = "Your Outfit",
            outfitData = {
                tshirt_1 = 15,
                tshirt_2 = 0,
                arms     = 19,
                torso_1  = 22,
                torso_2  = 0,
                pants_1  = 90,
                pants_2  = 0,
                shoes_1 = 1,
                shoes_2 = 0,
                chain_1 = 0,
                chain_2 = 0,
                glasses_1 = 0,
                glasses_2 = 0,
                ears_1 = 0,
                ears_2 = 0,
            
        }
    },
    [`mp_f_freemode_01`] = { -- Skin model
    
            label = "Gardner",
            description = "",
            outfitData = {
                tshirt_1 = 14,
                tshirt_2 = 0,
                arms     = 15,
                torso_1  = 173,
                torso_2  = 0,
                pants_1  = 78,
                pants_2  = 2,
                shoes_1 = 77,
                shoes_2 = 0,
                chain_1 = 0,
                chain_2 = 0,
                glasses_1 = 0,
                glasses_2 = 0,
                ears_1 = 0,
                ears_2 = 0,
            
        }
    },
}
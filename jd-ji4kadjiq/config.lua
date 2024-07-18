Config = {}
Config.Locale = 'en'
Config.Debug = false
Config.Framework = 'qbcore'  --  'qbcore' or 'esx' /  auto-detect
Config.NewESX = false
Config.InteractionType = "target" -- target or textui or 3dtext | which type of interaction you want
Config.FrameworkTarget = 'ox_target' --qtarget or qb-target or ox_target / auto-detect
Config.Job = 'electrician' -- Only works if require Job True
Config.FuseBoxProp = 'ch_prop_ch_fuse_box_01a' --Prop used 
Config.VehicleModel = `burrito` --vehicle spawn name
Config.FuelType = 'cdn_fuel' -- legacy_fuel / ox_fuel / ps_fuel
Config.Menu = 'ox_lib' -- qbcore / ox_lib
Config.Progress = 'ox_lib' -- qbcore / ox_lib
Config.TextUI = "ox_lib" -- TextUIs | types: esx, ox_lib, luke
Config.Clothing = "auto-detect" -- Skin / Clothing | types: auto-detect, esx_skin, qb-clothing, fivem-appearance, ox_appearance
Config.RequireClothing = false -- change this to false if you don't want to require clothing
Config.RequireJob = false -- set this to false if you want the job to be visible to everyone
Config.HelpMarker = true -- If you want to show where to place fusebox
Config.ReturnVehicle = true -- If true player have to return vehicle otherwise vehicle will remove immediately
Config.qsKeys = false -- If you are using quasar keys then turn this on / REQUIRE RETURN VEHICLE TRUE !
Config.RewardCooldown = 120 -- for a 5-minute cooldown, for example

Config.DrillHole = 10 -- SECONDS 
Config.InstallSwitch = 8
Config.InstallOutlet = 8
Config.InstallLight = 15

Config.Offset = vec3(0.77, 0, 0)

Config.StartJobLocation = {866.82, -967.57, 27.36} -- Target location with npc position
Config.NpcHeading = {295.80}

Config.Blip = {
    Pos = {866.82, -967.57, 27.86},
    Sprite = 354,
    Display = 4,
    Scale = 1.0,
    Colour = 3,
    ShortRange = true,
    Name = "Electrician job"
}

Config.CustomerBlip = {
    Sprite = 480,
    Colour = 5,
    Name = 'Customer'
}

Config.SpawnCoords = {875.17, -958.55, 26.28, 353.38} -- vehicle spawn location


Config.Reward = { -- This is for town job
    Experience = {2, 5},
    Min = 160,
    Max = 350,
}



Config.JobLocations = {
    { coords = { 31.7125, 126.6965, 84.6141 },   minigame = "ultra-voltlab" },
    { coords = { -71.1114, 79.8427, 71.6162 },   minigame = "calibrate" },
    { coords = { 100.9214, -1083.2579, 29.1927 }, minigame = "calibrate" },
    { coords = { 40.3846, -1039.5104, 29.5251 }, minigame = "ultra-voltlab" },
    { coords = { -272.1709, -774.4913, 32.2539 }, minigame = "calibrate" },
    { coords = { -281.0963, -272.6777, 32.0729 }, minigame = "ultra-voltlab" },
    { coords = { -597.9926, -245.5797, 36.3565 }, minigame = "calibrate" },
    { coords = { -678.5038, -176.2538, 37.8213 }, minigame = "ultra-voltlab" },
    { coords = { -638.1213, 9.9061, 40.2355 },   minigame = "calibrate" },
    { coords = { -569.5375, 270.9818, 82.9824 }, minigame = "ultra-voltlab" },
    { coords = { -530.4494, 275.4877, 83.0196 }, minigame = "calibrate" },
    { coords = { -566.4724, 297.9541, 83.0312 }, minigame = "ultra-voltlab" },
    { coords = { -135.1279, 446.6015, 113.2361 }, minigame = "calibrate" },
    { coords = { 196.1356, 302.2458, 105.5298 }, minigame = "ultra-voltlab" },
    { coords = { 261.3810, 309.2575, 105.5278 }, minigame = "calibrate" },
    { coords = { 354.3088, 275.4625, 103.3670 }, minigame = "ultra-voltlab" },
    { coords = { 403.9768, 283.5221, 103.0197 }, minigame = "calibrate" },
    { coords = { 535.0478, 247.0861, 103.1132 }, minigame = "ultra-voltlab" },
    { coords = { 624.2567, 245.4056, 103.1368 }, minigame = "calibrate" },
    { coords = { 635.8124, 21.8358, 87.0692 },   minigame = "ultra-voltlab" },
    { coords = { 1334.2646, -569.8494, 73.7071 }, minigame = "calibrate" },
    { coords = { 1246.0199, -1101.8219, 38.5238 }, minigame = "ultra-voltlab" },
    { coords = { 1186.1638, -1389.1508, 35.1486 }, minigame = "ultra-voltlab" },
    { coords = { 1156.9968, -1462.1178, 34.8436 }, minigame = "calibrate" },
    { coords = { 1376.8914, -1782.7271, 63.3476 }, minigame = "ultra-voltlab" },
    { coords = { 937.2687, -1939.6014, 30.7965 }, minigame = "calibrate" },
    { coords = { 877.3580, -2060.7102, 30.4116 }, minigame = "ultra-voltlab" },
    { coords = { 563.1790, -2030.6259, 29.1724 }, minigame = "calibrate" },
    { coords = { 434.3934, -1980.3804, 23.1452 }, minigame = "ultra-voltlab" },
    { coords = { 415.5130, -1574.3436, 29.2177 }, minigame = "calibrate" },
    { coords = { 175.0469, -1424.6208, 29.2749 }, minigame = "ultra-voltlab" },
    { coords = { 173.6490, -1613.6326, 29.2805 }, minigame = "calibrate" },
    { coords = { 119.2960, -1750.4000, 29.0598 }, minigame = "ultra-voltlab" },
    { coords = { -37.3843, -1575.5295, 29.3127 }, minigame = "calibrate" },
    { coords = { -828.9205, -1697.6948, 18.4797 }, minigame = "ultra-voltlab" },
    { coords = { -1144.2659, -1355.4464, 5.0448 }, minigame = "calibrate" },
    { coords = { -1204.2714, -1376.0320, 4.2164 }, minigame = "ultra-voltlab" },
    { coords = { -1225.9434, -1470.6515, 4.3202 }, minigame = "calibrate" },
    { coords = { -1180.5632, -1777.4984, 3.9085 }, minigame = "ultra-voltlab" },
    { coords = { -1398.1650, -892.3181, 11.9105 }, minigame = "calibrate" },
    { coords = { -1462.8732, -898.2611, 10.7586 }, minigame = "ultra-voltlab" },
    { coords = { -1857.1545, -599.7427, 11.6914 }, minigame = "calibrate" },
    { coords = { -2232.3401, -362.2569, 13.4310 }, minigame = "ultra-voltlab" },
    { coords = { -2121.8748, -345.6075, 13.1622 }, minigame = "calibrate" },
    { coords = { -1757.8878, -366.1213, 46.0521 }, minigame = "ultra-voltlab" },
    { coords = { -1682.0272, -383.3639, 48.2475 }, minigame = "calibrate" },
    { coords = { -1632.4281, -48.1037, 59.0416 }, minigame = "ultra-voltlab" },
    { coords = { -1716.9312, -3.0140, 65.1044 }, minigame = "calibrate" },
    { coords = { -1821.4033, 141.6679, 77.2041 }, minigame = "ultra-voltlab" },
    { coords = { -1905.0503, 453.5390, 116.8979 }, minigame = "calibrate" },
    { coords = { -1029.1799, 795.3978, 169.1284 }, minigame = "ultra-voltlab" },
    { coords = { -901.0778, -187.7875, 37.9245 }, minigame = "calibrate" },
    { coords = { -1160.5767, -214.6631, 37.9600 }, minigame = "ultra-voltlab" },
    { coords = { -1299.1127, -389.0168, 36.5163 }, minigame = "calibrate" },
    { coords = { -962.9536, -334.8223, 37.8156 }, minigame = "ultra-voltlab" },
    { coords = { -543.9085, -387.2919, 35.1588 }, minigame = "calibrate" },
    { coords = { 483.7838, -276.7283, 47.2618 }, minigame = "ultra-voltlab" },
    { coords = { 480.9461, 111.1638, 97.6706 },  minigame = "calibrate" },
    { coords = { -37.6077, -238.5952, 45.9125 }, minigame = "ultra-voltlab" },
    { coords = { -108.2025, -742.2446, 34.6720 }, minigame = "calibrate" },
    { coords = { 421.2695, -1010.7617, 29.1246 }, minigame = "ultra-voltlab" },
    { coords = { 5.7963, -1113.6251, 28.8297 },  minigame = "calibrate" },
    { coords = { -22.7936, -1106.0242, 27.0428 }, minigame = "ultra-voltlab" },
    { coords = { -3.3145, -1378.6830, 29.3562 }, minigame = "calibrate" },
    { coords = { 239.4464, -1276.4497, 29.2883 }, minigame = "ultra-voltlab" },

}

Config.HouseMissions = {
    ['Mission1'] = {
        Reward = {
            Money = {Min = 200, Max = 1000},
            Experience = 5
        },
        Customer = vec4(340.3008, 430.2255, 148.3806, 306.0995),
        Enter = vec3(345.8813, 440.3499, 147.5900),
        Leave = vec3(342.1633, 437.8311, 148.3808),
        ClipBoard = {
            PropPlacement = vec4(339.4214, 432.359222, 149.149759, 229.6147),
            HelpMarker = vec3(339.4214, 432.359222, 149.840759)
         },
        FuseBox = {
        PropPlacement = vec4(336.417572, 435.8764, 149.8099, 118.3458),
        HelpMarker = vec4(336.779, 436.021545, 149.801956, 299.1766)
        },
        InstallParts = {
            compontent1 = {
                coords = vec3(336.785, 437.3123, 151.077316), 
                Heading = 100.0,
                type = 'light',
            },
            compontent2 = {
                coords = vec3(337.435638, 437.601654, 151.061554),
                Heading = 100.0,
                type = 'light',
            },
            compontent3 = {
                coords = vec3(340.598419, 433.229645, 151.079483),
                Heading = 100.0,
                type = 'light',
            },
            compontent4 = {
                coords = vec3(342.2453, 430.0506, 151.074188),
                Heading = 100.0,
                type = 'light',
            },
            compontent5 = {
                coords = vec3(341.980957, 435.176147, 149.511871),
                HelpMarker = vec3(341.908325, 435.262726, 149.511871),
                Heading = 231.8434,
                type = 'switch',
            },
            compontent6 = {
                coords = vec3(334.6597, 434.336426, 149.698288),
                HelpMarker = vec3(334.7672, 434.1037, 149.1705),
                Heading = 32.3477,
                type = 'outlet',
            },
            compontent7 = {
                coords = vec3(335.563843, 434.788574, 149.698288),
                HelpMarker = vec3(335.5837, 434.4840, 149.1705),
                Heading = 32.3477,
                type = 'outlet',
            },
            compontent8 = {
                coords = vec3(330.30484, 432.156616, 149.344681),
                HelpMarker = vec3(330.3606, 432.037018, 149.344681),
                Heading = 32.3477,
                type = 'outlet',
            }
        }
    },
    ['Mission2'] = {
        Reward = {
            Money = {Min = 200, Max = 1000},
            Experience = 5
        },

        Customer = vec4(120.3659, 555.8705, 183.2970, 65.2778),
        Enter = vec3(119.3888, 563.8458, 182.9595),
        Leave = vec3(117.2082, 560.1028, 183.3049),
        ClipBoard = {
            PropPlacement = vec4(120.478752, 554.5979, 184.07655, -60.0),
            HelpMarker = vec3(120.478752, 554.5979, 184.57655)
         },
        FuseBox = {
        PropPlacement = vec4(118.764, 558.160339, 184.540918, 274.1553),
        HelpMarker = vec4(118.4164, 558.1402, 184.3049, 269.1587)
        },
        InstallParts = {
            compontent1 = {
                coords = vec3(120.275673, 549.8414, 185.982544), 
                Heading = 100.0,
                type = 'light',
            },
            compontent2 = {
                coords = vec3(119.040543, 549.5772, 186.006683),
                Heading = 100.0,
                type = 'light',
            },
            compontent3 = {
                coords = vec3(116.755325, 551.4915, 184.244431),
                HelpMarker = vec3(117.0121, 551.3891, 184.0968),
                Heading = 100.0,
                type = 'switch',
            },
            compontent4 = {
                coords = vec3(117.293167, 546.398254, 184.417343),
                HelpMarker = vec3(117.5265, 546.4158, 184.0917),
                Heading = 100.0,
                type = 'outlet',
            },
            compontent5 = {
                coords = vec3(126.45295, 551.3377, 184.417343),
                HelpMarker = vec3(126.1012, 551.2854, 184.0968),
                Heading = 275.1497,
                type = 'outlet',
            }
        }
    },
    ['Mission3'] = {
        Reward = {
            Money = {Min = 200, Max = 1000},
            Experience = 5
        },
        Customer = vec4(-854.4270, 686.3361, 151.8529, 14.9479),
        Enter = vec3(-852.9874, 694.7834, 148.0336),
        Leave = vec3(-860.0093, 691.4175, 151.8607),
        ClipBoard = {
            PropPlacement = vec4(-856.615, 685.647, 152.684, -102.904),
            HelpMarker = vec3(-856.615, 686.047, 152.824)
         },
        FuseBox = {
        PropPlacement = vec4(-858.4051513671875, 689.4618530273438, 153.35610961914065, -85.24250793457031),
        HelpMarker = vec4(-858.6568603515625, 689.4618530273438, 153.35610961914065, -85.24250793457031)
        },
        InstallParts = {
            compontent1 = {
                coords = vec3(-855.54833984375, 688.3876342773438, 154.5587158203125), 
                Heading = 5.08605,
                type = 'light',
            },
            compontent2 = {
                coords = vec3(-855.4114990234375, 687.4977416992188, 154.56869506835938),
                Heading = 3.63075,
                type = 'light',
            },
            compontent3 = {
                coords = vec3(-856.4306640625, 682.9201049804688, 154.5607452392578),
                Heading = 12.224098,
                type = 'light',
            },
            compontent5 = {
                coords = vec3(-858.5501098632812, 691.8209228515625, 153.32318115234375),
                HelpMarker = vec3(-858.5501098632812, 691.644775390625, 153.32318115234375),
                Heading = 5.01079320907592,
                type = 'switch',
            },
            compontent6 = { 
                coords = vec3(-860.6196899414062, 683.175048828125, 153.05291748046875),
                HelpMarker = vec3(-860.42431640625, 683.175048828125, 153.05291748046875),
                Heading = 94.4946,
                type = 'outlet',
            },
            compontent7 = {
                coords = vec3(-860.5673217773438, 682.5252075195312, 153.05291748046875),
                HelpMarker = vec3(-860.4469604492188, 682.5252075195312, 153.05291748046875),
                Heading = 94.4946,
                type = 'outlet',
            }
        }
    },
    ['Mission4'] = {
        Reward = {
            Money = {Min = 200, Max = 1000},
            Experience = 5
        },
        Customer = vec4(-175.4753, 495.0018, 136.6537, 247.0238),
        Enter = vec3(-174.5348, 502.6725, 136.4206),
        Leave = vec3(-174.4921, 497.8932, 136.6537),
        ClipBoard = {
            PropPlacement = vec4(-169.54025268554688, 493.4409484863281, 137.56575317382812, -82.34086608886719),
            HelpMarker = vec3(-169.54025268554688, 493.4409484863281, 137.91575317382812)
         },
        FuseBox = {
        PropPlacement = vec4(-171.81765747070312, 496.9454650878906, 138.17526245117188, -65.1197738647461),
        HelpMarker = vec4(-171.9651336669922, 496.89605712890625, 138.17526245117188, -65.1197738647461)
        },
        InstallParts = {
            compontent1 = {
                coords = vec3(-174.4248046875, 494.18170166015625, 139.3723602294922), 
                Heading = -102.2876434326172,
                type = 'light',
            },
            compontent2 = {
                coords = vec3(-168.0046844482422, 495.5400695800781, 139.3723602294922),
                Heading = -170.14700317382812,
                type = 'light',
            },
            compontent3 = {
                coords = vec3(-167.9805145263672, 491, 139.3723602294922),
                Heading = -170.14700317382812,
                type = 'light',
            },
            compontent5 = {
                coords = vec3(-163.36920166015625, 491.0032348632813, 137.94381713867188),
                HelpMarker = vec3(-163.57354736328125, 490.9743041992188, 137.93109130859375),
                Heading = -81.91952514648438,
                type = 'switch',
            },
            compontent6 = { 
                coords = vec3(-172.94737243652344, 489.7855529785156, 137.8504638671875),
                HelpMarker = vec3(-172.77096557617188, 489.82574462890625, 137.8504638671875),
                Heading = 102.83495330810548,
                type = 'outlet',
            },
            compontent7 = {
                coords = vec3(-171.94039916992188, 484.6022338867188, 137.8504638671875),
                HelpMarker = vec3(-171.80386352539065, 484.6262817382813, 137.8504638671875),
                Heading = 99.99000549316406,
                type = 'outlet',
            }
        }
    },
    ['Mission5'] = {
        Reward = {
            Money = {Min = 200, Max = 1000},
            Experience = 0
        },
        Customer = vec4(-796.9890, 332.8323, 157.5990, 272.6198),
        Enter = vec3(-772.6282, 313.0491, 84.6981),
        Leave = vec3(-777.7197, 340.3668, 159.0014),
        ClipBoard = {
            PropPlacement = vec4(-796.8107299804688, 338.8108215332031, 158.32731323242188, 88.69100189208984),
            HelpMarker = vec3(-796.8107299804688, 338.8108215332031, 158.92731323242188)
         },
        FuseBox = {
        PropPlacement = vec4(-778.1307983398438, 334.8021545410156, 160.6983184814453, -91.14981842041016), 
        HelpMarker = vec4(-778.4091, 334.8168, 160.0015, -91.14981842041016),
        },
        InstallParts = {
            compontent1 = {
                coords = vec3(-780.2198486328125, 339.4519958496094, 161.9320526123047), 
                Heading = 0.0,
                type = 'light',
            },
            compontent2 = {
                coords = vec3(-780.2198486328125, 336.5676879882813, 161.9320526123047),
                Heading = 0.0,
                type = 'light',
            },
            compontent3 = {
                coords = vec3(-778.1134643554688, 338.8945922851563, 160.3230743408203),
                HelpMarker = vec3(-778.4073486328125, 338.8945922851563, 160.3230743408203),
                Heading = -90.0, 
                type = 'switch',
            },
            compontent4 = { 
                coords = vec3(-789.3826904296875, 339.855224609375, 158.8775634765625),
                HelpMarker = vec3(-789.1213989257812, 339.855224609375, 158.8775634765625), 
                Heading = 90.31199645996094, 
                type = 'outlet',
            },
            compontent5 = {
                coords = vec3(-798.26171875, 326.6871643066406, 158.86709594726565),
                HelpMarker = vec3(-798.26171875, 327.0596313476563, 158.86709594726565),  
                Heading = -179.99998474121097, 
                type = 'outlet',
            }
        }
    },
    ['Mission6'] = {
        Reward = {
            Money = {Min = 200, Max = 1000},
            Experience = 0
        },
        Customer = vec4(-784.6777, 327.5746, 186.3133, 95.8072),
        Enter = vec3(-772.6282, 313.0491, 84.6981),
        Leave = vec3(-781.7819, 318.3596, 186.9488),
        ClipBoard = {
            PropPlacement = vec4(-784.0892333984375, 330.2573852539063, 187.15166748046875, -90.0),
            HelpMarker = vec3(-784.65576171875, 330.2573852539063, 187.27166748046875)
         },
        FuseBox = {
        PropPlacement = vec4(-780.4034423828125, 321.5082702636719, 188.33079528808597, -90.85743713378906),  
        HelpMarker = vec4(-780.9561767578125, 321.5082702636719, 188.33079528808597, -90.85743713378906)
        },
        InstallParts = {
            compontent1 = {
                coords = vec3(-781.9347534179688, 320.03680419921875, 190.0611572265625), 
                Heading = -90.0,
                type = 'light',
            },
            compontent2 = {
                coords = vec3(-783.735595703125, 320.3405456542969, 190.0611572265625),
                Heading = -90.0,
                type = 'light',
            },
            compontent3 = {
                coords = vec3(-789.79345703125, 322.5035095214844, 187.43919372558597),
                HelpMarker = vec3(-789.4489135742188, 322.5035095214844, 187.43919372558597),
                Heading = 88.16937255859375,  
                type = 'switch',
            },
            compontent4 = { 
                coords = vec3(-780.403076171875, 341.48992919921875, 186.9234619140625),
                HelpMarker = vec3(-780.7261962890625, 341.48992919921875, 186.9234619140625), 
                Heading = -90.27825927734376,
                type = 'outlet',
            },
            compontent5 = {
                coords = vec3(-801.1980590820312, 331.7518310546875, 190.45022583007812),
                HelpMarker = vec3(-801.1980590820312, 331.9832458496094, 190.45022583007812),  
                Heading = -179.84597778320312,
                type = 'outlet',
            }
        }
    },
    ['Mission7'] = {
        Reward = {
            Money = {Min = 200, Max = 1000},
            Experience = 0
        },
        Customer = vec4(-1379.7157, -477.7094, 71.0421, 94.0471),
        Enter = vec3(-1379.7291, -499.0814, 32.1579),
        Leave = vec3(-1392.5669, -480.7147, 71.0421),
        ClipBoard = {
            PropPlacement = vec4(-1384.7542724609375, -474.9546203613281, 71.6509750366211, 56.95829132080078),
            HelpMarker = vec3(-1384.3026123046875, -475.181884765625, 71.8509750366211)
         },
        FuseBox = {
        PropPlacement = vec4(-1390.9569091796875, -477.0018310546875, 72.55514526367188, 99.31783294677736),   
        HelpMarker = vec4(-1390.720458984375, -477.0018310546875, 72.55514526367188, 99.31783294677736)
        },
        InstallParts = {
            compontent1 = {
                coords = vec3(-1384.827392578125, -475.8519287109375, 71.570556640625),
                HelpMarker = vec3(-1384.6591796875, -475.8519287109375, 71.570556640625), 
                Heading = 100.03225708007812,
                type = 'outlet',
            },
            compontent2 = {
                coords = vec3(-1376.739013671875, -468.9899291992188, 71.45782470703125),
                HelpMarker = vec3(-1376.986083984375, -469.03363037109375, 71.45782470703125), 
                Heading = -81.52941131591797,
                type = 'outlet',
            },
            compontent3 = {
                coords = vec3(-1378.4818115234375, -474.5215148925781, 72.26072692871094),
                HelpMarker = vec3(-1378.666748046875, -474.4852600097656, 72.26072692871094),
                Heading = -80.41608428955078,   
                type = 'switch',
            },
            compontent4 = { 
                coords = vec3(-1375.6993408203125, -462.1479187011719, 71.54883575439453),
                HelpMarker = vec3(-1375.6734619140625, -462.3955383300781, 71.54883575439453), 
                Heading = 5.95747852325439,
                type = 'outlet',
            },
            compontent5 = {
                coords = vec3(-1374.5635986328125, -474.7768249511719, 71.33780670166016),
                HelpMarker = vec3(-1374.3291015625, -474.7469482421875, 71.33780670166016),  
                Heading = 97.25714874267578, 
                type = 'outlet',
            }
        }
    },
    ['Mission8'] = {
        Reward = {
            Money = {Min = 200, Max = 1000},
            Experience = 0
        },
        Customer = vec4(-776.2237, 324.1903, 195.0862, 350.6576),
        Enter = vec3(-772.6282, 313.0491, 84.6981),
        Leave = vec3(-779.1887, 339.8344, 195.6862),
        ClipBoard = {
            PropPlacement = vec4(-776.8472290039062, 330.45428466796875, 196.046630859375, 139.99998474121097), 
            HelpMarker = vec3(-776.4773559570312, 330.8979797363281, 196.046630859375) 
         },
        FuseBox = {
        PropPlacement = vec4(-780.6055908203125, 336.196533203125, 197.20413208007812, 89.46293640136719),  
        HelpMarker = vec4(-779.9032592773438, 336.196533203125, 197.20413208007812, 89.46293640136719)
        },
        InstallParts = {
            compontent1 = {
                coords = vec3(-779.7733154296875, 337.343505859375, 198.8042755126953), 
                Heading = 90.0, 
                type = 'light',
            },
            compontent2 = {
                coords = vec3(-778.2694091796875, 337.343505859375, 198.8042755126953),
                Heading = 90.0,
                type = 'light',
            },
            compontent3 = {
                coords = vec3(-776.6561279296875, 334.91082763671875, 196.9970703125),
                HelpMarker = vec3(-776.6561279296875, 335.1526184082031, 196.9970703125),
                Heading = 176.84686279296875,  
                type = 'switch',
            },
            compontent4 = { 
                coords = vec3(-771.2072143554688, 335.3102111816406, 196.08670043945312),
                HelpMarker = vec3(-771.547119140625, 335.3102111816406, 196.08670043945312), 
                Heading = -90.97699737548828, 
                type = 'outlet',
            },
            compontent5 = {
                coords = vec3(-766.7493286132812, 315.69915771484375, 195.7386932373047),
                HelpMarker = vec3(-767.1453247070312, 315.69915771484375, 195.7386932373047),  
                Heading = -90.58201599121094,
                type = 'outlet',
            }
        }
    },
    ['Mission9'] = {
        Reward = {
            Money = {Min = 200, Max = 1000},
            Experience = 0
        },
        Customer = vec4(-582.7520, 49.5795, 91.2236, 111.5009),
        Enter = vec3(-635.6806, 44.3604, 41.6982),
        Leave = vec3(-601.8575, 42.3168, 92.6261),
        ClipBoard = {
            PropPlacement = vec4(-582.8229370117188, 44.04526138305664, 92.16171264648438, -90.8352813720703), 
            HelpMarker = vec3(-583.4027709960938, 44.04526138305664, 92.16171264648438)
         },
        FuseBox = {
        PropPlacement = vec4(-601.4244384765625, 47.44346237182617, 94.306640625, 89.26702117919922),   
        HelpMarker = vec4(-601.0274047851562, 47.44346237182617, 94.306640625, 89.26702117919922)
        },
        InstallParts = {
            compontent1 = {
                coords = vec3(-599.9605712890625, 44.36642837524414, 95.64723205566406),
                Heading = 0.0,
                type = 'light',
            },
            compontent2 = {
                coords = vec3(-599.9605712890625, 41.62022399902344, 95.64723205566406),
                Heading = 0.0,
                type = 'light',
            },
            compontent3 = {
                coords = vec3(-601.4718627929688, 43.84784317016601, 93.90440368652344),
                HelpMarker = vec3(-601.0963745117188, 43.84784317016601, 93.90440368652344),
                Heading = 90.0, 
                type = 'switch',
            },
            compontent4 = { 
                coords = vec3(-599.8114013671875, 55.27321243286133, 93.12822723388672),
                HelpMarker = vec3(-599.8114013671875, 54.88855743408203, 93.12822723388672), 
                Heading = -3.31522583961486,
                type = 'outlet',
            },
            compontent5 = {
                coords = vec3(-590.2040405273438, 42.99863052368164, 91.8231964111328),
                HelpMarker = vec3(-590.5094604492188, 42.99863052368164, 91.8231964111328),  
                Heading = -89.5931396484375, 
                type = 'outlet',
            }
        }
    },
    ['Mission10'] = {
        Reward = {
            Money = {Min = 200, Max = 1000},
            Experience = 0
        },
        Customer = vec4(-72.1382, -814.3546, 242.3858, 156.9013),
        Enter = vec3(-71.2494, -800.9373, 43.2273),
        Leave = vec3(-75.4459, -827.1695, 242.3858),
        ClipBoard = {
            PropPlacement = vec4(-76.32122802734375, -817.633544921875, 243.20170288085935, 127.09033203125),  
            HelpMarker = vec3(-75.79659271240234, -817.4282836914062, 243.40170288085935)
         },
        FuseBox = {
        PropPlacement = vec4(-77.08837127685547, -820.9031372070312, 243.8846893310547, -18.29885101318359),   
        HelpMarker = vec4(-77.26985168457031, -821.4519653320312, 243.8846893310547, -18.29885101318359),
        animRotation = 159.7688
        },
        InstallParts = {
            compontent1 = {
                coords = vec3(-75.69204711914062, -818.505126953125, 243.35850524902344),
                HelpMarker = vec3(-75.41373443603516, -818.6063842773438, 243.35850524902344), 
                Heading = 70.0134048461914, 
                type = 'outlet',
            },
            compontent2 = {
                coords = vec3(-78.55636596679688, -807.569580078125, 243.2454071044922),
                HelpMarker = vec3(-78.71170806884766, -807.9780883789062, 243.2454071044922), 
                Heading = -20.82126808166504,
                type = 'outlet',
            },
            compontent3 = {
                coords = vec3(-73.36656188964844, -808.612060546875, 243.82455444335935),
                HelpMarker = vec3(-73.71826934814453, -808.4894409179688, 243.82455444335935),
                Heading = -109.22216033935548,
                type = 'switch',
            },
            compontent4 = { 
                coords = vec3(-80.70645904541016, -805.4274291992188, 243.2240447998047),
                HelpMarker = vec3(-80.54361724853516, -804.9893798828125, 243.2240447998047), 
                Heading = 159.60638427734375,
                type = 'outlet',
            },
            compontent5 = {
                coords = vec3(-63.2536735534668, -805.9537353515625, 243.2334442138672),
                HelpMarker = vec3(-62.94013214111328, -806.06787109375, 243.2334442138672),  
                Heading = 69.99999237060547,
                type = 'outlet',
            }
        }
    }
}


Config.JobPrivateLocations = {
    LowTier = {
        RequiredExperience = 0,
        ExperienceReward = 1,
        Reward = {Min = 120, Max = 250}, -- Reward range for LowTear
        Locations = {
            { coords = { 173.506119, 28.8611832, 73.79455 }, heading = 339.3886, minigame = "ultra-voltlab" },
            { coords = { -1008.92676, -990.4254, 2.596351 }, heading = 35.7763, minigame = "ultra-voltlab" },
            { coords = { -1073.2677, -1042.8501, 2.47949958 }, heading = 212.1833, minigame = "ultra-voltlab" },
            { coords = { -1092.31152, -1343.33191, 5.71477556 }, heading = 118.3963, minigame = "ultra-voltlab" },
            { coords = { -973.2356, -1579.22217, 5.641076 }, heading = 21.7814, minigame = "ultra-voltlab" },
            { coords = { -1047.47253, -1656.51318, 5.19091 }, heading = 45.9554, minigame = "ultra-voltlab" },
            { coords = { -1273.87354, -1347.943, 4.57286358 }, heading = 112.4110, minigame = "ultra-voltlab" },
            { coords = { -1307.67126, -1068.07922, 7.58664942 }, heading = 298.2929, minigame = "ultra-voltlab" },
            { coords = { -1753.91675, -723.0694, 10.7301 }, heading = 317.1946, minigame = "ultra-voltlab" },
            { coords = { -1470.60681, -918.3527, 10.3585472 }, heading = 50.9300, minigame = "ultra-voltlab" },
            { coords = { -925.5772, -1510.30225, 5.55075264 }, heading = 195.2551, minigame = "ultra-voltlab" },
            { coords = { -982.872, -1430.921, 5.39778233 }, heading = 20.0576, minigame = "ultra-voltlab" },
            { coords = { -1003.16559, -1218.80847, 6.145093 }, heading = 28.7790, minigame = "ultra-voltlab" },
            { coords = { -1013.54333, -1140.14551, 2.58535576 }, heading = 119.8062, minigame = "ultra-voltlab" }
            -- Add more low tier locations here
        }
    },
    MediumTier = {
        RequiredExperience = 30,
        ExperienceReward = 3,
        Reward = {Min = 150, Max = 300}, -- Reward range for MediumTear
        Locations = {
            { coords = { -574.5624, 382.326355, 101.204063 }, heading = 288.0994, minigame = "calibrate" },
            { coords = { -278.844177, 16.06105, 55.186882 }, heading = 74.8871, minigame = "calibrate" },
            { coords = { -82.57431, 73.87094, 71.9565048 }, heading = 245.2199, minigame = "calibrate" },
            { coords = { 224.43222, 376.099823, 106.68502 }, heading = 249.0305, minigame = "calibrate" },
            { coords = { 645.7447, 242.630127, 102.280128 }, heading = 332.0309, minigame = "calibrate" },
            { coords = { 1150.628, -292.3793, 69.40251 }, heading = 193.1504, minigame = "calibrate" },
            { coords = { 1298.45972, -524.290344, 71.2633 }, heading = 257.8559, minigame = "calibrate" },
            { coords = { 1071.16577, -786.389, 58.6593323 }, heading = 266.5160, minigame = "calibrate" },
            { coords = { 930.2947, -635.4854, 58.5352631 }, heading = 141.4734, minigame = "calibrate" },
            { coords = { 913.85, -483.259277, 59.23374 }, heading = 298.9311, minigame = "calibrate" },
            { coords = { 410.0323, -340.8111, 47.0916252 }, heading = 339.1084, minigame = "calibrate" },
            { coords = { 179.287369, -298.4416, 46.8291168 }, heading = 71.1446, minigame = "calibrate" },
            { coords = { -356.326019, -234.378662, 37.5245247 }, heading = 231.6856, minigame = "calibrate" },
            { coords = { -551.144653, -444.850647, 34.9098969 }, heading = 2.2382, minigame = "calibrate" },
            { coords = { -1095.23608, -364.61615, 38.10187 }, heading = 213.5786, minigame = "calibrate" },  
            -- Add more medium tier locations here
        }
    },
    HighTier = {
        RequiredExperience = 50,
        ExperienceReward = 5,
        Reward = {Min = 300, Max = 400}, -- Reward range for HighTear
        Locations = {
            { coords = { -631.106567, 471.3559, 109.516556 }, heading = 284.2877, minigame = "ultra-voltlab" },
            { coords = { 387.680328, -908.80304, 29.9846039 }, heading = 182.2253, minigame = "ultra-voltlab" }, 
            { coords = { 153.626175, -1043.195, 30.0883465 }, heading = 73.5085, minigame = "ultra-voltlab" },  
            { coords = { 85.83092, -1289.327, 29.6132832 }, heading = 213.9407, minigame = "ultra-voltlab" }, 
            { coords = { -49.54234, -1067.10217, 27.86429 }, heading = 343.6074, minigame = "ultra-voltlab" },
            { coords = { 84.8568954, 487.418, 148.221283 }, heading = 114.7860, minigame = "ultra-voltlab" }, 
            { coords = { -192.596008, 498.7138, 135.072769 }, heading = 186.0246, minigame = "ultra-voltlab" }, 
            { coords = { -263.120239, 392.0505, 110.755318 }, heading = 196.2039, minigame = "ultra-voltlab" },  
            { coords = { -570.576843, 398.802, 101.315147 }, heading = 290.1274, minigame = "ultra-voltlab" }, 
            { coords = { -714.352356, 589.5199, 142.150558 }, heading = 179.9202, minigame = "ultra-voltlab" },   
            { coords = { -666.5209, 803.9727, 199.95784 }, heading = 186.7626, minigame = "ultra-voltlab" },
            { coords = { -200.912, 620.553833, 198.410019 }, heading = 3.0326, minigame = "ultra-voltlab" },
            { coords = { 212.125458, 604.3583, 188.032455 }, heading = 254.4586, minigame = "ultra-voltlab" },
            { coords = { 178.51622, 477.707642, 142.491409 }, heading = 170.6023, minigame = "ultra-voltlab" }
            -- Add more high tier locations here
        }
    }
}


Config.Outfits = {
    [`mp_m_freemode_01`] = { -- Skin model
            label = "Electrician",
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
    
            label = "Electrician",
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
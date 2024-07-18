Config = Config or {}

Config.UseTarget = true -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.AvailableJobs = {                                     -- Only used when not using qb-jobs.
}

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vec3(-169.33, -997.85, 29.51),
        showBlip = true,
        blipData = {
            sprite = 487,
            display = 4,
            scale = 0.65,
            colour = 0,
            title = 'Община'
        },
        licenses = {
            ['id_card'] = {
                label = 'Лична карта',
                cost = 50,
            },
            ['driver_license'] = {
                label = 'Шофьорска книжка',
                cost = 150,
                metadata = 'driver'
            },
            ['weaponlicense'] = {
                label = 'Лиценз за оръжие',
                cost = 5000,
                metadata = 'weapon'
            },
        }
    },
}

-- Config.DrivingSchools = {
--     { -- Driving School 1
--         coords = vec3(240.3, -1379.89, 33.74),
--         showBlip = true,
--         blipData = {
--             sprite = 225,
--             display = 4,
--             scale = 0.65,
--             colour = 3,
--             title = 'Driving School'
--         },
--         instructors = {
--             'DJD56142',
--             'DXT09752',
--             'SRI85140',
--         }
--     },
-- }

Config.Peds = {
    -- Cityhall Ped
    {
        model = 'a_m_m_hasjew_01',
        coords = vec4(-169.35, -997.85, 28.51, 157.22),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        cityhall = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0,
            debugPoly = false
        }
    },
}

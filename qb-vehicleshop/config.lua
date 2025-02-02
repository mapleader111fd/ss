Config = {}

Config.PlateLetters  = 4
Config.PlateNumbers  = 4
Config.PlateUseSpace = false

Config.SpawnVehicle = true  -- TRUE if you want spawn vehicle when buy

Config.TestDrive = true     -- TRUE if you want enable test drive
Config.TestDriveTime = 60   -- TIME in SEC

Config.Blips = {
    [1] = {
        blip = vector3(-56.49, -1096.58, 26.42),
        blipname = 'Premium Deluxe Motorsport',
        blipsprite = 326,
        blipcolor = 3
    },
    [2] = {
        blip = vector3(-773.7, -1495.2, 2.6),
        blipname = 'Boat Shop',
        blipsprite = 427,
        blipcolor = 3
    },
    [3] = {
        blip = vector3(-940.95, -2954.04, 13.95),
        blipname = 'Plane Shop',
        blipsprite = 307,
        blipcolor = 3
    }
}

Config.Shops = {
    [1] = {
        category = 'pdm', -- Change ["shop"] in qb-core/shared.lua to match this for the vehicles you want
        coords = vector3(-56.49, -1096.58, 26.42), -- For Marker
        spawnvehicle = vector4(978.19, -3001.99, -40.62, 89.5), -- Display Point
        cameracoords = vector3(974.1, -2997.94, -39.00), -- Where To Create Camera
        pointcamera = vector3(979.1, -3003.00, -40.50), -- Where To Point Camera
        buyspawn = vector4(-11.87, -1080.87, 25.71, 132.0), -- Where Vehicle Spawns on Buy
        testdrive = vector4(-11.87, -1080.87, 25.71, 132.0) -- Where Vehicle Spawns on Test Drive
    },
    [2] = {
        category = 'police',
        coords = vector3(696.36, -274.48, 597.92),
        spawnvehicle = vector4(228.28, -992.3, -99.39, 204.73), -- Display Point
        cameracoords = vector3(227.41, -999.59, -99.0), -- Where To Create Camera
        pointcamera = vector3(228.28, -992.3, -99.39), -- Where To Point Camera
        buyspawn = vector4(-11.87, -1080.87, 25.71, 132.0), -- Where Vehicle Spawns on Buy
        testdrive = vector4(-11.87, -1080.87, 25.71, 132.0) -- Where Vehicle Spawns on Test Drive
    },
    [3] = {
        category = 'ambulance',
        coords = vector3(0, 0, 0), -- Marker Point
        spawnvehicle = vector4(0, 0, 0, 0), -- Display Point
        cameracoords = vector3(0, 0, 0), -- Where To Create Camera
        pointcamera = vector3(0, 0, 0), -- Where To Point Camera
        buyspawn = vector4(0, 0, 0, 0), -- Where Vehicle Spawns on Buy
        testdrive = vector4(0, 0, 0, 0) -- Where Vehicle Spawns on Test Drive
    },
    [4] = {
        category = 'mechanic',
        coords = vector3(0, 0, 0), -- Marker Point
        spawnvehicle = vector4(0, 0, 0, 0), -- Display Point
        cameracoords = vector3(0, 0, 0), -- Where To Create Camera
        pointcamera = vector3(0, 0, 0), -- Where To Point Camera
        buyspawn = vector4(0, 0, 0, 0), -- Where Vehicle Spawns on Buy
        testdrive = vector4(0, 0, 0, 0) -- Where Vehicle Spawns on Test Drive
    },
    [5] = {
        category = 'motorcycle',
        coords = vector3(0, 0, 0), -- Marker Point
        spawnvehicle = vector4(0, 0, 0, 0), -- Display Point
        cameracoords = vector3(0, 0, 0), -- Where To Create Camera
        pointcamera = vector3(0, 0, 0), -- Where To Point Camera
        buyspawn = vector4(0, 0, 0, 0), -- Where Vehicle Spawns on Buy
        testdrive = vector4(0, 0, 0, 0) -- Where Vehicle Spawns on Test Drive
    },
    [6] = {
        category = 'offroad',
        coords = vector3(0, 0, 0), -- Marker Point
        spawnvehicle = vector4(0, 0, 0, 0), -- Display Point
        cameracoords = vector3(0, 0, 0), -- Where To Create Camera
        pointcamera = vector3(0, 0, 0), -- Where To Point Camera
        buyspawn = vector4(0, 0, 0, 0), -- Where Vehicle Spawns on Buy
        testdrive = vector4(0, 0, 0, 0) -- Where Vehicle Spawns on Test Drive
    },
    [7] = {
        category = 'boat',
        coords = vector3(-773.7, -1495.2, 2.6), -- Marker Point
        spawnvehicle = vector4(-799.32, -1502.98, 1.45, 111.60), -- Display Point
        cameracoords = vector3(-789.71, -1501.12, 4.59), -- Where To Create Camera
        pointcamera = vector3(-801.36, -1504.19, -0.09), -- Where To Point Camera
        buyspawn = vector4(-799.32, -1502.98, 1.45, 111.60), -- Where Vehicle Spawns on Buy
        testdrive = vector4(-799.32, -1502.98, 1.45, 111.60) -- Where Vehicle Spawns on Test Drive
    },
    [8] = {
        category = 'donator',
        coords = vector3(0, 0, 0), -- Marker Point
        spawnvehicle = vector4(0, 0, 0, 0), -- Display Point
        cameracoords = vector3(0, 0, 0), -- Where To Create Camera
        pointcamera = vector3(0, 0, 0), -- Where To Point Camera
        buyspawn = vector4(0, 0, 0, 0), -- Where Vehicle Spawns on Buy
        testdrive = vector4(0, 0, 0, 0) -- Where Vehicle Spawns on Test Drive
    },
    [9] = {
        category = 'airplane',
        coords = vector3(-940.95, -2954.04, 13.95), -- Marker Point
        spawnvehicle = vector4(-1646.27, -3121.51, 13.99, 219.02), -- Display Point
        cameracoords = vector3(-1640.33, -3140.89, 18.30), -- Where To Create Camera
        pointcamera = vector3(-1646.27, -3121.51, 13.99), -- Where To Point Camera
        buyspawn = vector4(-1058.00, -3304.02, 13.95, 58.67), -- Where Vehicle Spawns on Buy
        testdrive = vector4(-1058.00, -3304.02, 13.95, 58.67) -- Where Vehicle Spawns on Test Drive
    }
}
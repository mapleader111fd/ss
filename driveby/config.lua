Config = {}

License = {
    key = 'LICENSEKEY',
    valid = false -- DONT DELETE (Even if it's true it won't happen again nothing just don't delete it)
}

Config.Settings = {
    Debug = true,
    Keybind = 'I',
    DefaultSettings = {
        { -- Seat 2
            Offset = {xPos = 0.0+0.9, yPos = 0.0+0.1, zPos = 0.0+0.7},
            Rotation = {xRot = 0.0, yRot = 30.0, zRot = 10.0},
        },
        { -- Seat 3
            Offset = {xPos = 0.0-0.8, yPos = 0.0-0.68, zPos = 0.0+0.8},
            Rotation = {xRot = 0.0, yRot = -30.0, zRot = 0.0},
        },
        { -- Seat 4
            Offset = {xPos = 0.0+0.9, yPos = 0.0-0.68, zPos = 0.0+0.7},
            Rotation = {xRot = 0.0, yRot = 30.0, zRot = 0.0},
        },
    },
}

Config.Vehicles = {
    {
        CarHash = 689090322,
        { -- Seat 2
            Offset = {xPos = 0.0+0.8, yPos = 0.0-0.1, zPos = 0.0+0.7},
            Rotation = {xRot = 0.0, yRot = 30.0, zRot = 0.0},
        },
    },
    {
        CarHash = -1298373790,
        {  -- Seat 2
            Offset = {xPos = 0.0, yPos = 0.0, zPos = 0.0+1},
            Rotation = {xRot = 0.0, yRot = 0.0, zRot = 0.0},
        },
        {  -- Seat 3
            Offset = {xPos = 0.0, yPos = 0.0, zPos = 0.0+1},
            Rotation = {xRot = 0.0, yRot = 0.0, zRot = 0.0},
        },
        {  -- Seat 4
            Offset = {xPos = 0.0, yPos = 0.0, zPos = 0.0+1},
            Rotation = {xRot = 0.0, yRot = 0.0, zRot = 0.0},
        },
    },
    {
        CarHash = -228528329,
        {
            Offset = {xPos = 0.0+0.9, yPos = 0.0+0.1, zPos = 0.0+1},
            Rotation = {xRot = 0.0, yRot = -30.0, zRot = 180.0},
        },
        {
            Offset = {xPos = 0.0+0.9, yPos = 0.0-0.7, zPos = 0.0+1},
            Rotation = {xRot = 0.0, yRot = 30.0, zRot = 0.0},
        },
        {
            Offset = {xPos = 0.0-0.9, yPos = 0.0-0.7, zPos = 0.0+1},
            Rotation = {xRot = 0.0, yRot = -30.0, zRot = 0.0},
        },
    },
    {
        CarHash = -1457394361,
        {
            Offset = {xPos = 0.0+0.9, yPos = 0.0+0.1, zPos = 0.0+1},
            Rotation = {xRot = 0.0, yRot = 30.0, zRot = 0.0},
        },
    }
}
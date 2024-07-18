Config = {}

Config.MissionMarker =  vector3(1246.97, -2908.51, 20.33, 262.28) -- place where is the marker with the mission
Config.DealerCoords = vector3(1246.97, -2908.51, 20.33, 262.28) -- place where the NPC dealer stands
Config.VehicleSpawn = { -- below the coordinates for random vehicle responses
    vector3(-1327.479736328, -86.045326232910, 49.31),
    vector3(-2075.888183593, -233.73908996580, 21.10),
    vector3(-972.1781616210, -1530.9045410150, 4.890),
    vector3(798.18426513672, -1799.8173828125, 29.33),
    vector3(1247.0718994141, -344.65634155273, 69.08)
}
Config.DriverWeap = `WEAPON_MICROSMG` -- Weapon for truck driver to spawn with
Config.NavWeap = `WEAPON_MICROSMG` -- Weapon for navigator to spawn with
Config.TimeToBlow = 30 -- bomb detonation time after planting, in seconds
Config.ActivePolice = 6 -- needed policemen to activate the mission
Config.Payout = {
    Min = 7500, -- Min reward payout
    Max = 12500 -- Max reward payout
}
Config.ActivationCost = 500 -- how much is the activation of the mission (clean from the bank)
Config.Currency = "$"
Config.ResetTimer = 1800 -- cooldown for mission in seconds
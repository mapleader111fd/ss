Config = {}

Config.debug = false


--- SETTINGS FOR ESX
Config.esxSettings = {
    enabled = false,
    oldEsx = false,
    -- Whether or not to use the new ESX export method
    useNewESXExport = false,
}

--- SETTINGS FOR QBCORE
Config.qbSettings = {
    enabled = true,
    useNewQBExport = true, -- Make sure to uncomment the old export inside fxmanifest.lua if you're still using it
}

Config.target = {
    enabled = false,
    system = 'ox_target' -- 'qtarget' or 'qb-target' or 'ox_target'  (Other systems might work as well)
}

-- Maximum distance at which picking up is allowed.
-- When player attempts to pickup an item from further away than this
-- they will be blocked and a server function will be triggered.
-- Normally this will only be triggered when player is using a lua injector.
Config.maxPickupDistance = 5

Config.keybinds = {
    collect = 'E',
}

-- List of JSON areas located within the `json_areas` folder (withot the file format (.json))
-- After adding a new area. Make sure to do `/refresh` on your server before restarting the script.
Config.jsonAreas = {
    --'example_area',
}

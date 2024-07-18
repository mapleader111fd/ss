--[[
    If you have a different script name for the following ones, change it to your one
    Example:

    EXTERNAL_SCRIPTS_NAMES = {
        ["es_extended"] = "mygamemode_extended",
    }
]]

EXTERNAL_SCRIPTS_NAMES = {
    ["es_extended"] = "es_extended",
    ["qb-core"] = "qb-core",

    ["doors_creator"] = "doors_creator", -- Only doors creator is supported

    -- Safe minigame, credits: https://github.com/VHall1/pd-safe
    ["pd-safe"] = "pd-safe",
    
    -- lockpick minigame, credits: https://github.com/baguscodestudio/lockpick
    ["lockpick"] = "lockpick",

    -- datacrack minigame, credits: https://github.com/utkuali/datacrack
    ["datacrack"] = "datacrack",

    -- fingerprint minigame, credits: https://github.com/utkuali/Finger-Print-Hacking-Game
    ["utk_fingerprint"] = "utk_fingerprint",

    -- memory minigame, credits: https://github.com/ultrahacx/ultra-keypackhack
    ["ultra-keypackhack"] = "ultra-keypackhack",

    -- If you don't use these inventories, don't touch
    ["ox_inventory"] = "ox_inventory",
    ["qs-inventory"] = "qs-inventory",

    -- Targeting
    ["ox_target"] = "ox_target",
    ["qb-target"] = "qb-target",
}

-- Edit here your police jobs
POLICE_JOBS_NAMES = {
    ["police"] = true,
    ["sheriff"] = true,
}

-- Jobs that won't be able to use any heist step at all
BLACKLISTED_JOBS = {
    ["police"] = true,
    ["sheriff"] = true,
}

--[[
    The shared object of the framework will refresh each X seconds. If for any reason you don't want it to refresh, set to nil
]] 
SECONDS_TO_REFRESH_SHARED_OBJECT = nil
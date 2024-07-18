-- Default requirement and all credits to: https://forum.cfx.re/t/finger-print-hacking-mini-game-standalone/1185122 (https://github.com/utkuali/Finger-Print-Hacking-Game)

-- the left number is the difficulty
local settings = {
    [1] = {
        levels = 1,
        lives = 6,
        time = 9
    },

    [2] = {
        levels = 2,
        lives = 5,
        time = 6
    },

    [3] = {
        levels = 2,
        lives = 3,
        time = 4
    },

    [4] = {
        levels = 3,
        lives = 2,
        time = 4
    },

    [5] = {
        levels = 4,
        lives = 1,
        time = 5
    }
}

function fingerprintMinigame(difficulty)
    local resName = EXTERNAL_SCRIPTS_NAMES["utk_fingerprint"]

    if(GetResourceState(resName) ~= "started") then
        notifyClient("Check F8")
        print("^1To use the fingerprint minigame, you need ^3utk_fingerprint^1 to be ^2installed and started^1, you can change the script folder name in ^3integrations/sh_integrations.lua^1")
        print("^1FOLLOW THE SCRIPT INSTALLATION TUTORIAL TO FIND IT^7")
        return false
    end

    local promise = promise.new()

    TriggerEvent("utk_fingerprint:Start", settings[difficulty].levels, settings[difficulty].lives, settings[difficulty].time, function(result, reason)
        promise:resolve(result)
    end)

    return Citizen.Await(promise)
end
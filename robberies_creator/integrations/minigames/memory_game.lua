-- Default requirement and all credits to: https://forum.cfx.re/t/release-casino-keypad-hacking-minigame-memory-minigame/4800359 (https://github.com/ultrahacx/ultra-keypackhack)

-- the left number is the difficulty
local settings = {
    [1] = {
        lives = 6,
        time = 170
    },

    [2] = {
        lives = 4,
        time = 140
    },

    [3] = {
        lives = 3,
        time = 110
    },

    [4] = {
        lives = 2,
        time = 80
    },

    [5] = {
        lives = 1,
        time = 60
    }
}

function memoryGameMinigame(difficulty)
    local resName = EXTERNAL_SCRIPTS_NAMES["ultra-keypackhack"]

    if(GetResourceState(resName) ~= "started") then
        notifyClient("Check F8")
        print("^1To use the memory minigame, you need ^3ultra-keypackhack^1 to be ^2installed and started^1, you can change the script folder name in ^3integrations/sh_integrations.lua^1")
        print("^1FOLLOW THE SCRIPT INSTALLATION TUTORIAL TO FIND IT^7")
        return false
    end

    local promise = promise.new()

    TriggerEvent("ultra-keypadhack", settings[difficulty].lives, settings[difficulty].time, function(result)
        promise:resolve(result == 1) -- 1 means successful, other numbers have different reasons
    end)

    return Citizen.Await(promise)
end
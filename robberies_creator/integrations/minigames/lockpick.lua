-- Default requirement and all credits to: https://forum.cfx.re/t/free-lockpick-minigame/4833201 (https://github.com/baguscodestudio/lockpick)

-- On the left there is the difficulty, on the right there are the attempts
local triesFromDifficulty = {
    [1] = 5,
    [2] = 4,
    [3] = 3,
    [4] = 2,
    [5] = 1,
}

function lockpickMinigame(difficulty)
    local attempts = triesFromDifficulty[difficulty]
    
    local resName = EXTERNAL_SCRIPTS_NAMES["lockpick"]

    if(GetResourceState(resName) ~= "started") then
        notifyClient("Check F8")
        print("^1To use the safe minigame, you need ^3lockpick^1 to be ^2installed and started^1, you can change the script folder name in ^3integrations/sh_integrations.lua^1")
        print("^1FOLLOW THE SCRIPT INSTALLATION TUTORIAL TO FIND IT^7")
        return false
    end


    return exports[resName]:startLockpick(attempts)
end
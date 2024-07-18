-- Default requirement and all credits to: https://forum.cfx.re/t/standalone-datacrack-hacking-mini-game/1066972 (https://github.com/utkuali/datacrack)

function datacrackMinigame(difficulty)
    local resName = EXTERNAL_SCRIPTS_NAMES["datacrack"]

    if(GetResourceState(resName) ~= "started") then
        notifyClient("Check F8")
        print("^1To use the datacrack minigame, you need ^3datacrack^1 to be ^2installed and started^1, you can change the script folder name in ^3integrations/sh_integrations.lua^1")
        print("^1FOLLOW THE SCRIPT INSTALLATION TUTORIAL TO FIND IT^7")
        return false
    end

    local promise = promise.new()

    if(difficulty <= 1) then
        difficulty = 2
    end

    TriggerEvent("datacrack:start", difficulty, function(result)
        promise:resolve(result)
    end)

    return Citizen.Await(promise)
end
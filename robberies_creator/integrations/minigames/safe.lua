--[[
    This is the safe minigame, you can edit it on your wish but you probably need some coding knowledge to do that, otherwise, don't touch.
    
    On success, this event must be used -> TriggerServerEvent(Utils.eventsPrefix .. ":heist:robSafeSuccess", objectNetId)
    On fail, this event must be used -> TriggerServerEvent(Utils.eventsPrefix .. ":heist:robSafeFail", objectNetId)

]]
function RobberiesCreator.playRobSafe(objectNetId, heistId, objectData)
    local resName = EXTERNAL_SCRIPTS_NAMES["pd-safe"]

    if(GetResourceState(resName) ~= "started") then
        TriggerServerEvent(Utils.eventsPrefix .. ":heist:robSafeFail", objectNetId)
        notifyClient("Check F8")
        print("^1To use the safe minigame, you need ^3pd-safe^1 to be ^2installed and started^1, you can change the script folder name in ^3integrations/sh_integrations.lua^1")
        print("^1FOLLOW THE SCRIPT INSTALLATION TUTORIAL TO FIND IT^7")
        return
    end

    local waitingForSafeResult = true

    Citizen.CreateThread(function() 
        local text = getLocalizedText("safe_instructions")
        while waitingForSafeResult do
            Citizen.Wait(0)

            showHelpNotification(text)
        end
    end)

    local results = {}

    for i=1, objectData.difficulty do
        table.insert(results, math.random(0, 99))
    end

    local isSuccessful = exports[resName]:createSafe(results)

    waitingForSafeResult = false

    if(isSuccessful) then
        TriggerServerEvent(Utils.eventsPrefix .. ":heist:robSafeSuccess", objectNetId)
    else
        TriggerServerEvent(Utils.eventsPrefix .. ":heist:robSafeFail", objectNetId)
    end
end
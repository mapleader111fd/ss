function RobberiesCreator.playHackablePanel(objectNetId, heistId, objectData)
    local minigame = objectData.minigameToUse
    local isSuccessful = false

    local scriptName = EXTERNAL_SCRIPTS_NAMES["doors_creator"]
    exports[scriptName]:toggleIconDisplay(false)

    if(not minigame or minigame == "bruteforce") then
        isSuccessful = bruteforceMinigame(objectData.difficulty)
    elseif(minigame == "datacrack") then
        isSuccessful = datacrackMinigame(objectData.difficulty)
    elseif(minigame == "fingerprint") then
        isSuccessful = fingerprintMinigame(objectData.difficulty)
    elseif(minigame == "memory-game") then
        isSuccessful = memoryGameMinigame(objectData.difficulty)
    end

    exports[scriptName]:toggleIconDisplay(true)

    if(isSuccessful) then
        TriggerServerEvent(Utils.eventsPrefix .. ":heist:hackPanelSuccess", objectNetId)
    else
        TriggerServerEvent(Utils.eventsPrefix .. ":heist:hackPanelFail", objectNetId)
    end
end
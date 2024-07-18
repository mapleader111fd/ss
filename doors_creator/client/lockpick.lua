local ATTEMPTS = 3

local function lockpickDoor(doorsId)
    local plyPed = PlayerPedId()
    local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
    local animName = "machinic_loop_mechandplayer"

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(10)
    end

    TaskPlayAnim(plyPed, animDict, animName, 8.0, 8.0, -1, 17, 1.0, false, false, false)

    --[[ Lockpick minigame ]]

    local resName = EXTERNAL_SCRIPTS_NAMES["lockpick"]
    
    if(GetResourceState(resName) ~= "started") then
        notifyClient("Check F8")
        print("^1To use the lockpick minigame, you need ^3lockpick^1 to be ^2installed and started^1, you can change the script folder name in ^3integrations/sh_integrations.lua^1")
        print("^1FOLLOW THE SCRIPT INSTALLATION TUTORIAL TO FIND IT^7")
        return false
    end

    local successful = exports[resName]:startLockpick(ATTEMPTS)

    ClearPedTasks(plyPed)
    
    RemoveAnimDict(animDict)

    if(successful) then
        TriggerServerEvent("doors_creator:doorLockpicked", doorsId)
    end
end

RegisterNetEvent("doors_creator:startLockpick", function() 
    local closestDoor, closestDist = DoorsCreator.getClosestActiveDoor()

    if(closestDoor and closestDist < 5.0) then

        if(DoorsCreator.allDoors[closestDoor.id].canBeLockpicked) then

            local canLockpick = TriggerServerPromise(Utils.eventsPrefix .. ":canLockpickDoor")

            if(canLockpick) then
                lockpickDoor(closestDoor.id)
            end
        else
            notifyClient( getLocalizedText("you_cant_lockpick_this_door") )
        end
    else
        notifyClient(getLocalizedText("no_close_door"))
    end
end)
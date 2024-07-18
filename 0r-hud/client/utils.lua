function Utils.Functions:CustomFuelExport(vehicle)
    --[[
        for example:
        return GetVehicleFuelLevel(vehicle)
        Please don't forget to delete the following "ErrorHandle" event after setting !
    --]]
    TriggerServerEvent("0r-hud:Server:ErrorHandle", _t("hud.export.fuel_missing"))
    return false
end

function Utils.Functions:CustomVoiceResource()
    -- Add your custom sound system events.
    -- for ex:
    --[[
        AddEventHandler("customVoice:setVoiceRange", function(mode)
            Koci.Client.HUD.data.bars.voice.range = mode
        end)

        AddEventHandler("customVoice:setRadioTalking", function(radioTalking)
            Koci.Client.HUD.data.bars.voice.radio = radioTalking
        end)
    --]]
end

local function SetSeatbeltState(state)
    isSeatbeltOn = state
end

exports("SeatbeltState", function(...)
    Koci.Client.HUD:ToggleSeatBelt(...)
end)

RegisterNetEvent("seatbelt:client:ToggleSeatbelt", function() -- Triggered in smallresources
    Koci.Client.HUD:ToggleSeatBelt()
end)

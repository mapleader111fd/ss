local QBCore = exports['qb-core']:GetCoreObject()
local DriveBy = false
local RootSeat = 0

function ResetDriveBy()
    ResetPedMovementClipset(PlayerPedId(), 0.55)
    ResetPedStrafeClipset(PlayerPedId())
    DriveBy = false
end

function DisableDriveBy()
    TriggerEvent('tac-driveby:client:reset')
    DriveBy = false
    SetPedIntoVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true), RootSeat)
end

 RegisterCommand('driveby', function()
     if not DriveBy then
         local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
         if CurrentVehicle == 0 then
         else
             if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
                 RootSeat = -1
                 DriveBy = false
             end
             if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), 0) == PlayerPedId() then
                 TriggerEvent('tac-driveby:client:seat2')
                 RootSeat = 0
                 DriveBy = true
                 StartThread()
             end
             if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), 1) == PlayerPedId() then
                 TriggerEvent('tac-driveby:client:seat3')
                 RootSeat = 1
                 DriveBy = true
                 StartThread()
             end
             if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), 2) == PlayerPedId() then
                 TriggerEvent('tac-driveby:client:seat4')
                 RootSeat = 2
                 DriveBy = true
                 StartThread()
             end
         end
     else
         DisableDriveBy()
     end
 end, false)

function StartThread()
    thread = true
    CreateThread(function()
        while thread do
            Wait(0)
            if DriveBy then
                local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
                SetCamViewModeForContext(GetCamActiveViewModeContext(), 4)
                SetPedMovementClipset(PlayerPedId(), 'move_ped_crouched', 0.55)
                SetPedStrafeClipset(PlayerPedId(), 'move_ped_crouched_strafing')
                if IsPedDeadOrDying(PlayerPedId(), false) or not DoesEntityExist(GetVehiclePedIsIn(PlayerPedId(), true)) then
                    TriggerEvent('tac-driveby:client:reset')
                    thread = false
                    ResetDriveBy()
                end
                if CurrentVehicle == 0 then
                else
                    thread = false
                    ResetDriveBy()
                end
            else
                thread = false
                ResetDriveBy()
            end
        end
    end)
end


if Config.Settings.Debug then
    RegisterCommand('GetWeaponHash', function(source, args)
        local hash = GetHashKey(args[1])
        print(hash)
    end, false)
    RegisterCommand('GetVehicleHash', function()
        local veh = GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), true))
        print(veh)
    end, false)
end

RegisterKeyMapping('driveby', 'Advanced DriveBy', 'keyboard', Config.Settings.Keybind)
QBCore = exports['qb-core']:GetCoreObject()

function OpenTextUI(msg, type, pos)
      if Config.UseOkOkTextUI then
            exports['okokTextUI']:Open(msg, type, pos)
      else
            exports['qb-core']:DrawText(msg)
      end
end

function CloseTextUI()
      if Config.UseOkOkTextUI then
            exports['okokTextUI']:Close()
      else
            exports['qb-core']:HideText()
      end
end

function Notify(id)
      if Config.UseOkokNotify then
            exports['okokNotify']:Alert(Locale(id).title, Locale(id).text, Locale(id).time, Locale(id).type)
      else
            QBCore.Functions.Notify(Locale(id).text, Locale(id).type)
      end
end

function canOpenMenu(zoneType, vehicle) -- zoneType = job, selfservice, admin
      local canOpen = true

      if not canOpen then
            -- Add notification here if you want
      end

      return canOpen
end

function isOnDuty()
      local isOnDuty = true

      return isOnDuty
end

function getPlate(veh)
      return GetVehicleNumberPlateText(veh)
end

function GetNameFromID(id)
      local result = nil
      okokCallback(Config.EventPrefix .. ':Server:GetName', function(name)
            result = name
      end, id)
      while result == nil do Wait(0) end
      return result
end

--[[ Get Player Job ]]
function GetPlayerJob()
      return QBCore.Functions.GetPlayerData().job.name
end

RegisterNetEvent(Config.EventPrefix .. ':onOpenMenu')
AddEventHandler(Config.EventPrefix .. ":onOpenMenu", function()
      -- Executed when the menu is opened
end)

RegisterNetEvent(Config.EventPrefix .. ':onCloseMenu')
AddEventHandler(Config.EventPrefix .. ':onCloseMenu', function()
      -- Executed when the menu is closed
end)

local collisionOffVehicles = {}

function disableCollision(bool, veh)
      for _, i in ipairs(GetActivePlayers()) do
            if i ~= PlayerId() then
                  local closestPlayerPed = GetPlayerPed(i)
                  local veh = GetVehiclePedIsIn(closestPlayerPed, false)
                  if not collisionOffVehicles[veh] then
                        collisionOffVehicles[veh] = true
                        SetEntityNoCollisionEntity(veh, GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                  elseif false then
                        collisionOffVehicles[veh] = nil
                        SetEntityNoCollisionEntity(veh, GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
                  end
            end
      end
end

function FixVehicle(vehicle)
      SetVehicleFixed(vehicle)
      SetVehicleDeformationFixed(vehicle)
      SetVehicleFuelLevel(vehicle, 100.0)
      --  exports["LegacyFuel"]:SetFuel(vehicle, 100) -- Legacy Fuel
      SetVehicleUndriveable(vehicle, false)
      SetVehicleEngineOn(vehicle, true, true)
      SetVehiclePetrolTankHealth(vehicle, 1000.0)
      SetVehicleOilLevel(vehicle, 100.0)
      SetVehicleDirtLevel(vehicle, 0.0)
      SetVehicleEngineHealth(vehicle, 1000.0)
      SetVehicleBodyHealth(vehicle, 1000.0)
      SetVehicleTyreFixed(vehicle, 0)
      for i = 0, 7 do
            SetVehicleTyreFixed(vehicle, i)
      end
      Notify('vehicle_fixed')
end
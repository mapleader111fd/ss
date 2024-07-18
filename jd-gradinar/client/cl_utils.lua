lib.locale()


local function AutoDetectFramework()
    if GetResourceState("es_extended") == "started" then
        return "ESX"
    elseif GetResourceState("qb-core") == "started" then
        return "qbcore"
    else
        return "standalone"
    end
end

local function AutoDetectTarget()
    if GetResourceState("qtarget") == "started" then
        return "qtarget"
    elseif GetResourceState("qb-target") == "started" then
        return "qb-target"
    elseif GetResourceState("ox_target") == "started" then
        return "ox_target"
    end
end

local function AutoDetectClothing()
    if GetResourceState("esx_skin") == "started" and GetResourceState("illenium_appearance") ~= "started" and GetResourceState("ox_appearance") ~= "started" and GetResourceState("fivem-appearance") ~= "started" then
        return "esx_skin"
    elseif GetResourceState("qb-clothing") == "started" then
        return "qb-clothing"
    elseif GetResourceState("ox_appearance") == "started" then
        return "ox_appearance"
    elseif GetResourceState("fivem-appearance") == "started" then
        return "fivem-appearance"
    elseif GetResourceState("illenium-appearance") == "started" then
        return "illenium-appearance"
    end
end

if Config.Framework == "auto-detect" then
    Config.Framework = AutoDetectFramework()
end

if Config.Target == "auto-detect" then
    Config.Target = AutoDetectTarget()
end


if Config.Clothing == "auto-detect" then
    Config.Clothing = AutoDetectClothing()
end


if Config.Framework == "ESX" then
    if Config.NewESX then
        ESX = exports["es_extended"]:getSharedObject()
    else
        ESX = nil
        CreateThread(function()
            while ESX == nil do
                TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
                Wait(100)
            end
        end)
    end

elseif Config.Framework == "qbcore" then
    QBCore = nil
    QBCore = exports["qb-core"]:GetCoreObject()

elseif Config.Framework == "standalone" then
    -- ADD YOU FRAMEWORK
end
Citizen.CreateThread(function()
    local blip
    local idleTime = 1000 

    while true do
        local playerJob = GetPlayerJob()

        while not playerJob do
            playerJob = GetPlayerJob()
            Citizen.Wait(500) 
        end

        Citizen.Wait(1000)
        
        if Config.RequireJob and blip and playerJob ~= Config.Job then
            RemoveBlip(blip)
            blip = nil 
            idleTime = 30000 
        elseif not blip and (not Config.RequireJob or playerJob == Config.Job) then
            blip = AddBlipForCoord(vec3(Config.Blip.BlipCoords.x, Config.Blip.BlipCoords.y, Config.Blip.BlipCoords.z))

            SetBlipSprite(blip, Config.Blip.Sprite)
            SetBlipDisplay(blip, Config.Blip.Display)
            SetBlipScale(blip, Config.Blip.Scale)
            SetBlipColour(blip, Config.Blip.Colour)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Blip.Name)
            EndTextCommandSetBlipName(blip)
            idleTime = 5000 
        end

        Citizen.Wait(idleTime) 
    end
end)

function GetPlayerJob()
    if Config.Framework == 'ESX' then
        if ESX and ESX.GetPlayerData and ESX.GetPlayerData().job then
            return ESX.GetPlayerData().job.name
        end
    elseif Config.Framework == 'qbcore' then
        local playerData = QBCore.Functions.GetPlayerData()
        if playerData and playerData.job then
            return playerData.job.name
        end
    end
    return nil
end

function showNotification(message, type)
    if type == 'error' then
        lib.notify({
            title = 'Notification',
            description = message,
            type = 'error'
        })
    elseif type == 'success' then
        lib.notify({
            title = 'Notification',
            description = message,
            type = 'success'
        })
    end
end
TextUIShow = function(text)
    if Config.TextUI == "ox_lib" then
        lib.showTextUI(text)
    elseif Config.TextUI == "ESX" then
        exports["esx_textui"]:TextUI(text)
    elseif Config.TextUI == "luke" then
        TriggerEvent('luke_textui:ShowUI', text)
    elseif Config.TextUI == "custom" then
        print("add your textui system! in cl_Utils.lua")
        -- ADD YOUR TEXTUI | TO SHOW
    end
end

IsTextUIShowed = function()
    if Config.TextUI == "ox_lib" then
        return lib.isTextUIOpen()
    elseif Config.TextUI == "ESX" then
        --exports["esx_textui"]:TextUI(text)
    elseif Config.TextUI == "luke" then
        --TriggerEvent('luke_textui:ShowUI', text)
    elseif Config.TextUI == "custom" then
        print("add your textui system! in cl_Utils.lua")
        -- ADD YOUR TEXTUI | TO SHOW
    end
end

TextUIHide = function()
    if Config.TextUI == "ox_lib" then
        lib.hideTextUI()
    elseif Config.TextUI == "ESX" then
        exports["esx_textui"]:HideUI()
    elseif Config.TextUI == "luke" then
        TriggerEvent('luke_textui:HideUI')
    elseif Config.TextUI == "custom" then
        print("add your textui system! in cl_Utils.lua")
        -- ADD YOUR TEXTUI | TO HIDE
    end
end

Draw3DText = function(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    
    if onScreen then
        SetTextFont(Config.FontId)
        SetTextScale(0.33, 0.30)
        SetTextDropshadow(10, 100, 100, 100, 255)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 350
        DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 10)
    end
end


ProgressBar = function(duration, label)
    if Config.Progress == "ox_lib" then
        lib.progressBar({
            duration = duration,
            label = label,
            useWhileDead = false,
            canCancel = false
        })
    elseif Config.Progress == "qbcore" then
        QBCore = exports['qb-core']:GetCoreObject()
        QBCore.Functions.Progressbar(label, label, duration - 500, false, true, {
        }, {}, {}, {}, function()
        end)
        Wait(duration)
    elseif Config.Progress == "progressBars" then
        exports['progressBars']:startUI(duration, label)
        Wait(duration)
    end
end

function SpawnVehicleAndWarpPlayer(model, coords)
    local x, y, z, heading = table.unpack(coords)
    local playerPed = PlayerPedId()

    local vehicle = CreateVehicle(model, x, y, z, heading, true, false)
    SetVehicleOnGroundProperly(vehicle)
    SetModelAsNoLongerNeeded(model)
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    if Config.qsKeys then
        givekeys(vehicle)
    end

    if Config.FuelType == 'legacy_fuel' then
        exports["LegacyFuel"]:SetFuel(vehicle, 100)
    elseif Config.FuelType == 'ps_fuel' then
        exports["ps-fuel"]:SetFuel(vehicle, 100)
    elseif Config.FuelType == 'ox_fuel' then
        Entity(vehicle).state.fuel = 100
    end
    
    if Config.Framework == 'ESX' then
        ESX = exports["es_extended"]:getSharedObject()
    elseif Config.Framework == 'qbcore' then
        QBCore = exports["qb-core"]:GetCoreObject()
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
    end

     return vehicle
end

function RemoveVehicle()
    if Config.Framework == 'ESX' then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(vehicle) then
            SetEntityAsMissionEntity(vehicle, true, true) 
            BeforeVehicleRemoved(vehicle)
            DeleteVehicle(vehicle)
            lib.hideTextUI()
        end
    elseif Config.Framework == 'qbcore' then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(vehicle) then
            SetEntityAsMissionEntity(vehicle, true, true) 
            BeforeVehicleRemoved(vehicle)
            DeleteVehicle(vehicle)
            lib.hideTextUI()
        end
    end
end



function BeforeVehicleRemoved()
if Config.qsKeys then
    removekeys(vehicle)
    end
end

function givekeys(vehicle)
    local model = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
    local plate = GetVehicleNumberPlateText(vehicle)
    exports['qs-vehiclekeys']:GiveKeys(plate, model)    
end

function removekeys(vehicle)
    local model = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
    local plate = GetVehicleNumberPlateText(vehicle)
    exports['qs-vehiclekeys']:RemoveKeysAuto()
end



function AddCircleZone(name, coords, radius, options, eventOptions)
    if Config.Target == 'qtarget' then
        exports.qtarget:AddCircleZone(name, vec3(coords[1], coords[2], coords[3]), radius, options, eventOptions)
    elseif Config.Target == 'ox_target' then
        exports.qtarget:AddCircleZone(name, vec3(coords[1], coords[2], coords[3]), radius, options, eventOptions)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddCircleZone(name, vec3(coords[1], coords[2], coords[3]), radius, options, eventOptions)
    end
end

function AddTargetVehicle(name, vehicle, options, eventOptions)
    if Config.Target == 'qtarget' then
        exports.qtarget:Vehicle(name, vehicle, options, eventOptions)
    elseif Config.Target == 'ox_target' then
        exports.qtarget:Vehicle(name, vehicle, options, eventOptions)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddGlobalVehicle(name, vehicle, options, eventOptions)
    end
end

function AddTargetEntity(entity, options, eventOptions)
    if Config.Target == 'qtarget' then
        exports.qtarget:AddTargetEntity(entity, options, eventOptions)
    elseif Config.Target == 'ox_target' then
        exports.ox_target:AddTargetEntity(entity, options, eventOptions)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddTargetEntity(name, entity, options, eventOptions)
    end
end


function RemoveVehicleZone(name)
    if Config.Target == 'qtarget' then
        exports.qtarget:RemoveVehicle(name)
    elseif Config.Target == 'ox_target' then
        exports.qtarget:RemoveVehicle(name)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:RemoveGlobalVehicle(name)
    end
end


function RemoveZone(name)
    if Config.Target == 'qtarget' then
        exports.qtarget:RemoveZone(name)
    elseif Config.Target == 'ox_target' then
        exports.qtarget:RemoveZone(name)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:RemoveZone(name)
    end
end



RegisterNetEvent("drc_gardener:joboutfit", function(data)
    if Config.Clothing == "qb-clothing" then
        local model = GetEntityModel(cache.ped)
        if model == `mp_m_freemode_01` then
			local Male = {
				outfitData = {
					["pants"]       = { item = Config.Outfits[model].outfitData.pants_1, texture = Config.Outfits[GetEntityModel(cache.ped)].pants_2},
					["arms"]        = { item = Config.Outfits[model].outfitData.arms, texture = 0},  
					["t-shirt"]     = { item = Config.Outfits[model].outfitData.tshirt_1, texture = Config.Outfits[GetEntityModel(cache.ped)].tshirt_2},  
					["torso2"]      = { item = Config.Outfits[model].outfitData.torso_1, texture = Config.Outfits[GetEntityModel(cache.ped)].torso_2}, 
					["shoes"]       = { item = Config.Outfits[model].outfitData.shoes_1, texture = Config.Outfits[GetEntityModel(cache.ped)].shoes_2},  
                    ["accessory"]       = { item = Config.Outfits[model].outfitData.chain_1, texture = Config.Outfits[GetEntityModel(cache.ped)].chain_2},
                    ["glass"]       = { item = Config.Outfits[model].outfitData.glasses_1, texture = Config.Outfits[GetEntityModel(cache.ped)].glasses_2},  
                    ["ear"]         = { item = Config.Outfits[model].outfitData.ears_1, texture = Config.Outfits[GetEntityModel(cache.ped)].ears_2}  
				},
			}
			TriggerEvent('qb-clothing:client:loadOutfit', Male)
		else
			local Female = {
				outfitData = {
					["pants"]       = { item = Config.Outfits[model].outfitData.pants_1, texture = Config.Outfits[GetEntityModel(cache.ped)].pants_2},
					["arms"]        = { item = Config.Outfits[model].outfitData.arms, texture = 0},  
					["t-shirt"]     = { item = Config.Outfits[model].outfitData.tshirt_1, texture = Config.Outfits[GetEntityModel(cache.ped)].tshirt_2},  
					["torso2"]      = { item = Config.Outfits[model].outfitData.torso_1, texture = Config.Outfits[GetEntityModel(cache.ped)].torso_2}, 
					["shoes"]       = { item = Config.Outfits[model].outfitData.shoes_1, texture = Config.Outfits[GetEntityModel(cache.ped)].shoes_2},  
                    ["chain"]       = { item = Config.Outfits[model].outfitData.chain_1, texture = Config.Outfits[GetEntityModel(cache.ped)].chain_2},
                    ["glass"]       = { item = Config.Outfits[model].outfitData.glasses_1, texture = Config.Outfits[GetEntityModel(cache.ped)].glasses_2},  
                    ["ear"]         = { item = Config.Outfits[model].outfitData.ears_1, texture = Config.Outfits[GetEntityModel(cache.ped)].ears_2}  
				},
			}
			TriggerEvent('qb-clothing:client:loadOutfit', Female)
		end
    end
    
    if Config.Clothing == "ox_appearance" or Config.Clothing == "fivem-appearance" then
        if not appearance then
            appearance = exports['fivem-appearance']:getPedAppearance(PlayerPedId())
        end
        Wait(100)
        local model = GetEntityModel(cache.ped)
        if model == `mp_m_freemode_01` then
            undershirt = {component_id = 8, texture = Config.Outfits[model].outfitData.tshirt_2, drawable = Config.Outfits[model].outfitData.tshirt_1}
            arms = {component_id = 3, texture = 0, drawable = Config.Outfits[model].outfitData.arms}
            torso = {component_id = 11, texture = Config.Outfits[model].outfitData.torso_2, drawable = Config.Outfits[model].outfitData.torso_1}
            pants = {component_id = 4, texture = Config.Outfits[model].outfitData.pants_2, drawable = Config.Outfits[model].outfitData.pants_1}
            shoes = {component_id = 6, texture = Config.Outfits[model].outfitData.shoes_2, drawable = Config.Outfits[model].outfitData.shoes_1}
            accesories = {component_id = 7, texture = Config.Outfits[model].outfitData.chain_2, drawable = Config.Outfits[model].outfitData.chain_1}
            props = {props = {{prop_id = 1, texture = Config.Outfits[model].outfitData.glasses_2, drawable = Config.Outfits[model].outfitData.glasses_1}, {prop_id = 2, texture = Config.Outfits[model].outfitData.ears_2, drawable = Config.Outfits[model].outfitData.ears_1}}}
            exports['fivem-appearance']:setPedComponents(cache.ped, {torso, undershirt, pants, shoes, accesories, arms, props})
        else
        
            undershirt = {component_id = 8, texture = Config.Outfits[model].outfitData.tshirt_2, drawable = Config.Outfits[model].outfitData.tshirt_1}
            arms = {component_id = 3, texture = 0, drawable = Config.Outfits[model].outfitData.arms}
            torso = {component_id = 11, texture = Config.Outfits[model].outfitData.torso_2, drawable = Config.Outfits[model].outfitData.torso_1}
            pants = {component_id = 4, texture = Config.Outfits[model].outfitData.pants_2, drawable = Config.Outfits[model].outfitData.pants_1}
            shoes = {component_id = 6, texture = Config.Outfits[model].outfitData.shoes_2, drawable = Config.Outfits[model].outfitData.shoes_1}
            accesories = {component_id = 7, texture = Config.Outfits[model].outfitData.chain_2, drawable = Config.Outfits[model].outfitData.chain_1}
            props = {props = {{prop_id = 1, texture = Config.Outfits[model].outfitData.glasses_2, drawable = Config.Outfits[model].outfitData.glasses_1}, {prop_id = 2, texture = Config.Outfits[model].outfitData.ears_2, drawable = Config.Outfits[model].outfitData.ears_1}}}

            exports['fivem-appearance']:setPedComponents(cache.ped, {torso, undershirt, pants, shoes, accesories, arms, props})
        end
    end
    if Config.Clothing == "esx_skin" then
        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', Config.Outfits[GetEntityModel(cache.ped)].outfitData)
        end)
    end
end)

RegisterNetEvent("drc_gardener:civiloutfits", function()
    if Config.Clothing == "esx_skin" then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
    elseif Config.Clothing == "fivem-appearance" or Config.Clothing == "ox_appearance" then
        if appearance then
            exports['fivem-appearance']:setPedAppearance(PlayerPedId(), appearance)
            appearance = nil
        end
    elseif Config.Clothing == "qb-clothing" then
        TriggerServerEvent('qb-clothes:loadPlayerSkin')
    end
end)
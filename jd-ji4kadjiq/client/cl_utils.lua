
local appearance = nil


local function AutoDetectFramework()
    if GetResourceState("es_extended") == "started" then
        return "esx"
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
    if GetResourceState("esx_skin") == "started" and GetResourceState("ox_appearance") ~= "started" and GetResourceState("fivem-appearance") ~= "started" then
        return "esx_skin"
    elseif GetResourceState("qb-clothing") == "started" then
        return "qb-clothing"
    elseif GetResourceState("ox_appearance") == "started" then
        return "ox_appearance"
    elseif GetResourceState("fivem-appearance") == "started" then
        return "fivem-appearance"
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


if Config.Framework == "esx" then
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

function showNotification(message, type)
    -- use the type parameter to determine the style of the notification
    if type == 'error' then
        -- use your preferred way of showing error notifications here
        lib.notify({
            title = 'Notification',
            description = message,
            type = 'error'
        })
    elseif type == 'success' then
        -- use your preferred way of showing success notifications here
        lib.notify({
            title = 'Notification',
            description = message,
            type = 'success'
        })
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

Utils = Utils or {}

function StartMiniGame(minigame, time, callback)
    local playerPed = PlayerPedId()

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true) 

    if minigame == "ultra-voltlab" then
        TriggerEvent(minigame, time, function(result, reason)
            callback(result == 1)
            if result == 1 then
            ClearPedTasksImmediately(playerPed)
        end
        end)
    elseif minigame == "calibrate" then
        local success = exports['calibrate-distributor']:startDistributor(true)
        callback(success)
        if success then
            ClearPedTasksImmediately(playerPed)
        end
    else
        -- handle other minigames
    end
end

function AddCircleZone(name, coords, radius, options, eventOptions)
    if Config.FrameworkTarget == 'qtarget' then
        exports.qtarget:AddCircleZone(name, vec3(coords[1], coords[2], coords[3]), radius, options, eventOptions)
    elseif Config.FrameworkTarget == 'ox_target' then
        exports.qtarget:AddCircleZone(name, vec3(coords[1], coords[2], coords[3]), radius, options, eventOptions)
    elseif Config.FrameworkTarget == 'qb-target' then
        exports['qb-target']:AddCircleZone(name, vec3(coords[1], coords[2], coords[3]), radius, options, eventOptions)
    end
end

function AddTargetVehicle(name, vehicle, options, eventOptions)
    if Config.FrameworkTarget == 'qtarget' then
        exports.qtarget:Vehicle(name, vehicle, options, eventOptions)
    elseif Config.FrameworkTarget == 'ox_target' then
        exports.qtarget:Vehicle(name, vehicle, options, eventOptions)
    elseif Config.FrameworkTarget == 'qb-target' then
        exports['qb-target']:AddGlobalVehicle(name, vehicle, options, eventOptions)
    end
end

function AddTargetEntity(name, entity, options, eventOptions)
    if Config.FrameworkTarget == 'qtarget' then
        exports.qtarget:AddTargetEntity(entity, options, eventOptions)
    elseif Config.FrameworkTarget == 'ox_target' then
        exports.ox_target:AddTargetEntity(entity, options, eventOptions)
    elseif Config.FrameworkTarget == 'qb-target' then
        exports['qb-target']:AddTargetEntity(name, entity, options, eventOptions)
    end
end


function RemoveVehicleZone(name)
    if Config.FrameworkTarget == 'qtarget' then
        exports.qtarget:RemoveVehicle(name)
    elseif Config.FrameworkTarget == 'ox_target' then
        exports.qtarget:RemoveVehicle(name)
    elseif Config.FrameworkTarget == 'qb-target' then
        exports['qb-target']:RemoveGlobalVehicle(name)
    end
end

function RemoveZone(name)
    if Config.FrameworkTarget == 'qtarget' then
        exports.qtarget:RemoveZone(name)
    elseif Config.FrameworkTarget == 'ox_target' then
        exports.qtarget:RemoveZone(name)
    elseif Config.FrameworkTarget == 'qb-target' then
        exports['qb-target']:RemoveZone(name)
    end
end


TextUIShow = function(text)
    if Config.TextUI == "ox_lib" then
        lib.showTextUI(text)
    elseif Config.TextUI == "esx" then
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
    elseif Config.TextUI == "esx" then
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
    elseif Config.TextUI == "esx" then
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

function GetPlayerJob()
    if Config.Framework == 'esx' then
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
    if Config.Framework == 'esx' then
        ESX = exports["es_extended"]:getSharedObject()
    elseif Config.Framework == 'qbcore' then
        QBCore = exports["qb-core"]:GetCoreObject()
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
    end

     return vehicle
end


function RemoveVehicle(blip)
    if Config.Framework == 'esx' then
        TextUIShow('Vehicle is being taken')
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        BeforeVehicleRemoved(vehicle)
        Wait(1500)
        if DoesEntityExist(vehicle) then
            SetEntityAsMissionEntity(vehicle, true, true) 
            DeleteVehicle(vehicle)
        TextUIHide()
        RemoveBlip(blip)
        end
    elseif Config.Framework == 'qbcore' then
        TextUIShow('Vehicle is being taken')
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        BeforeVehicleRemoved(vehicle)
        Wait(1500)
        if DoesEntityExist(vehicle) then
            SetEntityAsMissionEntity(vehicle, true, true) 
            DeleteVehicle(vehicle)
        TextUIHide()
        RemoveBlip(blip)
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

Citizen.CreateThread(function()
    while true do
        local playerJob = GetPlayerJob()

        while not playerJob do
            playerJob = GetPlayerJob()
            Citizen.Wait(500)
        end
        Citizen.Wait(1000)

        if blip then
            RemoveBlip(blip)
        end

        if not Config.RequireJob or (playerJob == Config.Job) then
            local blipPos = vector3(Config.Blip.Pos[1], Config.Blip.Pos[2], Config.Blip.Pos[3])
            blip = AddBlipForCoord(blipPos.x, blipPos.y, blipPos.z)

            SetBlipSprite(blip, Config.Blip.Sprite)
            SetBlipDisplay(blip, Config.Blip.Display)
            SetBlipScale(blip, Config.Blip.Scale)
            SetBlipColour(blip, Config.Blip.Colour)
            SetBlipAsShortRange(blip, Config.Blip.ShortRange)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Blip.Name)
            EndTextCommandSetBlipName(blip)
        end

        Citizen.Wait(5000)
    end
end)



RegisterNetEvent("drc_electrician:joboutfit", function(data)
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

RegisterNetEvent("drc_electrician:civiloutfits", function()
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
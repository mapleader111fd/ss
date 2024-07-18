lib.locale()

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

if Config.Framework == "ESX" then
    RegisterNetEvent('esx:playerLoaded') 
    AddEventHandler('esx:playerLoaded', function(xPlayer, isNew)
        ESX.PlayerData = xPlayer
        ESX.PlayerLoaded = true
        TriggerServerEvent("drc_houserobbery:sync")
        TriggerServerEvent("drc_houserobbery:missionsync2")
    end)
elseif Config.Framework == "qbcore" then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        PlayerData = QBCore.Functions.GetPlayerData()
        TriggerServerEvent("drc_houserobbery:sync")
        TriggerServerEvent("drc_houserobbery:missionsync2")
    end)
end


-- Your notification type settings
-- •» You can edit a type of notifications, with chaning type or triggering your own.

RegisterNetEvent("drc_houserobbery:notify")
AddEventHandler("drc_houserobbery:notify", function(type, title, text)
    Notify(type, title, text)
end)

Notify = function(type, title, text)
    if Config.NotificationType == "ESX" then
        ESX.ShowNotification(text)
    elseif Config.NotificationType == "ox_lib" then
        if type == "info" then
            lib.notify({
                title = title,
                description = text,
                type = "inform",
                duration = 15000
            })
        elseif type == "error" then
            lib.notify({
                title = title,
                description = text,
                type = "error"
            })
        elseif type == "success" then
            lib.notify({
                title = title,
                description = text,
                type = "success"
            })
        end
    elseif Config.NotificationType == "qbcore" then
        if type == "success" then
            QBCore.Functions.Notify(text, "success", 10000)
        elseif type == "info" then
            QBCore.Functions.Notify(text, "primary", 15000)
        elseif type == "error" then
            QBCore.Functions.Notify(text, "error", 10000)
        end
    elseif Config.NotificationType == "custom" then
        print("add your notification system! in cl_Utils.lua")
        -- ADD YOUR NOTIFICATION | TYPES ARE info, error, success
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
        QBCore.Functions.Progressbar(label, label, duration, false, true, {
        }, {}, {}, {}, function()
        end)
        Wait(duration)
    elseif Config.Progress == "progressBars" then
        exports['progressBars']:startUI(duration, label)
        Wait(duration)
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

--Exports
Target = function()
    if Config.Target == "qtarget" then
        return exports['qtarget']
    end
    if Config.Target == "ox_target" then
        return exports['qtarget']
    end
    if Config.Target == "qb-target" then
        return exports['qb-target']
    end
end

Dispatch = function(coords, type)
    if Config.Dispatch.enabled then
        if Config.Dispatch.script == "cd_dispatch" then
            if type == "houserobbery" then
                local data = exports['cd_dispatch']:GetPlayerInfo()
                TriggerServerEvent('cd_dispatch:AddNotification', {
                    job_table = Config.PoliceJobs ,
                    coords = coords,
                    title = "10-90 - House Robbery",
                    message = "Alarm detected a house robbery",
                    flash = 0,
                    unique_id = tostring(math.random(0000000, 9999999)),
                    blip = {
                        sprite = 40,
                        scale = 1.2,
                        colour = 1,
                        flashes = false,
                        text = text,
                        time = (5 * 60 * 1000),
                        sound = 1,
                    }
                })
            end
        elseif Config.Dispatch.script == "linden_outlawalert" then
            if type == "houserobbery" then
                local data = { displayCode = "10-90", description = "House Robbery", isImportant = 1,
                    recipientList = Config.PoliceJobs,
                    length = '10000', infoM = 'fa-info-circle', info = "Alarm detected a house robbery" }
                local dispatchData = { dispatchData = data, caller = 'alarm', coords = coords }
                TriggerServerEvent('wf-alerts:svNotify', dispatchData)
            end
        elseif Config.Dispatch.script == "ps-disptach" then
            if type == "houserobbery" then
                exports["ps-dispatch"]:CustomAlert({
                    coords = coords,
                    message = "House Robbery",
                    dispatchCode = "10-90",
                    description = "Alarm detected a house robbery",
                    radius = 0,
                    sprite = 40,
                    color = 1,
                    scale = 1.2,
                    length = 3,
                })
            end
        elseif Config.Dispatch.script == "core-dispatch" then
            if type == "houserobbery" then
                for k, v in pairs(Config.PoliceJobs) do
                    exports['core_dispatch']:addCall("10-90", "Alarm detected a house robbery", {
                        }, {coords.xyz}, v, 10000, 11, 5 )
                end
            end
        elseif Config.Dispatch.script == "custom" then
            print("add your dispatch system! in cl_Utils.lua")
        end
    end
end

function CheckJob()
    local HasJob = false
    for _, job in pairs(Config.PoliceJobs) do
        if GetJob() == job or job == nil or not job then
            HasJob = true
        end
    end
    if HasJob then
        return true
    else
        return false
    end
end

function GetJob()
    if Config.Framework == "ESX" then
        return ESX.GetPlayerData().job.name
    elseif Config.Framework == "qbcore" then
        return QBCore.Functions.GetPlayerData().job.name
    elseif Config.Framework == "standalone" then
        -- ADD YOU FRAMEWORK
    end
end

local function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
    local nearbyEntities = {}

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        local playerPed = cache.ped
        coords = GetEntityCoords(playerPed)
    end

    for k, entity in pairs(entities) do
        local distance = #(coords - GetEntityCoords(entity))

        if distance <= maxDistance then
            nearbyEntities[#nearbyEntities + 1] = isPlayerEntities and k or entity
        end
    end

    return nearbyEntities
end

function GetAvailableVehicleSpawnPoint(SpawnPoints)
    local spawnPoints = SpawnPoints
    local found, foundSpawnPoint = false, nil

    for i = 1, #spawnPoints, 1 do
        if IsSpawnPointClear(spawnPoints[i].Coords, spawnPoints[i].Radius) then
            found, foundSpawnPoint = true, spawnPoints[i]
            break
        end
    end

    if found then
        return true, foundSpawnPoint
    else
        Notify("error", locale("error"), locale("FreeSpace"))
        return false
    end
end

function GetVehicles()
    return GetGamePool('CVehicle')
end

function GetVehiclesInArea(coords, maxDistance)
    return EnumerateEntitiesWithinDistance(GetVehicles(), false, coords, maxDistance)
end

function IsSpawnPointClear(coords, maxDistance)
    return #GetVehiclesInArea(coords, maxDistance) == 0
end

SpawnVehicle = function(model, coords, heading)
    if Config.Framework == "ESX" then
        ESX.Game.SpawnVehicle(model, coords, heading, function(vehicle)
            SetEntityHeading(vehicle, heading)
        end)
    elseif Config.Framework == "qbcore" then
        QBCore.Functions.SpawnVehicle(model, function(vehicle)
            SetEntityHeading(vehicle, heading)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
        end, coords, true)
    elseif Config.Framework == "standalone" then
        -- ADD YOU FRAMEWORK
    end
end

GetClosestCar = function(coords)
    if Config.Framework == "ESX" then
        return ESX.Game.GetClosestVehicle(coords)
    elseif Config.Framework == "qbcore" then
        return QBCore.Functions.GetClosestVehicle()
    elseif Config.Framework == "standalone" then
        -- ADD YOU FRAMEWORK
    end
end

HackingMinigame = function()
    local success = exports['howdy-hackminigame']:Begin(3, 5000)
    return success
end

LockPickMinigame = function()
    local luck = math.random(0,99)
    local success = exports["pd-safe"]:createSafe({luck})
    return success
end

local minigamefinished = nil
DoorLockPickMinigame = function()
    if Config.QuasarLockpickMinigame then
        local success = false
        TriggerEvent('lockpick:client:openLockpick', function(s)
            success = s
            minigamefinished = true
        end)
        repeat
            Citizen.Wait(100)
        until minigamefinished ~= nil
        minigamefinished = nil
        return success
    else
        local success = exports['lockpick']:startLockpick()
        return success
    end
end


AlarmSound = function()
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "alarm", 0.35)
end

DoorSound = function()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
end

RegisterNetEvent("drc_houserobbery:lootbag")
AddEventHandler("drc_houserobbery:lootbag", function()
    lib.requestAnimDict("anim@heists@ornate_bank@grab_cash")
    TaskPlayAnim(cache.ped, "anim@heists@ornate_bank@grab_cash", "intro", 3.0, 1.0, -1, 49, 0, false, false, false)
    RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
    Wait(1400)
    ClearPedTasks(cache.ped)
    SetPedComponentVariation(cache.ped, 5, Config.NeedBag.var, Config.NeedBag.color, 0)
end)

OnHouseEnter = function()
    if Config.TimeChange and Config.TimeSync == "realtime" then
        TriggerServerEvent("realtime:event")
    end
end

OnHouseLeave = function()
    if Config.TimeChange and Config.TimeSync == "realtime" then
        TriggerServerEvent("realtime:event")
    end
end
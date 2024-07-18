--
--[[ Framework specific functions ]]--
--

local framework = shConfig.framework
local ESX, QBCore

CreateThread(function()
    if framework == 'ESX' then
        ESX = exports["es_extended"]:getSharedObject()

        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function (xPlayer)
            ESX.PlayerData = xPlayer
        end)

        RegisterNetEvent('esx:setJob')
        AddEventHandler('esx:setJob', function (job)
            ESX.PlayerData.job = job
        end)
    elseif framework == 'QB' then
        QBCore = exports['qb-core']:GetCoreObject()
    end
end)

-- Use this variable if you want to set the player as police with an event from another resource.
local isPolice = false

function isPlayerPolice()
    if isPolice then
        return true
    elseif framework == 'ESX' then
        return ESX.PlayerData.job and ESX.PlayerData.job.name == "police"
    elseif framework == 'QB' then
        local playerJob = QBCore.Functions.GetPlayerData().job
        return playerJob.name == 'police' and playerJob.onduty
    else
        -- CUSTOM
        return false
    end
end

--
--[[ Boosting tablet opening ]]--
--

-- Tablet opening through a command
if clConfig.commandsEnabled then
    RegisterCommand("boosting", function()
        openTablet()
    end)
end

-- Tablet opening through an event
RegisterNetEvent("rahe-boosting:client:openTablet")
AddEventHandler("rahe-boosting:client:openTablet", function(data)
    if data and data.useThinFrame then
        SendNUIMessage({ action = 'useThinBackgroundFrame' })
    end

    openTablet()
end)


--
--[[ Using hacking device ]]--
--

-- Hacking device using through a command
if clConfig.commandsEnabled then
    RegisterCommand("usehackingdevice", function()
        useHackingDevice()
    end)
end

-- Hacking device using through an event
RegisterNetEvent("rahe-boosting:client:hackingDeviceUsed")
AddEventHandler("rahe-boosting:client:hackingDeviceUsed", function()
    useHackingDevice()
end)


--
--[[ Using GPS hacking device ]]--
--

-- GPS hacking device using function. This calls an internal encrypted function which starts the use.
if clConfig.commandsEnabled then
    RegisterCommand("usegpshackingdevice", function()
        useGpsHackingDevice()
    end)
end

-- GPS hacking device using through an event
RegisterNetEvent("rahe-boosting:client:gpsHackingDeviceUsed")
AddEventHandler("rahe-boosting:client:gpsHackingDeviceUsed", function()
    useGpsHackingDevice()
end)


--
--[[ General]]--
--

RegisterNetEvent('rahe-boosting:client:notify')
AddEventHandler('rahe-boosting:client:notify',function(message, type)
    notifyPlayer(message, type)
end)

function notifyPlayer(message, type)
    lib.notify({
        title = message,
        type = type
    })
end

-- You can do some logic here when the tablet is closed. For example, if you started an animation when opening, you can end the animation here.
RegisterNetEvent('rahe-boosting:client:tabletClosed', function()

end)

-- The event which can be used to give vehicle keys to the player after completing the hack of a special boost (A / S class).
AddEventHandler('rahe-boosting:client:giveKeys', function(vehicleId, licensePlate)

end)

-- The event which will be triggered when a player hacks the engine of an important boost. This marks the start of a high priority boost.
-- This event can be used to send a notification to police dispatch to alert the police.
AddEventHandler('rahe-boosting:client:importantBoostStarted', function(location, vehicleId, vehicleClass)

end)

-- The event which will be triggered when the players fails a GPS hack.
-- This event can be used to raise player's stress level.
AddEventHandler('rahe-boosting:client:failedGpsHack', function()

end)

-- The event which will be triggered when the players successfully completes one GPS hack.
-- This event by default is used to send a notification, but can also be used to set a circle in a bottom UI circle.
RegisterNetEvent('rahe-boosting:client:successfulGpsHack')
AddEventHandler('rahe-boosting:client:successfulGpsHack', function(hacksCompleted, hacksRequired, gainedDelay)
    notifyPlayer(translations.NOTIFICATION_GAME_HACK_SUCCESSFUL:format(gainedDelay, hacksCompleted, hacksRequired), G_NOTIFICATION_TYPE_SUCCESS)
end)
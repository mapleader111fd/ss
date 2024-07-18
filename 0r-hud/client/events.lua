AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        Wait(1000)
        Koci.Client.HUD:Start()
    end
end)

RegisterNetEvent("0r-hud:Client:HandleCallback", function(key, data)
    if Koci.Callbacks[key] then
        Koci.Callbacks[key](data)
        Koci.Callbacks[key] = nil
    end
end)

RegisterNetEvent("0r-hud:Client:OpenHudSettings", function()
    SetNuiFocus(true, true)
    Koci.Client:SendReactMessage("setRouter", "settings")
end)
RegisterNetEvent("0r-hud:Client:SetManualGear", function(newGear)
    Koci.Client.HUD.data.vehicle.manualGear = newGear
end)
-- @ --

if GetResourceState("pma-voice") == "started" then
    AddEventHandler("pma-voice:setTalkingMode", function(mode)
        Koci.Client.HUD.data.bars.voice.range = mode
    end)

    AddEventHandler("pma-voice:radioActive", function(radioTalking)
        Koci.Client.HUD.data.bars.voice.radio = radioTalking
    end)

    AddEventHandler("onResourceStart", function(resourceName)
        if not resourceName == "pma-voice" then
            return
        end
        Wait(1000)
        Koci.Client.HUD.data.bars.voice.range = LocalPlayer.state.proximity.index
    end)
elseif GetResourceState("saltychat") == "started" then
    AddEventHandler("SaltyChat_VoiceRangeChanged", function(range, index, availableVoiceRanges)
        Koci.Client.HUD.data.bars.voice.range = index
    end)
    AddEventHandler("SaltyChat_RadioTrafficStateChanged",
        function(primaryReceive, primaryTransmit, secondaryReceive, secondaryTransmit)
            Koci.Client.HUD.data.bars.voice.radio = primaryTransmit or secondaryTransmit
        end
    )
else
    TriggerServerEvent("0r-hud:Server:ErrorHandle", "Setup your custom voice resource at: client/utils.lua")
    Koci.Utils:CustomVoiceResource()
end

if Config.FrameWork == "esx" then
    RegisterNetEvent("esx:playerLoaded", function(xPlayer)
        Wait(1000)
        Koci.Client.HUD:Start(xPlayer)
    end)
    RegisterNetEvent("esx:onPlayerLogout", function(xPlayer)
        Wait(1000)
        Koci.Client.HUD:Toggle(false)
        DisplayRadar(false)
    end)

    RegisterNetEvent("esx:pauseMenuActive", function(state)
        if Koci.Client.HUD.isHidden then
            return
        end
        Koci.Client.HUD:Toggle(not state)
    end)

    RegisterNetEvent("esx_status:onTick", function(data)
        local hunger, thirst, stress
        for i = 1, #data do
            if data[i].name == "thirst" then
                thirst = math.floor(data[i].percent)
            end
            if data[i].name == "hunger" then
                hunger = math.floor(data[i].percent)
            end
            if data[i].name == "stress" then
                stress = math.floor(data[i].percent)
            end
        end
        local ped = PlayerPedId()
        local health = math.floor((GetEntityHealth(ped) - 100) / (GetEntityMaxHealth(ped) - 100) * 100)
        if health > 100 then
            health = 100
        end
        if health < 0 then
            health = 0
        end
        Koci.Client.HUD.data.bars.health = health
        Koci.Client.HUD.data.bars.armor = GetPedArmour(ped)
        Koci.Client.HUD.data.bars.hunger = hunger
        Koci.Client.HUD.data.bars.thirst = thirst
        Koci.Client.HUD.data.bars.stress = stress
    end)
end

if Config.FrameWork == "qb" then
    RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
        Wait(1000)
        Koci.Client.HUD:Start()
    end)

    RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
        Wait(1000)
        Koci.Client.HUD:Toggle(false)
        DisplayRadar(false)
    end)

    RegisterNetEvent("QBCore:Player:SetPlayerData", function(val)
        Koci.Client.PlayerData = val
    end)

    RegisterNetEvent("hud:client:UpdateStress", function(newStress)
        Koci.Client.HUD.data.bars.stress = newStress
    end)
end

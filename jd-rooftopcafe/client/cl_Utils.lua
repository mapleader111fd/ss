lib.locale()


local appearance = nil

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

local function AutoDetectBoss()
    if GetResourceState("esx_society") == "started" then
        return "esx_society"
    elseif GetResourceState("qb-management") == "started" then
        return "qb-management"
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

local function AutoDetectInventory()
    if GetResourceState("ox_inventory") == "started" then
        return "ox"
    elseif GetResourceState("qb-inventory") == "started" or GetResourceState("lj-inventory") == "started" or GetResourceState("aj-inventory") == "started" then
        return "qb"
    elseif GetResourceState("qs-inventory") == "started" then
        return "quasar"
    elseif GetResourceState("inventory") == "started" then
        return "chezza"
    end
end

if Config.Inventory == "auto-detect" then
    Config.Inventory = AutoDetectInventory()
end

if Config.Framework == "auto-detect" then
    Config.Framework = AutoDetectFramework()
end

if Config.Target == "auto-detect" then
    Config.Target = AutoDetectTarget()
end

if Config.BossMenu == "auto-detect" then
    Config.BossMenu = AutoDetectBoss()
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

-- Your notification type settings
-- •» You can edit a type of notifications, with chaning type or triggering your own.
Notify = function(type, title, text)
    if Config.NotificationType == "ESX" then
        ESX.ShowNotification(text)
    elseif Config.NotificationType == "ox_lib" then
        if type == "info" then
            lib.notify({
                title = title,
                description = text,
                type = "inform"
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
            QBCore.Functions.Notify(text, "success")
        elseif type == "info" then
            QBCore.Functions.Notify(text, "primary")
        elseif type == "error" then
            QBCore.Functions.Notify(text, "error")
        end
    elseif Config.NotificationType == "custom" then
        print("add your notification system! in cl_Utils.lua")
        -- ADD YOUR NOTIFICATION | TYPES ARE info, error, success
    end
end

ProgressBar = function(duration, label)
    if Config.Progress == "ox_lib_square" then
        lib.progressBar({
            duration = duration,
            label = label,
            useWhileDead = false,
            canCancel = false
        })
    elseif Config.Progress == "ox_lib_circle" then
        lib.progressCircle({
            duration = duration,
            position = 'bottom',
            label = label,
            useWhileDead = false,
            canCancel = false
        })
    elseif Config.Progress == "qbcore" then
        QBCore.Functions.Progressbar(label, label, duration - 500, false, true, {
        }, {}, {}, {}, function()
        end)
        Wait(duration)
    elseif Config.Progress == "progressBars" then
        exports['progressBars']:startUI(duration, label)
        Wait(duration)
    end
end

local using = false
RegisterNetEvent('drc_beanmachine:consumables', function(text, animation, duration, effect)
    if not using then
        using = true
        if animation.emote.enabled then
            dict = animation.emote.anim.dict
            clip = animation.emote.anim.clip
            model = animation.emote.prop.model
            pos = animation.emote.prop.pos
            rot = animation.emote.prop.rot
            bone = animation.emote.prop.bone
            RequestAnimDict(dict)
            while (not HasAnimDictLoaded(dict)) do Wait(0) end
            TaskPlayAnim(cache.ped, dict, clip, 3.0, 1.0, -1, 49, 0, false, false, false)
            local hash = model
            RequestModel(hash)
            while not HasModelLoaded(hash) do
                Wait(100)
                RequestModel(hash)
            end
            local prop = CreateObject(hash, GetEntityCoords(cache.ped), true, true, true)
            AttachEntityToEntity(prop, cache.ped, GetPedBoneIndex(cache.ped, bone), pos, rot,
                true, true, false, false, 1, true)
            ProgressBar(duration, text)
            DetachEntity(prop, false, false)
            DeleteEntity(prop)
            ClearPedTasks(cache.ped)
            Action(effect)
            using = false
        elseif animation.scenario.enabled then
            TaskStartScenarioInPlace(cache.ped, animation.scenario.anim.scenario, 0, false)
            ProgressBar(duration, text)
            ClearPedTasks(cache.ped)
            Action(effect)
            using = false
        end
    end
end)


Action = function(data)
    if Config.Framework == "ESX" then
        if tostring(data.status) == "drunk" then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
            local playerPed = cache.ped
            DoScreenFadeOut(800)
            Wait(1000)
            RequestAnimSet("move_m@drunk@slightlydrunk")
            while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
                Wait(0)
            end
            SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(playerPed, true)
            SetPedIsDrunk(playerPed, true)
            DoScreenFadeIn(800)
            Wait(math.random(20000, 50000))
            DoScreenFadeOut(800)
            Wait(1000)
            ClearTimecycleModifier()
            ResetScenarioTypesEnabled()
            ResetPedMovementClipset(playerPed, 0)
            SetPedIsDrunk(playerPed, false)
            SetPedMotionBlur(playerPed, false)
            DoScreenFadeIn(800)
        else
            TriggerServerEvent("drc_beanmachine:server:add", tostring(data.status), tonumber(data.add))
        end
    elseif Config.Framework == "qbcore" then
        if tostring(data.status) == "drunk" then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
            local playerPed = cache.ped
            DoScreenFadeOut(800)
            Wait(1000)
            RequestAnimSet("move_m@drunk@slightlydrunk")
            while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
                Wait(0)
            end
            SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(playerPed, true)
            SetPedIsDrunk(playerPed, true)
            DoScreenFadeIn(800)
            Wait(math.random(20000, 50000))
            DoScreenFadeOut(800)
            Wait(1000)
            ClearTimecycleModifier()
            ResetScenarioTypesEnabled()
            ResetPedMovementClipset(playerPed, 0)
            SetPedIsDrunk(playerPed, false)
            SetPedMotionBlur(playerPed, false)
            DoScreenFadeIn(800)
        else
            if tostring(data.status) == "hunger" then
                TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + tonumber(data.add) / 10000)
                TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
            elseif tostring(data.status) == "thirst" then
                TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + tonumber(data.add) / 10000)
            end
        end
    end
end

--BossMenu
OpenBossMenu = function()
    if Config.BossMenu == "esx_society" then
        TriggerEvent('esx_society:openBossMenu', "beanmachine", function(data, menu)
            ESX.CloseContext()
        end, { wash = false })
    elseif Config.BossMenu == "qb-management" then
        TriggerEvent("qb-bossmenu:client:OpenMenu")
    end
end
Target = function()
    if Config.Target == "qtarget" then
        return exports['qtarget']
    end
    if Config.Target == "qb-target" then
        return exports['qb-target']
    end
    if Config.Target == "ox_target" then
        return exports['qtarget']
    end
end

OpenStash = function(stash)
    if Config.Inventory == "qb" then
    local data = nil
    for _, stashData in pairs(Config.beanmachine.Stashes) do
        if stashData.name == stash then
            data = stashData
            break
        end
    end
    TriggerServerEvent("inventory:server:OpenInventory", "stash", stash, {
        maxweight = data.Weight,
        slots = data.Slots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", stash)
    elseif Config.Inventory == "ox" then
        exports.ox_inventory:openInventory('stash', stash)
    elseif Config.Inventory == "quasar" then
        local data = nil
        for _, stashData in pairs(Config.beanmachine.Stashes) do
            if stashData.name == stash then
                data = stashData
                break
            end
        end
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stash, {
            maxweight = data.Weight,
            slots = data.Slots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stash)
    elseif Config.Inventory == "chezza" then
        TriggerEvent('inventory:openStorage', "Stash", "stash"..stash, 100, 1000, nil)
    end
end

OpenCloakRoomMenu = function()
    lib.registerContext({
        id = 'beanmachine_cloakroom',
        title = 'CloakRoom',
        options = {
            ['Outfits'] = {
                arrow = false,
                event = 'drc_beanmachine:outfits'
            },
            ['Put on job outfit'] = {
                arrow = false,
                event = 'drc_beanmachine:beanmachinejoboutfit'
            },
            ['Put on civil outfit'] = {
                arrow = false,
                event = 'drc_beanmachine:civiloutfit'
            }
        }
    })
    lib.showContext('beanmachine_cloakroom')
end

RegisterNetEvent("drc_beanmachine:civiloutfit", function()
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

RegisterNetEvent("drc_beanmachine:beanmachinejoboutfit", function()
    if Config.Clothing == "qb-clothing" then
        if GetEntityModel(cache.ped) == `mp_m_freemode_01` then
			local Male = {
				outfitData = {
					["pants"]       = { item = 28, texture = 0},
					["arms"]        = { item = 1, texture = 0},  
					["t-shirt"]     = { item = 22, texture = 2},  
					["torso2"]      = { item = 1, texture =11}, 
					["shoes"]       = { item = 21, texture = 0},  
                    ["chain"]         = { item = 2, texture = 11},  
				},
			}
			TriggerEvent('qb-clothing:client:loadOutfit', Male)
		else
			local Female = {
				outfitData = {
					["pants"]       = { item = 7, texture = 0},  
					["arms"]        = { item = 4, texture = 0},  
					["t-shirt"]     = { item = 9, texture = 0},  
					["vest"]        = { item = 0, texture = 0},  
					["torso2"]      = { item = 16, texture = 5}, 
					["shoes"]       = { item = 6, texture = 0}, 
                    ["chain"]         = { item = 7, texture = 0}, 
				},
			}
			TriggerEvent('qb-clothing:client:loadOutfit', Female)
		end
    end
    
    if Config.Clothing == "ox_appearance" or Config.Clothing == "fivem-appearance" then
        if not appearance then
            appearance = exports['fivem-appearance']:getPedAppearance(PlayerPedId())
        end
        if GetEntityModel(cache.ped) == `mp_m_freemode_01` then
            arms = {component_id = 3, texture = 0, drawable = 1}
            torso = {component_id = 11, texture = 1, drawable = 11}
            undershirt = {component_id = 8, texture = 2, drawable = 22}
            pants = {component_id = 4, texture = 0, drawable = 28}
            shoes = {component_id = 6, texture = 0, drawable = 21}
            accesories = {component_id = 7, texture = 11, drawable = 2}
            exports['fivem-appearance']:setPedComponents(cache.ped, {torso, undershirt, pants, shoes, accesories, arms})
        else
            arms = {component_id = 3, texture = 0, drawable = 4}
            torso = {component_id = 11, texture = 5, drawable = 16}
            undershirt = {component_id = 8, texture = 0, drawable = 9}
            pants = {component_id = 4, texture = 0, drawable = 7}
            shoes = {component_id = 6, texture = 0, drawable = 6}
            bag = {component_id = 5, texture = 0, drawable = 0}
            accesories = {component_id = 7, texture = 0, drawable = 0}
            kevlar = {component_id = 9, texture = 0, drawable = 0}
            badge = {component_id = 10, texture = 0, drawable = 0}
            hat = {component_id = 0, texture = 0, drawable = 0}
            exports['fivem-appearance']:setPedComponents(cache.ped, {torso, undershirt, pants, shoes, bag, accesories, kevlar, badge, arms})
        end
    end
    if Config.Clothing == "esx_skin" then
        TriggerEvent('skinchanger:getSkin', function(skin)
        if GetEntityModel(cache.ped) == `mp_m_freemode_01` then
                TriggerEvent('skinchanger:loadSkin', {
                    tshirt_1 = 22,
                    tshirt_2 = 2,
                    arms     = 1,
                    torso_1  = 11,
                    torso_2  = 1,
                    pants_1  = 28,
                    pants_2  = 0,
                    shoes_1 = 21,
                    shoes_2 = 0,
                    chain_1 = 11,
                    chain_2 = 2,
                })
            else
                TriggerEvent('skinchanger:loadSkin', {
                    sex = 1,
                    tshirt_1 = 9,
                    tshirt_2 = 0,
                    arms = 4,
                    torso_1 = 16,
                    torso_2 = 5,
                    pants_1 = 7,
                    pants_2 = 0,
                    shoes_1 = 6,
                    shoes_2 = 0,
                })
            end
        end)
    end
end)
RegisterNetEvent("drc_beanmachine:outfits", function()
    if Config.Clothing == "esx_skin" then
        ESX.TriggerServerCallback('drc_beanmachine:getPlayerDressing', function(dressing)
            local elements = {}

            for i = 1, #dressing, 1 do
                table.insert(elements, {
                    label = dressing[i],
                    value = i
                })
            end

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
                title    = "CloakRoom",
                align    = 'top-left',
                elements = elements
            }, function(data, menu)
                TriggerEvent('skinchanger:getSkin', function(skin)
                    ESX.TriggerServerCallback('drc_beanmachine:getPlayerOutfit', function(clothes)
                        TriggerEvent('skinchanger:loadClothes', skin, clothes)
                        TriggerEvent('esx_skin:setLastSkin', skin)

                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end, data.current.value)
                end)
            end, function(data, menu)
                menu.close()
            end)
        end)
    elseif Config.Clothing == "ox_appearance" then
        TriggerEvent("ox_appearance:wardrobe")
    elseif Config.Clothing == "fivem-appearance" then
        TriggerEvent("fivem-appearance:clothingShop")
    elseif Config.Clothing == "qb-clothing" then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "Clothes1", 0.4)
        TriggerEvent('qb-clothing:client:openOutfitMenu')
    end
end)
--Config.Blips creating
CreateThread(function()
    for _, v in pairs(Config.Blips) do
        local blip = AddBlipForCoord(v.BlipCoords)
        SetBlipSprite(blip, v.Sprite)
        SetBlipDisplay(blip, v.Display)
        SetBlipScale(blip, v.Scale)
        SetBlipColour(blip, v.Colour)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(v.Name)
        EndTextCommandSetBlipName(blip)
    end
end)

--job Blips
CreateThread(function()
    while not GetJob() do
        Wait(1000)
    end
    if GetJob() == Config.JobName and not ShopBlips then
        for _, v in pairs(Config.JobBlips) do
            local ShopBlips = AddBlipForCoord(v.BlipCoords)
            SetBlipSprite(ShopBlips, v.Sprite)
            SetBlipDisplay(ShopBlips, v.Display)
            SetBlipScale(ShopBlips, v.Scale)
            SetBlipColour(ShopBlips, v.Colour)
            SetBlipAsShortRange(ShopBlips, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(v.Name)
            EndTextCommandSetBlipName(ShopBlips)
        end
    end
end)

--Get Player job
function GetJob()
    if Config.Framework == "ESX" then
        if ESX.GetPlayerData().job then
            return ESX.GetPlayerData().job.name
        else
            return false
        end
    elseif Config.Framework == "qbcore" then
        if QBCore.Functions.GetPlayerData().job then
            return QBCore.Functions.GetPlayerData().job.name
        else
            return false
        end
    end
end

SpawnVehicle = function(model, coords, heading, livery)
    if Config.Framework == "ESX" then
        ESX.Game.SpawnVehicle(model, coords, heading, function(vehicle)
            SetEntityHeading(vehicle, heading)
            SetVehicleLivery(vehicle, livery)
        end)
    elseif Config.Framework == "qbcore" then
        QBCore.Functions.SpawnVehicle(model, function(vehicle)
            SetEntityHeading(vehicle, heading)
            SetVehicleLivery(vehicle, livery)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
        end, coords, true)
    elseif Config.Framework == "standalone" then
        -- ADD YOU FRAMEWORK
    end
end

function SpawnObjects()
    if Config.MLO == "gabz" then
        CreateThread(function()
            Deserter = CreateObject(`v_res_tre_mixer`, 125.44, -1036.24, 29.25, false, false,false)
            SetEntityHeading(Deserter, 180.0)
            FreezeEntityPosition(Deserter, true)
        end)
        CreateThread(function()
            AlertButton = CreateObject(`hei_prop_bank_alarm_01`, 122.37, -1036.91, 28.97, - 1.0, false, false,false)
            SetEntityHeading(AlertButton, 159.58)
            FreezeEntityPosition(AlertButton, true)
        end)
        CreateThread(function()
            wardrobe = CreateObject(`v_res_tre_wardrobe`, 122.64398956298828, -1027.904296875, 28.27790451049804, false, false,false)
            SetEntityHeading(wardrobe, 341.82)
            FreezeEntityPosition(wardrobe, true)
        end)
        CreateThread(function()
            clipboard = CreateObject(`prop_fib_clipboard`, 126.85, -1036.0, 29.32, false, false,false)
            SetEntityHeading(clipboard, 250.14)
            FreezeEntityPosition(clipboard, true)
        end)
        CreateThread(function()
            chop = CreateObject(`v_res_fa_chopbrd`, 124.17, -1037.8, 29.24, false, false,false)
            SetEntityHeading(chop, 249.6)
            FreezeEntityPosition(chop, true)
        end)
        CreateThread(function()
            laptop = CreateObject(`prop_laptop_01a`, 126.28, -1034.54, 29.23, false, false,false)
            SetEntityHeading(laptop, 318.35)
            FreezeEntityPosition(laptop, true)
        end)
    elseif Config.MLO == "uj" then
        CreateThread(function()
            Deserter = CreateObject(`v_res_tre_mixer`, -636.6126708984375, 236.4918212890625, 82.0749252319336, false, false,false)
            SetEntityHeading(Deserter, 60.85)
            FreezeEntityPosition(Deserter, true)
        end)
        CreateThread(function()
            AlertButton = CreateObject(`hei_prop_bank_alarm_01`, 280.23, -972.76, 29.32, - 1.0, false, false,false)
            SetEntityHeading(AlertButton, 188.07)
            FreezeEntityPosition(AlertButton, true)
        end)
        CreateThread(function()
            clipboard = CreateObject(`prop_fib_clipboard`, -627.7196655273438, 228.901611328125, 82.47200012207031, false, false,false)
            SetEntityHeading(clipboard, 354.85)
            FreezeEntityPosition(clipboard, true)
        end)
        CreateThread(function()
            Phone = CreateObject(`v_res_fa_phone`, -632.9559326171875, 226.55902099609375, 82.34687805175781, false, false,false)
            SetEntityHeading(Phone, 90.94)
            FreezeEntityPosition(Phone, true)
        end)
        CreateThread(function()
            chop = CreateObject(`v_res_fa_chopbrd`, -634.49, 236.04, 82.11, false, false,false)
            SetEntityHeading(chop, 249.6)
            FreezeEntityPosition(chop, true)
        end)
        CreateThread(function()
            juice = CreateObject(`prop_juice_dispenser`, -634.2980346679688, 234.70326232910156, 82.06558990478516, false, false,false)
            SetEntityHeading(juice, 270.39)
            FreezeEntityPosition(juice, true)
        end)
        CreateThread(function()
            laptop = CreateObject(`prop_laptop_01a`, -627.3999633789062, 225.71336364746097, 81.68756103515625, false, false,false)
            SetEntityHeading(laptop, 348.18)
            FreezeEntityPosition(laptop, true)
        end)
        CreateThread(function()
            cashreg = CreateObject(`v_ret_gc_cashreg`, -634.3912353515625, 235.23858642578128, 82.08317260742188, false, false,false)
            SetEntityHeading(cashreg, 275.35)
            FreezeEntityPosition(cashreg, true)
        end)
    elseif Config.MLO == "slth" then
        CreateThread(function()
            Deserter = CreateObject(`v_res_tre_mixer`, 280.3150634765625, -975.1241455078124, 29.59253959655761, false, false,false)
            SetEntityHeading(Deserter, 200.31)
            FreezeEntityPosition(Deserter, true)
        end)
        CreateThread(function()
            AlertButton = CreateObject(`hei_prop_bank_alarm_01`, 280.23, -972.76, 29.32, - 1.0, false, false,false)
            SetEntityHeading(AlertButton, 0.44)
            FreezeEntityPosition(AlertButton, true)
        end)
        CreateThread(function()
            wardrobe = CreateObject(`v_res_tre_wardrobe`, 286.634765625, -973.8013916015624, 28.40107345581054, false, false,false)
            SetEntityHeading(wardrobe, 0.0)
            FreezeEntityPosition(wardrobe, true)
        end)
        CreateThread(function()
            clipboard = CreateObject(`prop_fib_clipboard`, 284.1087341308594, -975.6376342773438, 29.82658576965332, false, false,false)
            SetEntityHeading(clipboard, 46.06)
            FreezeEntityPosition(clipboard, true)
        end)
        CreateThread(function()
            Phone = CreateObject(`v_res_fa_phone`, 283.50604248046875, -975.3536987304688, 29.00997848510742, false, false,false)
            SetEntityHeading(Phone, 182.15)
            FreezeEntityPosition(Phone, true)
        end)
        CreateThread(function()
            sink = CreateObject(`prop_ff_sink_02`, 281.4722900390625, -975.4017944335938, 28.41128540039062, false, false,false)
            SetEntityHeading(sink, 181.39)
            FreezeEntityPosition(sink, true)
        end)
    end
end

function DeleteObjects()
    if Config.MLO == "gabz" then
        DeleteEntity(Register)
        DeleteEntity(Deserter)
        DeleteEntity(AlertButton)
        DeleteEntity(wardrobe)
        DeleteEntity(clipboard)
        DeleteEntity(chop)
        DeleteEntity(laptop)
    elseif Config.MLO == "uj" then
        DeleteEntity(AlertButton)
        DeleteEntity(clipboard)
        DeleteEntity(Phone)
        DeleteEntity(chop)
        DeleteEntity(juice)
        DeleteEntity(Deserter)
        DeleteEntity(laptop)
        DeleteEntity(cashreg)
    elseif Config.MLO == "slth" then
        DeleteEntity(wardrobe)
        DeleteEntity(clipboard)
        DeleteEntity(Phone)
        DeleteEntity(Deserter)
        DeleteEntity(AlertButton)
        DeleteEntity(sink)
    end
end

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DeleteObjects()
    end
end)

GetClosestCar = function(coords)
    if Config.Framework == "ESX" then
        return ESX.Game.GetClosestVehicle(coords)
    elseif Config.Framework == "qbcore" then
        return QBCore.Functions.GetClosestVehicle()
    elseif Config.Framework == "standalone" then
        -- ADD YOU FRAMEWORK
    end
end

Dispatch = function(coords)
    if Config.Dispatch.enabled then
        if Config.Dispatch.script == "cd_dispatch" then
            local data = exports['cd_dispatch']:GetPlayerInfo()
            TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = Config.PoliceJobs,
                coords = coords,
                title = "10-18 - Trespassing",
                message = "Trespassing reported in Bean Machine by citizen",
                flash = 0,
                unique_id = tostring(math.random(0000000, 9999999)),
                blip = {
                    sprite = sprite,
                    scale = 1.2,
                    colour = 3,
                    flashes = false,
                    text = text,
                    time = (5 * 60 * 1000),
                    sound = 1,
                }
            })
        elseif Config.Dispatch.script == "linden_outlawalert" then
            local data = { displayCode = "10-18", description = "Trespassing", isImportant = 1,
                recipientList = Config.PoliceJobs,
                length = '10000', infoM = 'fa-info-circle', info = "Trespassing reported in Bean Machine by citizen" }
            local dispatchData = { dispatchData = data, caller = 'citizen', coords = coords }
            TriggerServerEvent('wf-alerts:svNotify', dispatchData)
        elseif Config.Dispatch.script == "ps-disptach" then
            exports['ps-dispatch']:SuspiciousActivity()
        elseif Config.Dispatch.script == "custom" then
            print("add your dispatch system! in cl_Utils.lua")
        end
    end
end

-- This function is responsible for all the tooltips displayed on top right of the screen, you could
-- replace it with a custom notification etc.

local QBCore = exports['qb-core']:GetCoreObject()

function Notify(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    EndTextCommandDisplayHelp(0, 0, 0, 3000)
end

RegisterNetEvent('kq_airdrop:client:notify')
AddEventHandler('kq_airdrop:client:notify', function(message)
    Notify(message)
end)

function CreatePlaneBlip(entity, near)
    if not Config.misc.planeBlips then
        return
    end

    local blip = AddBlipForEntity(entity)

    SetBlipSprite(blip, 307)
    SetBlipColour(blip, 65)
    SetBlipScale(blip, 1.3)
    SetBlipShrink(blip, true)
    SetBlipRotation(blip, 270)

    if near then
        SetBlipFlashes(blip, true)
        SetBlipFlashInterval(blip, 300)
        BLIPS[NetworkGetNetworkIdFromEntity(entity)] = blip
    else
        BLIPS[entity] = blip
    end

    AddTextEntry('KQ_PLANE_BLIP', L('Airdrop aircraft'))

    BeginTextCommandSetBlipName('KQ_PLANE_BLIP')
    EndTextCommandSetBlipName(blip)

    return blip
end

function CreateCrateBlip(coords)
    if not Config.misc.crateBlips then
        return
    end

    local blip = AddBlipForCoord(coords)

    SetBlipSprite(blip, 478)
    SetBlipColour(blip, 65)
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, true)

    SetBlipFlashes(blip, true)
    SetBlipFlashInterval(blip, 500)

    AddTextEntry('KQ_CRATE_BLIP', L('Airdrop crate'))

    BeginTextCommandSetBlipName('KQ_CRATE_BLIP')
    EndTextCommandSetBlipName(blip)

    Citizen.SetTimeout(Config.misc.crateBlipsLifetime * 1000, function()
        RemoveBlip(blip)
    end)
end

RegisterNetEvent('kq_airdrop:client:throwFlare')
AddEventHandler('kq_airdrop:client:throwFlare', function()
    RemoveHandWeapons()
    local flare = AttachFlareToHand()
    Citizen.Wait(500)

    PlayAnim('weapons@projectile@', 'pull_pin', 48)

    Citizen.Wait(500)
    PlayAnim('weapons@projectile@', 'drop_underhand', 48)

    Citizen.Wait(200)

    RequestWeaponAsset(GetHashKey("weapon_flare"))
    while not HasWeaponAssetLoaded(GetHashKey("weapon_flare")) do
        Citizen.Wait(5)
    end

    DeleteEntity(flare)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local throwCoords = GetOffsetFromEntityInWorldCoords(playerPed, vector3(0.0, 0.7, 0.3))
    ShootSingleBulletBetweenCoords(playerCoords, throwCoords, 0, false, GetHashKey("weapon_flare"), playerPed, true, false, 1.0)

end)

function AttachFlareToHand()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    local flare = CreateWeaponObject(GetHashKey('weapon_flare'), 0, playerCoords, true, 1.0, 0)
    AttachEntityBoneToEntityBone(flare, playerPed, 0, GetPedBoneIndex(playerPed, 64081), 0, 0)
    return flare
end

function RemoveHandWeapons()
    SetCurrentPedWeapon(PlayerPedId(), -1569615261, true)
end

RegisterNetEvent('kq_airdrop:client:playHitVfx')
AddEventHandler('kq_airdrop:client:playHitVfx', function(coords, flare, chunkModel)
    CreateCrateBlip(coords)

    if GetDistanceBetweenCoords(coords, GetEntityCoords(PlayerPedId()), 0) < 200.0 then
        RequestParticleFx('core')

        UseParticleFxAssetNextCall('core');
        StartParticleFxNonLoopedAtCoord('ent_brk_wood_planks', coords, 0.0, 0.0, 0.0, 6.0, 1, 1, 1);

        UseParticleFxAssetNextCall('core');
        StartParticleFxNonLoopedAtCoord('ent_dst_wood_chunky', coords, 0.0, 0.0, 0.0, 7.0, 1, 1, 1);

        UseParticleFxAssetNextCall('core');
        StartParticleFxNonLoopedAtCoord('ent_dst_wood_chunky', coords, 0.0, 0.0, 0.0, 3.0, 1, 1, 1);

        CreateChunks(coords, chunkModel)
    end

    if flare then
        Citizen.Wait(1500)
        CreateFlare(coords)
    end

end)

function CreateChunks(coords, model)
    Citizen.CreateThread(function()
        local chunks = {}
        for i = 1, math.random(2, 3) do
            DoRequestModel(model)
            local chunk = CreateObject(model, coords + vector3(math.random(-2, 2), math.random(2, 2), 0), 1, 0, 0)
            ApplyForceToEntity(chunk, 1, vector3(math.random(-20, 20), math.random(-20, 20), math.random(5, 25)), vector3(1.0, -1.0, 0.0), 0, 1, 0, 1, 0, 1)

            table.insert(chunks, chunk)
        end

        Citizen.Wait(60000)

        for k, chunk in pairs(chunks) do
            DeleteEntity(chunk)
        end
    end)
end

function CreateFlare(coords)
    local _, z = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, 0)

    UseParticleFxAssetNextCall('core');

    if z == 0.0 then
        z = coords.z
    end
    local size = Config.misc.flareScale
    local smoke = StartParticleFxLoopedAtCoord('exp_grd_flare', vector3(coords.x, coords.y, z), 0.0, 0.0, 0.0, size, false, false, false, false)
    SetParticleFxLoopedAlpha(smoke, 0.8)
    Citizen.Wait(Config.misc.flareLifetime * 1000)
    StopParticleFxLooped(smoke, 0)
end

local CurrentCops = 0
RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

CreateThread(function()
    local PED
    while true do
        Wait(5000)

        if #(GetEntityCoords(PlayerPedId()) - Config.pedCoords) < 200 then
            if not DoesEntityExist(PED) then
                RequestModel(Config.pedModel)
                while not HasModelLoaded(Config.pedModel) do
                    Wait(0)
                end

                PED = CreatePed(0, Config.pedModel, Config.pedCoords.x, Config.pedCoords.y, Config.pedCoords.z, Config.pedHeading, false, true)

                SetModelAsNoLongerNeeded(Config.pedModel)
                FreezeEntityPosition(PED, true)
                SetEntityInvincible(PED, true)
                SetBlockingOfNonTemporaryEvents(PED, true)

                exports.ox_target:addLocalEntity(PED, {
                    {
                        icon = 'fas fa-plane',
                        label = "Request Airdrop",
                        onSelect = function()
                            if CurrentCops < Config.MinCops then
                                TriggerEvent('QBCore:Notify', "Not enough cops online", "error")
                                return
                            end

                            local count = exports.ox_inventory:Search('count', Config.neededItem)
                            if count < 1 then
                                TriggerEvent('QBCore:Notify', "You need x1 " .. Config.neededItem, "error")
                                return
                            end

                            local success = lib.skillCheck({ 'easy', 'easy', 'medium' }, {'e'})
                            if success then
                                TriggerServerEvent("airdrop:req")
                            end
                        end,
                        distance = 2.0
                    }
                })
            end
        elseif DoesEntityExist(PED) then
            exports.ox_target:removeLocalEntity(PED)
            DeleteEntity(PED)
        end

    end
end)
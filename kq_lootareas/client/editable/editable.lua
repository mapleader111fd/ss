function PickupLoot(lootData)
    TriggerServerEvent('kq_lootAreas:startPickupLoot', lootData)
end

RegisterNetEvent('kq_lootAreas:doPickup')
AddEventHandler('kq_lootAreas:doPickup', function(lootData)
    DoPickupLoot(lootData)
end)

function DoPickupLoot(lootData)
    Citizen.CreateThread(function()
        Debug(json.encode(lootData))

        local object = lootData.object
        if not DoesEntityExist(object) then
            Debug('Object does not exist. Cancel pickup')
            return
        end
    
        COLLECTING = true
        Entity(object).state:set('collecting', true)

        local prop = GetPropFromLoot(lootData)

        if prop.animation then
            local playerPed = PlayerPedId()
            local playerPos = GetEntityCoords(playerPed)
            local heading = GetHeadingFromVector_2d(playerPos.x - lootData.coords.x, playerPos.y - lootData.coords.y) + 180
            SetEntityHeading(playerPed, heading)
    
            if prop.tool then
                local toolData  = prop.tool
                CreateProp(toolData, prop.animation.duration)
            end
    
            PlayAnim(prop.animation.dict, prop.animation.anim, prop.animation.flag)
            Citizen.Wait((prop.animation.duration * 1000) + 100)
            ClearPedTasks(playerPed)
        end

        COLLECTING = false
        Entity(object).state:set('collecting', false)
        TriggerServerEvent('kq_lootAreas:pickupLoot', lootData)
    end)
end

function CreateProp(toolData, duration)
    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        local toolModel = toolData.model
        local coords = GetEntityCoords(playerPed)
        local boneIndex = GetPedBoneIndex(playerPed, toolData.bone or 28422)
    
        DoRequestModel(toolModel)
        local object = CreateObject(toolModel, coords, true, true, true)
        AttachEntityToEntity(object, playerPed, boneIndex, toolData.pos.x, toolData.pos.y, toolData.pos.z, toolData.rot.x, toolData.rot.y, toolData.rot.z, true, true, false, true, 1, true)
        
        Citizen.Wait((duration * 1000) + 100)
        DeleteObject(object)
    end)
end

function CanCollect()
    local playerPed = PlayerPedId()
    return not (IsPedInAnyVehicle(playerPed) or IsEntityDead(playerPed) or IsPedRagdoll(playerPed) or COLLECTING)
end

function PlayAnim(dict, anim, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 8.0, 5.0, flag or 1, 0, true, true, false)
    RemoveAnimDict(dict)
end

-- This function is responsible for drawing all the 3d texts ('Press [E] to prepare for an engine swap' e.g)
function Draw3DText(x, y, z, textInput, fontId, scaleX, scaleY)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, true)
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end


-- This function is responsible for all the tooltips displayed on top right of the screen, you could
-- replace it with a custom notification etc.
function ShowTooltip(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    EndTextCommandDisplayHelp(0, 0, 0, -1)
end

RegisterNetEvent('kq_lootAreas:showTooltip')
AddEventHandler('kq_lootAreas:showTooltip', function(message, prefix)
    ShowTooltip((prefix or '') .. message)
end)


function CreateBlips()
    for k, area in pairs(AREAS) do
        if area.blips then
            for b, blip in pairs(area.blips) do
                RemoveBlip(blip)
            end
            area.blips = {}
        end
    
        if area.blip then
            local blipData = area.blip
            if area.blip.blipVisible then
                local blip = CreateBlip(vector3(area.coords.x, area.coords.y, area.coords.z), blipData.icon, blipData.color, 255, blipData.scale, area.name)
        
                if not area.blips then
                    area.blips = {}
                end
        
                table.insert(area.blips, blip)
            end
            if area.blip.areaVisible then
                local blip = CreateRadiusBlip(vector3(area.coords.x, area.coords.y, area.coords.z), area.radius, blipData.color or 1, 40)
        
                if not area.blips then
                    area.blips = {}
                end
        
        
                table.insert(area.blips, blip)
            end
        end
    end
end

function CreateBlip(coords, sprite, color, alpha, scale, message)
    local blip = AddBlipForCoord(coords)
    
    SetBlipSprite(blip, sprite)
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, color)
    SetBlipAlpha(blip, alpha)
    SetBlipScale(blip, scale)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(message)
    EndTextCommandSetBlipName(blip)
    SetBlipAsShortRange(blip, true)
    
    return blip
end

function CreateRadiusBlip(coords, radius, color, alpha)
    local blip = AddBlipForRadius(coords, radius)
    
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, color)
    SetBlipAlpha(blip, alpha)
    SetBlipAsShortRange(blip, true)
    return blip
end

CreateBlips()

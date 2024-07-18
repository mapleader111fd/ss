function AddEntityToTargeting(entity, hash, collectMessage, icon)
    if (Config.target.enabled and Config.target.system) then

        local system = Config.target.system
        
        local options = {
            {
                type = 'client',
                event = 'kq_lootAreas:target:pickup',
                icon = icon,
                object = entity,
                label = collectMessage,
                canInteract = function()
                    local lootData = Entity(entity).state.itemDetails
                    if not lootData then
                        return false
                    end
                    
                    local area = AREAS[lootData.areaKey]
                    return (not Entity(entity).state.collecting) and CanCollect() and (not area.jobs or Contains(area.jobs, playerJob))
                end,
            }
        }
    
        if system == 'ox-target' or system == 'ox_target' then
            -- We use boxZone for ox_target as it otherwise wouldn't work with props that lack collisions
            local zoneId = exports[system]:addBoxZone({
                size = GetModelSizeForTarget(entity),
                coords = GetEntityCoords(entity),
                rotation = GetEntityHeading(entity),
                debug = false,
                
                options = options
            })
    
            Entity(entity).state:set('oxTargetZone', zoneId)
        else
            exports[system]:AddEntityZone(hash, entity, {
                name = hash,
                debugPoly = false,
                useZ = true,
            }, {
                options = options,
                distance = 1.75
            })
        end
    end
end

function RemoveEntityFromTargeting(hash, entity)
    if (Config.target.enabled and Config.target.system) then
        local system = Config.target.system
        if system == 'ox-target' or system == 'ox_target' then
            local zone = Entity(entity).state.oxTargetZone
            if zone == nil then
                return
            end
            Debug('remove zone', zone, entity)
            exports[system]:removeZone(zone)
        else
            exports[system]:RemoveZone(hash)
        end
    end
end

RegisterNetEvent('kq_lootAreas:target:pickup')
AddEventHandler('kq_lootAreas:target:pickup', function(data)
    local entity = tonumber(data.object)
    if not entity then
        return
    end

    local lootData = Entity(entity).state.itemDetails
    PickupLoot(lootData)
end)

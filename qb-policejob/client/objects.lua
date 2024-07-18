-- Variables
local ObjectList = {}
local SpawnedSpikes = {}
local spikemodel = `P_ld_stinger_s`
local ClosestSpike = nil
local SpikeZone = {}
local inSpikeZone = false
local isInVehicle = false

-- Functions

function GetClosestSpike()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil

    for id, _ in pairs(SpawnedSpikes) do
        if current then
            if #(pos - vector3(SpawnedSpikes[id].coords.x, SpawnedSpikes[id].coords.y, SpawnedSpikes[id].coords.z)) < dist then
                current = id
            end
        else
            dist = #(pos - vector3(SpawnedSpikes[id].coords.x, SpawnedSpikes[id].coords.y, SpawnedSpikes[id].coords.z))
            current = id
        end
    end
    ClosestSpike = current
end

local tires = {
    {bone = "wheel_lf", index = 0},
    {bone = "wheel_rf", index = 1},
    {bone = "wheel_lm", index = 2},
    {bone = "wheel_rm", index = 3},
    {bone = "wheel_lr", index = 4},
    {bone = "wheel_rr", index = 5}
}

local function wheelThread(bool)
    CreateThread(function()
        while inSpikeZone do
            if not bool then break end
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            local vehiclePos = GetEntityCoords(vehicle, false)
            local spike = GetClosestObjectOfType(vehiclePos.x, vehiclePos.y, vehiclePos.z, 15.0, spikemodel, 1, 1, 1)
            local spikePos = GetEntityCoords(spike, false)
            local distance = #(vehiclePos - spikePos)
            for a = 1, #tires do
                local tirePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, tires[a].bone))
                if #(tirePos - spikePos) < 1.8 then
                    if not IsVehicleTyreBurst(vehicle, tires[a].index, true) or IsVehicleTyreBurst(vehicle, tires[a].index, false) then
                        SetVehicleTyreBurst(vehicle, tires[a].index, false, 1000.0)
                    end
                end
            end
            Wait(3)
        end
    end)
end

local RotationToDirection = function(rot)
    local rotZ = math.rad(rot.z)
    local rotX = math.rad(rot.x)
    local cosOfRotX = math.abs(math.cos(rotX))
    return vector3(-math.sin(rotZ) * cosOfRotX, math.cos(rotZ) * cosOfRotX, math.sin(rotX))
end

local RayCastCamera = function()
    local camRot = GetGameplayCamRot()
    local camPos = GetGameplayCamCoord()
    local dir = RotationToDirection(camRot)
    local dest = camPos + (dir * 10.0)
    local ray = StartShapeTestRay(camPos, dest, 17, -1, 0)
    local _, hit, endPos, surfaceNormal, entityHit = GetShapeTestResult(ray)
    if hit == 0 then endPos = dest end
    return hit, endPos, entityHit, surfaceNormal
end

-- Events
RegisterNetEvent("QBCore:Client:EnteredVehicle", function()
    isInVehicle = true
end)

RegisterNetEvent("QBCore:Client:LeftVehicle", function()
    isInVehicle = false
end)

RegisterNetEvent('police:client:deleteObject', function(id)
    QBCore.Functions.Progressbar("remove_object", Lang:t('progressbar.remove_object'), 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
        anim = "plant_floor",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "weapons@first_person@aim_rng@generic@projectile@thermal_charge@", "plant_floor", 1.0)
        TriggerServerEvent("police:server:deleteObject", id)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "weapons@first_person@aim_rng@generic@projectile@thermal_charge@", "plant_floor", 1.0)
        QBCore.Functions.Notify(Lang:t("error.canceled"), "error")
    end)
end)

RegisterNetEvent('police:client:removeObject', function(objectId)
    NetworkRequestControlOfEntity(ObjectList[objectId].object)
    DeleteObject(ObjectList[objectId].object)
    ObjectList[objectId] = nil
end)

RegisterNetEvent('police:client:spawnObject', function(objectId, type, loc, heading)
    local x, y, z = table.unpack(loc)
    local spawnedObj = CreateObject(Config.Objects[type].model, x, y, z, true, false, false)
    PlaceObjectOnGroundProperly(spawnedObj)
    SetEntityHeading(spawnedObj, heading)
    FreezeEntityPosition(spawnedObj, Config.Objects[type].freeze)
    ObjectList[objectId] = {
        id = objectId,
        object = spawnedObj,
        coords = vector3(x, y, z - 0.3),
    }
    AddEntity(spawnedObj, {
        Distance = 2.5,
        Local = true,
        Options  = {
            {
                icon  = 'trash',
                label = Lang:t('objmenu.remove_object'),
                canInteract = function()
                    if PlayerJob.type == "leo" then return true end
                end,
                action = function(entity)
                    local ent = nil
                    for k,v in pairs(ObjectList) do
                        if Config.TargetSystem == 'qb-target' or Config.TargetSystem == 'qtarget' then ent = entity
                        elseif Config.TargetSystem == 'ox_target' then ent = entity.entity end
                        if v.object == ent then
                            TriggerEvent('police:client:deleteObject', v.id)
                        end
                    end
                end,
            },
        },
    })
end)

RegisterNetEvent('police:client:SpikePolyZone', function()
    for k,v in pairs(SpawnedSpikes) do
        if not v.pzcreated then
            v.pzcreated = true
            SpikeZone[v.netid] = BoxZone:Create(v.coords, 20, 20, {
                name="spikezone-"..v.netid,
                debugPoly = false,
                heading = v.heading+90,
                minZ = v.coords.z - 2,
                maxZ = v.coords.z + 2,
            })
            SpikeZone[v.netid]:onPlayerInOut(function(isPointInside)
                if isPointInside then
                    inSpikeZone = true
                    if isInVehicle then
                        wheelThread(true)
                    end
                else
                    inSpikeZone = false
                    wheelThread(false)
                end
            end)
        end
    end
end)

RegisterNetEvent('police:client:SpawnSpikeStrip', function()
    if #SpawnedSpikes + 1 < Config.MaxSpikes then
        if PlayerJob.type == "leo" and PlayerJob.onduty then
            local spawnCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
            local spike = CreateObject(spikemodel, spawnCoords.x, spawnCoords.y, spawnCoords.z, 1, 1, 1)
            local netid = NetworkGetNetworkIdFromEntity(spike)
            local SpikeHeading = GetEntityHeading(PlayerPedId())
            SetNetworkIdExistsOnAllMachines(netid, true)
            SetNetworkIdCanMigrate(netid, false)
            SetEntityHeading(spike, GetEntityHeading(PlayerPedId()))
            PlaceObjectOnGroundProperly(spike)
            SpawnedSpikes[#SpawnedSpikes+1] = {
                coords = vector3(spawnCoords.x, spawnCoords.y, spawnCoords.z),
                netid = netid,
                object = spike,
                heading = SpikeHeading,
                pzcreated = false
            }
            TriggerServerEvent('police:server:SyncSpikes', SpawnedSpikes)
        end
    else
        QBCore.Functions.Notify(Lang:t("error.no_spikestripe"), 'error')
    end
end)

RegisterNetEvent('police:client:SyncSpikes', function(table)
    SpawnedSpikes = table
end)

RegisterNetEvent('police:client:removeSpike', function(name)
    for k,v in pairs(SpikeZone) do
        if v.name == name then
            v:destroy()
        end
    end
end)

AddTargetModel(spikemodel, {
    Options  = {
        {
            icon  = 'fas fa-hand-holding',
            label = Lang:t('target.pickup'),
            canInteract = function()
                if PlayerJob.type == "leo" then return true end
            end,
            action = function(entity)
                GetClosestSpike()
                local spike = NetToEnt(SpawnedSpikes[ClosestSpike].netid)
                if entity == spike then
                    NetworkRegisterEntityAsNetworked(spike)
                    NetworkRequestControlOfEntity(spike)
                    SetEntityAsMissionEntity(spike)
                    Wait(500)
                    for k,v in pairs(SpikeZone) do
                        if v.name == "spikezone-"..SpawnedSpikes[ClosestSpike].netid then
                            TriggerServerEvent('police:server:removeSpike', v.name)
                        end
                    end
                    DeleteEntity(spike)
                    SpawnedSpikes[ClosestSpike] = nil
                    ClosestSpike = nil
                    TriggerServerEvent('police:server:SyncSpikes', SpawnedSpikes)
                end
            end,
        }
    }}
)

RegisterNetEvent('police:client:OpenObjectMenu', function()
    local ObjectMenu = {}
    ObjectMenu[#ObjectMenu+1] = {opthead = Lang:t('objmenu.spawn_cone'), optdesc = '', opticon = 'caret-right',
        optparams = { event = 'police:client:placeProp', args = {object = 'cone'}}}
    ObjectMenu[#ObjectMenu+1] = {opthead = Lang:t('objmenu.spawn_barrier'), optdesc = '', opticon = 'caret-right',
        optparams = { event = 'police:client:placeProp', args = {object = 'barrier'}}}
    ObjectMenu[#ObjectMenu+1] = {opthead = Lang:t('objmenu.spawn_roadsign'), optdesc = '', opticon = 'caret-right',
        optparams = { event = 'police:client:placeProp', args = {object = 'roadsign'}}}
    ObjectMenu[#ObjectMenu+1] = {opthead = Lang:t('objmenu.spawn_tent'), optdesc = '', opticon = 'caret-right',
        optparams = { event = 'police:client:placeProp', args = {object = 'tent'}}}
    ObjectMenu[#ObjectMenu+1] = {opthead = Lang:t('objmenu.spawn_light'), optdesc = '', opticon = 'caret-right',
        optparams = { event = 'police:client:placeProp', args = {object = 'light'}}}
    
    ObjectMenu[#ObjectMenu+1] = {opthead = Lang:t('menu.close_x'), opticon = 'xmark', optparams = {event = ''}}

    local header = {
        disabled = true,
        header = Lang:t('objmenu.obj_header'),
        headerid = 'police_objects_menu', -- unique
        desc = '',
        icon = 'road-barrier'
    }
    ContextSystem.Open(header, ObjectMenu)
end)


RegisterNetEvent('police:client:placeProp', function(data)
    if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then return end
    local ModelHash = Config.Objects[data.object].model
    RequestModel(ModelHash)
    while not HasModelLoaded(ModelHash) do Wait(0) end
    PolDrawText.Open(Lang:t('info.place_cancel'), Config.DrawText.position)
    local hit, dest, _, _ = RayCastCamera()
    local obj = CreateObject(ModelHash, dest.x, dest.y, dest.z, false, false, false)
    SetEntityCollision(obj, false, false)
    SetEntityAlpha(obj, 150, true)
    local placed = false
    while not placed do
        Wait(0)
        hit, dest, _, _ = RayCastCamera()
        if hit == 1 then
            SetEntityCoords(obj, dest.x, dest.y, dest.z)
            if IsControlJustPressed(0, 38) then
                placed = true
                PolDrawText.Close()
                local heading = GetEntityHeading(obj)
                DeleteObject(obj)
                local ped = PlayerPedId()
                RequestAnimDict('anim@narcotics@trash')
                while not HasAnimDictLoaded('anim@narcotics@trash') do Wait(0) end
                TaskPlayAnim(ped, 'anim@narcotics@trash', 'drop_front', 8.0, 8.0, -1, 16, 0, false, false, false)
                ProgressBar({
                    time = 2000,
                    label = Lang:t('progressbar.place_object'),
                    canCancel = true,
                    disableControl = true
                }, function(cb)
                    if cb then
                        TriggerServerEvent("police:server:spawnObject", data.object, dest, heading)
                        StopAnimTask(ped, "anim@narcotics@trash", "drop_front", 1.0)
                        placed = false
                        ClearPedTasks(ped)
                        RemoveAnimDict("anim@narcotics@trash")
                        TriggerEvent('police:client:OpenObjectMenu')
                    else
                        QBCore.Functions.Notify(Lang:t('error.canceled'), 'error', 2500)
                        StopAnimTask(ped, "anim@narcotics@trash", "drop_front", 1.0)
                        placed = false
                        ClearPedTasks(ped)
                        RemoveAnimDict("anim@narcotics@trash")
                        TriggerEvent('police:client:OpenObjectMenu')
                    end
                end)
                break
            end
            if IsControlJustPressed(0, 174) then
                local head = GetEntityHeading(obj)
                SetEntityHeading(obj, head + 5)
            end
            if IsControlJustPressed(0, 175) then
                local head = GetEntityHeading(obj)
                SetEntityHeading(obj, head - 5)
            end
            if IsControlJustPressed(0, 47) then
                PolDrawText.Close()
                placed = false
                seedUsed = false
                DeleteObject(obj)
                return
            end
        end
    end
end)
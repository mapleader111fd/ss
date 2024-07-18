function spawnBoostVehicle(contract)
    local modelHash = GetHashKey(contract.vehicleModel)
    requestModel(modelHash)

    local vehicle = CreateVehicle(modelHash, contract.pickUpLocation.x, contract.pickUpLocation.y, contract.pickUpLocation.z, contract.pickUpLocation.h, true, true)
    while not DoesEntityExist(vehicle) do
        Wait(0)
    end

    SetEntityHeading(vehicle, contract.pickUpLocation.h)
    SetVehicleEngineOn(vehicle, false, false)
    SetVehicleOnGroundProperly(vehicle)
    SetVehicleNumberPlateText(vehicle, contract.licensePlate)
    activeVehicle = vehicle

    TriggerServerEvent("rahe-boosting:server:setEntityData", VehToNet(vehicle), contract)

    if contract.isVehicleTuned == 1 then
        applyVehicleTuning(vehicle)
    end

    if contract.risks.doorsLocked then
        SetVehicleDoorsLocked(vehicle, 2)
    end
end

-- Used to unlock the vehicle doors after hacking device has been used to hack the vehicle.
function unlockVehicleDoors(vehicle)
    SetVehicleDoorsLocked(vehicle, 1)
end

-- Used to create vehicle guarding peds after the player has started the outside hack with the hacking device.
function createVehicleGuardPeds(pedType, hashKey, npcCoords)
    for _, ped in ipairs(npcCoords) do
        local guard = CreatePed(pedType, hashKey, ped[1], ped[2], ped[3], ped[4], 1, 1)

        SetPedShootRate(guard, 750)
        SetPedCombatAttributes(guard, 46, true)
        SetPedFleeAttributes(guard, 0, 0)
        SetPedAsEnemy(guard, true)
        SetPedMaxHealth(guard, 100)
        SetPedAlertness(guard, 3)
        SetPedCombatRange(guard, 0)
        SetPedCombatMovement(guard, 3)
        TaskCombatPed(guard, PlayerPedId(), 0, 16)
        GiveWeaponToPed(guard, GetHashKey(clConfig.pickUpAreaNpcWeapon), 5000, true, true)
        SetPedRelationshipGroupHash(guard, GetHashKey("HATES_PLAYER"))
    end
end

lib.onCache('vehicle', function(value)
    if not clConfig.ejectFromInvalidVehicles or not value then
        return
    end

    local boostingData = Entity(value).state.boostingData
    if boostingData and boostingData.advancedSystem and not boostingData.advancedSystemDoorsHacked then
        notifyPlayer(translations.NOTIFICATION_GAME_VEHICLE_ENTER_DOORS_NOT_HACKED, G_NOTIFICATION_TYPE_ERROR)
        TaskLeaveAnyVehicle(cache.ped, 1, 1)
    end
end)
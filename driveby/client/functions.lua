RegisterNetEvent('tac-driveby:client:seat2', function()
    ClearPedTasksImmediately(PlayerPedId())
    Wait(0)
    local CarHash = nil
    for _, data in pairs(Config.Vehicles) do
        if data.CarHash == GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), true)) then
            CarHash = data
            break
        end
    end
    if CarHash then
        AttachEntityToEntity(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true), GetEntityBoneIndexByName(GetVehiclePedIsIn(PlayerPedId(), true), "chassis"), CarHash[1].Offset.xPos, CarHash[1].Offset.yPos, CarHash[1].Offset.zPos, CarHash[1].Rotation.xRot, CarHash[1].Rotation.yRot, CarHash[1].Rotation.zRot, false, false, true, true, 2, true)
    else
        AttachEntityToEntity(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true), GetEntityBoneIndexByName(GetVehiclePedIsIn(PlayerPedId(), true), "chassis"), Config.Settings.DefaultSettings[1].Offset.xPos, Config.Settings.DefaultSettings[1].Offset.yPos, Config.Settings.DefaultSettings[1].Offset.zPos, Config.Settings.DefaultSettings[1].Rotation.xRot, Config.Settings.DefaultSettings[1].Rotation.yRot, Config.Settings.DefaultSettings[1].Rotation.zRot, false, false, true, true, 2, true)
    end
end)

RegisterNetEvent('tac-driveby:client:seat3', function()
    ClearPedTasksImmediately(PlayerPedId())
    Wait(0)
    local CarHash = nil
    for _, data in pairs(Config.Vehicles) do
        if data.CarHash == GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), true)) then
            CarHash = data
            break
        end
    end
    if CarHash then
        AttachEntityToEntity(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true), GetEntityBoneIndexByName(GetVehiclePedIsIn(PlayerPedId(), true), "chassis"), CarHash[3].Offset.xPos, CarHash[3].Offset.yPos, CarHash[3].Offset.zPos, CarHash[3].Rotation.xRot, CarHash[3].Rotation.yRot, CarHash[3].Rotation.zRot, false, false, true, true, 2, true)
    else
        AttachEntityToEntity(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true), GetEntityBoneIndexByName(GetVehiclePedIsIn(PlayerPedId(), true), "chassis"), Config.Settings.DefaultSettings[2].Offset.xPos, Config.Settings.DefaultSettings[2].Offset.yPos, Config.Settings.DefaultSettings[2].Offset.zPos, Config.Settings.DefaultSettings[2].Rotation.xRot, Config.Settings.DefaultSettings[2].Rotation.yRot, Config.Settings.DefaultSettings[2].Rotation.z2Rot, false, false, true, true, 2, true)
    end
end)

RegisterNetEvent('tac-driveby:client:seat4', function()
    ClearPedTasksImmediately(PlayerPedId())
    Wait(0)
    local CarHash = nil
    for _, data in pairs(Config.Vehicles) do
        if data.CarHash == GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), true)) then
            CarHash = data
            break
        end
    end
    if CarHash then
        AttachEntityToEntity(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true), GetEntityBoneIndexByName(GetVehiclePedIsIn(PlayerPedId(), true), "chassis"), CarHash[2].Offset.xPos, CarHash[2].Offset.yPos, CarHash[2].Offset.zPos, CarHash[2].Rotation.xRot, CarHash[2].Rotation.yRot, CarHash[2].Rotation.zRot, false, false, true, true, 2, true)
    else
        AttachEntityToEntity(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true), GetEntityBoneIndexByName(GetVehiclePedIsIn(PlayerPedId(), true), "chassis"), Config.Settings.DefaultSettings[3].Offset.xPos, Config.Settings.DefaultSettings[3].Offset.yPos, Config.Settings.DefaultSettings[3].Offset.zPos, Config.Settings.DefaultSettings[3].Rotation.xRotRot, Config.Settings.DefaultSettings[3].Rotation.yRot, Config.Settings.DefaultSettings[3].Rotation.zRot, false, false, true, true, 2, true)
    end
end)

RegisterNetEvent('tac-driveby:client:reset', function()
    DetachEntity(PlayerPedId(), true, true)
end)
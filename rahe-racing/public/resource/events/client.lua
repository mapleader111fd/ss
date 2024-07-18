--
-- Client-side event examples and functions which can be used if you need them for some custom development reasons.
--

AddEventHandler('rahe-racing:client:checkpointPassed', function()
    --print('rahe-racing:client:checkpointPassed')
end)


-- Race joining
AddEventHandler('rahe-racing:client:startRaceJoinDisplay', function(raceInfo)
    --print('rahe-racing:client:startRaceJoinDisplay')
    --print(DumpTable(raceInfo))
end)

AddEventHandler('rahe-racing:client:stopRaceJoinDisplay', function(raceInfo)
    --print('rahe-racing:client:stopRaceJoinDisplay')
    --print(DumpTable(raceInfo))
end)

AddEventHandler('rahe-racing:client:updateRaceJoinDisplay', function(data)
    --print('rahe-racing:client:updateRaceDisplay')
    --print(DumpTable(data))
end)

RegisterNetEvent('rahe-racing:client:newRaceCreatedCUSTOM', function(startCoords, trackName, startTime)
    print("event", startCoords)
    local blip = AddBlipForCoord(startCoords.x, startCoords.y, startCoords.z)
    SetBlipSprite(blip, 38)
    SetBlipColour(blip, 4)
    SetBlipScale(blip, 1.3)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(trackName)
    EndTextCommandSetBlipName(blip)

    TriggerEvent('QBCore:Notify', "Race starting soon, check the map!")

    SetTimeout(1000*startTime, function() RemoveBlip(blip) end)
end)

CreateThread(function()
    while true do
        Wait(5000)

        if playerRaceStatus.state == PLAYER_STATE_RACING then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped) then
                local vehicle = GetVehiclePedIsIn(ped)
                if GetPedInVehicleSeat(vehicle, -1) == ped then
                    exports["cdn-fuel"]:SetFuel(vehicle, 100.0)
                end
            end
        end
    end
end)
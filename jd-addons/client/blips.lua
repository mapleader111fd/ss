Citizen.CreateThread(function()
    -- Define the blip
    local blip = AddBlipForCoord(-157.92, -1075.56, 29.01) -- Change coordinates to your desired location

    -- Set the blip properties
    SetBlipSprite(blip, 614) -- Set the blip icon
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 27) -- Set the blip color
    SetBlipAsShortRange(blip, true)

    -- Add a name to the blip
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Galaxy Bar") -- Change this to your desired blip name
    EndTextCommandSetBlipName(blip)
end)

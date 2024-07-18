local QBCore = exports['qb-core']:GetCoreObject()
 Citizen.CreateThread(function()
    while true do
    Citizen.Wait(1000)
    if GetIsWidescreen() then 
        -- print("true")
         SetCamEffect(0)
    else
        -- print("false")
         SetCamEffect(2)
         QBCore.Functions.Notify("Използвате забранено aspect ratio, променете го на 16:9 или 16:10", "error", 3000)
    end
    end
end)
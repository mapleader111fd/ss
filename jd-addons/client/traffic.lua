local config = {
    pedFrequency = 0.3, -- Controls the amount of random peds walking/standing around (0.0 = None | 0.5 = Half as Many | 1.0 = Normal | 2.0 = Twice as Many)
    trafficFrequency = 0.2, -- Controls the amount of vehicles driving around and also controls the amount of parked vehicles (0.0 = None | 0.5 = Half as Many| 1.0 = Normal | 2.0 = Twice as Many)
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetPedDensityMultiplierThisFrame(config.pedFrequency)
        SetScenarioPedDensityMultiplierThisFrame(config.pedFrequency, config.pedFrequency)
		
        SetRandomVehicleDensityMultiplierThisFrame(config.trafficFrequency)
        SetParkedVehicleDensityMultiplierThisFrame(config.trafficFrequency)
        SetVehicleDensityMultiplierThisFrame(config.trafficFrequency)
    end 
end)

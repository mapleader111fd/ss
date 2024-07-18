local speedUnit = Config.UnitOfSpeed == 'kmh' and 3.6 or 2.236936

function DrawText3D(x, y, z, text) -- This is the function used when using Config.Use3DText
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextDropShadow()
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


local removeCondition = true

local shootingBlacklistWeapons = {
    [`weapon_fireextinguisher`] = true,
    [`weapon_petrolcan`] = true,
    [`weapon_hazardcan`] = true,
    [`weapon_fertilizercan`] = true,
    [`weapon_grenade`] = true,
    [`weapon_bzgas`] = true,
    [`weapon_molotov`] = true,
    [`weapon_stickybomb`] = true,
    [`weapon_proxmine`] = true,
    [`weapon_snowball`] = true,
    [`weapon_pipebomb`] = true,
    [`weapon_ball`] = true,
    [`weapon_smokegrenade`] = true,
    [`weapon_flare`] = true,
    [`weapon_acidpackage`] = true,
    [`weapon_rpg`] = true,
    [`weapon_grenadelauncher`] = true,
    [`weapon_grenadelauncher_smoke`] = true,
    [`weapon_minigun`] = true,
    [`weapon_firework`] = true,
    [`weapon_railgun`] = true,
    [`weapon_hominglauncher`] = true,
    [`weapon_compactlauncher`] = true,
    [`weapon_rayminigun`] = true,
    [`weapon_emplauncher`] = true,
    [`weapon_railgunxm3`] = true,
}

Citizen.CreateThread(function()
    local waiting = 2000
    while Config.StatisticsMenu["shooting"] do
        Citizen.Wait(waiting)
        local myPed = PlayerPedId()
        waiting = 2000
        local status, weapon = GetCurrentPedWeapon(myPed, true)
        if status == 1 then
            if not shootingBlacklistWeapons[weapon] then
                waiting = 10
                if IsPedShooting(myPed) then
                    if math.random(3) >= 2 then
                        addSkill("shooting", type(Config.AddStatsValues['Shooting']) == "number" and Config.AddStatsValues['Shooting']/10.0 or math.random(Config.AddStatsValues['Shooting'][1], Config.AddStatsValues['Shooting'][2])/10.0)
                    end
                    Citizen.Wait(math.random(6500, 10000))
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.RefreshTimeAddStats)
        local myPed = PlayerPedId()
        local myVehicle = GetVehiclePedIsUsing(myPed)
        removeCondition = true
        if IsPedRunning(myPed) and Config.StatisticsMenu['condition'] then
            addSkill("condition", type(Config.AddStatsValues['Running']) == "number" and (Config.AddStatsValues['Running']/10.0)*conditionBooster or (math.random(Config.AddStatsValues['Running'][1], Config.AddStatsValues['Running'][2])/10.0)*conditionBooster)
            removeCondition = false
        elseif IsPedSwimmingUnderWater(myPed) and Config.StatisticsMenu['condition'] then
            addSkill("condition", type(Config.AddStatsValues['Swimming']) == "number" and (Config.AddStatsValues['Swimming']/10.0)*conditionBooster or (math.random(Config.AddStatsValues['Swimming'][1], Config.AddStatsValues['Swimming'][2])/10.0)*conditionBooster)
            removeCondition = false
        elseif DoesEntityExist(myVehicle) then
            local isDriver = GetPedInVehicleSeat(myVehicle, -1) == PlayerPedId()
            if isDriver then
                local speed = GetEntitySpeed(myVehicle) * speedUnit
                local vehicleClass = GetVehicleClass(myVehicle)
                if vehicleClass == 13 and speed >= Config.AddStatsValues['Cycling'].minimumSpeed and Config.StatisticsMenu['condition'] then
                    addSkill("condition", type(Config.AddStatsValues['Cycling'].value) == "number" and (Config.AddStatsValues['Cycling'].value/10.0)*conditionBooster or (math.random(Config.AddStatsValues['Cycling'].value[1], Config.AddStatsValues['Cycling'].value[2])/10.0)*conditionBooster)
                    removeCondition = false
                elseif (vehicleClass == 15 or vehicleClass == 16) and speed >= Config.AddStatsValues['Flying'].minimumSpeed and Config.StatisticsMenu['flying'] then
                    addSkill("flying", type(Config.AddStatsValues['Flying'].value) == "number" and Config.AddStatsValues['Flying'].value/10.0 or math.random(Config.AddStatsValues['Flying'].value[1], Config.AddStatsValues['Flying'].value[2])/10.0)
                elseif (vehicleClass ~= 15 and vehicleClass ~= 16 and vehicleClass ~= 14) and speed >= Config.AddStatsValues['Driving'].minimumSpeed and Config.StatisticsMenu['driving'] then
                    addSkill("driving", type(Config.AddStatsValues['Driving'].value) == "number" and Config.AddStatsValues['Driving'].value/10.0 or math.random(Config.AddStatsValues['Driving'].value[1], Config.AddStatsValues['Driving'].value[2])/10.0)
                end
            end
        end
        if myStatistics then
            if myStatistics['strenght'] and Config.EnableStrenghtModifier then
                if myStatistics['strenght'] >= 70.0 then
                    SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 2.0)
                elseif myStatistics['strenght'] >= 50.0 then
                    SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 1.5)
                elseif myStatistics['strenght'] >= 20.0 then
                    SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 1.25)
                else
                    SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 1.0)
                end
            end
            if myStatistics['condition'] then
                if myStatistics['condition'] >= 70.0 then
                    if Config.EnableRunSpeedModifier then
                        SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
                    end
                    if Config.EnableStaminaModifier then
                        StatSetInt(GetHashKey('MP0_STAMINA'), 60, true)
                    end
                elseif myStatistics['condition'] >= 50.0 then
                    if Config.EnableRunSpeedModifier then
                        SetRunSprintMultiplierForPlayer(PlayerId(), 1.35)
                    end
                    if Config.EnableStaminaModifier then
                        StatSetInt(GetHashKey('MP0_STAMINA'), 30, true)
                    end
                elseif myStatistics['condition'] >= 20.0 then
                    if Config.EnableRunSpeedModifier then
                        SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
                    end
                    if Config.EnableStaminaModifier then
                        StatSetInt(GetHashKey('MP0_STAMINA'), 15, true)
                    end
                else
                    if Config.EnableRunSpeedModifier then
                        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                    end
                    if Config.EnableStaminaModifier then
                        StatSetInt(GetHashKey('MP0_STAMINA'), 0, true)
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.RefreshTimeRemoveStats)
        if removeCondition and Config.StatisticsMenu['condition'] then
            removeSkill("condition", type(Config.RemoveStatsValues['RemoveCondition']) == "number" and Config.RemoveStatsValues['RemoveCondition']/10.0 or math.random(Config.RemoveStatsValues['RemoveCondition'][1], Config.RemoveStatsValues['RemoveCondition'][2])/10.0)
        end
        Citizen.Wait(3000)
        if removeStrength and Config.StatisticsMenu['strenght'] then
            removeSkill("strenght", type(Config.RemoveStatsValues['RemoveStrength']) == "number" and Config.RemoveStatsValues['RemoveStrength']/10.0 or math.random(Config.RemoveStatsValues['RemoveStrength'][1], Config.RemoveStatsValues['RemoveStrength'][2])/10.0)
        end
    end
end)

Citizen.CreateThread(function()
    local sleep = false
    while Config.EnableSkillDrivingEffects and Config.StatisticsMenu["driving"] do
        sleep = false
        local myVeh = GetVehiclePedIsIn(PlayerPedId(), false)
        local isDriver = GetPedInVehicleSeat(myVeh, -1) == PlayerPedId()
        if myVeh and isDriver then
            if (GetEntitySpeed(myVeh)*speedUnit > Config.SkillDrivingEffectMinimumSpeed) then
                sleep = false
                local myDrivingSkill = exports['vms_gym']:getSkill('driving')
                if myDrivingSkill < 20.0 then
                    local biasRandom = (math.random(-1, 1) + 0.0)
                    SetVehicleSteerBias(myVeh, biasRandom)
                    SetVehicleReduceGrip(myVeh, true)
                    Citizen.Wait(math.random(200, 450))
                    SetVehicleSteerBias(myVeh, biasRandom)
                    SetVehicleReduceGrip(myVeh, false)
                    Citizen.Wait(math.random(1750, 3000))
                elseif myDrivingSkill >= 20.0 and myDrivingSkill < 50.0 then
                    local biasRandom = (math.random(-7, 7) + 0.0) / 10
                    SetVehicleSteerBias(myVeh, biasRandom)
                    if (GetVehicleSteeringAngle(myVeh) > 30.0) or (GetVehicleSteeringAngle(myVeh) < -30.0) then
                        SetVehicleReduceGrip(myVeh, true)
                        Citizen.Wait(math.random(200, 450))
                        SetVehicleReduceGrip(myVeh, false)
                    end
                    Citizen.Wait(math.random(1750, 4000))
                elseif myDrivingSkill >= 50.0 and myDrivingSkill < 70.0 then
                    local biasRandom = (math.random(-5, 5) + 0.0) / 10
                    SetVehicleSteerBias(myVeh, biasRandom)
                    Citizen.Wait(math.random(2000, 6000))
                elseif myDrivingSkill >= 70.0 and myDrivingSkill < 80.0 then
                    local biasRandom = (math.random(-2, 2) + 0.0) / 10
                    SetVehicleSteerBias(myVeh, biasRandom)
                    Citizen.Wait(math.random(5000, 8000))
                end
            end
        end
        Citizen.Wait(sleep and 1000 or 500)
    end
end)
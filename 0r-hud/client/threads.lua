local pauseMenuActive = false

CreateThread(function()
    while Koci.Framework == nil do
        Koci.Framework = Utils.Functions:GetFramework()
        Wait(100)
    end
end)

function Koci.Client.HUD:MainThick()
    while true do
        if playerLoaded() then
            break
        end
        Wait(500)
    end
    CreateThread(function()
        while playerLoaded() do
            local playerId = PlayerId()
            local playerPedId = PlayerPedId()
            local playerServerId = GetPlayerServerId(playerId)
            local oxygen, stamina
            local isTalking = NetworkIsPlayerTalking(playerId)
            self.data.bars.voice.isTalking = isTalking
            self.data.bars.voice.microphone = isTalking
            oxygen = math.floor(GetPlayerUnderwaterTimeRemaining(playerId) * 10)
            stamina = math.floor(100 - GetPlayerSprintStaminaRemaining(playerId))
            self.data.bars.oxygen = IsEntityInWater(playerPedId) and oxygen or 100
            self.data.bars.stamina = stamina or 0
            self.data.bars.terminal = 100 -- ?
            self.data.bars.leaf = 100     -- ?
            self:UpdateAccounts(playerServerId)
            -- > Vehicle HUD
            if Config.Settings.VehicleHUD.active then
                local vehicle = GetVehiclePedIsIn(playerPedId, false)
                if vehicle ~= 0 and not self.data.vehicle.inVehicle then
                    if not IsThisModelABicycle(vehicle) then
                        self.data.vehicle.inVehicle = true
                        self.data.vehicle.entity = vehicle
                        self.data.vehicle.fuel.type = self:CheckVehicleFuelType(GetEntityModel(vehicle))
                        self:ActivateVehicleHud(vehicle)
                        if not self.data.isCinematicHudActive then
                            DisplayRadar(true)
                        end
                    end
                elseif vehicle == 0 and self.data.vehicle.inVehicle then
                    self.data.vehicle.inVehicle = false
                    self.data.vehicle.entity = nil
                    self.data.vehicle.isPassenger = false
                    self.data.vehicle.show = false
                    self.data.vehicle.isSeatbeltOn = false
                    self.data.vehicle.cruiseControlStatus = false
                    self.data.vehicle._lastEntitySpeed = 0
                    if not self.data.isCinematicHudActive then
                        DisplayRadar(self.data.vehicle.miniMap.alwaysActive)
                    end
                    Koci.Client:SendReactMessage("UPDATE_HUD_DATA", {
                        vehicle = self.data.vehicle,
                    })
                end
            end
            -- > Start QB
            if Config.FrameWork == "qb" then
                local _PlayerData = Koci.Client.PlayerData
                local health = math.floor(
                    (GetEntityHealth(playerPedId) - 100) /
                    (GetEntityMaxHealth(playerPedId) - 100) *
                    100
                )
                if health > 100 then
                    health = 100
                elseif health < 0 then
                    health = 0
                end
                self.data.bars.health = health
                self.data.bars.armor = _PlayerData.metadata.armor
                self.data.bars.hunger = _PlayerData.metadata.hunger
                self.data.bars.thirst = _PlayerData.metadata.thirst
                self.data.bars.stress = _PlayerData.metadata.stress
                -- > Pause menu
                if IsPauseMenuActive() then
                    pauseMenuActive = true
                    if self.data.isVisible then
                        Koci.Client.HUD:Toggle(false)
                    end
                else
                    if pauseMenuActive then
                        pauseMenuActive = false
                        if not self.data.isVisible then
                            Koci.Client.HUD:Toggle(true)
                        end
                    end
                end
                -- <
            end
            --> End QB
            --> Compass
            if Config.Settings.Compass.active then
                if self.data.compass.show and self.data.compass.onlyInVehicle and self.data.vehicle.inVehicle then
                    Koci.Client.HUD:CheckCrossRoads(playerPedId)
                    Koci.Client.HUD:HeadUpdate(playerPedId)
                elseif not self.data.compass.onlyInVehicle and self.data.compass.show then
                    Koci.Client.HUD:CheckCrossRoads(playerPedId)
                    Koci.Client.HUD:HeadUpdate(playerPedId)
                end
            end
            Koci.Client:SendReactMessage("UPDATE_HUD_DATA", {
                account = self.data.account,
                bars = self.data.bars,
                compass = self.data.compass,
            })
            Wait(125)
        end
    end)
end

function Koci.Client.HUD:fVehicleInfoThick(vehicle)
    CreateThread(function()
        while self.data.vehicle.inVehicle and DoesEntityExist(vehicle) do
            local playerPedId = PlayerPedId()
            self.data.vehicle.isPassenger = GetPedInVehicleSeat(vehicle, -1) ~= playerPedId
            local currentSpeed = GetEntitySpeed(vehicle)
            self:SeatBeltLogic(vehicle, currentSpeed)
            local engineRunning = GetIsVehicleEngineRunning(vehicle)
            local rpm = engineRunning and GetVehicleCurrentRpm(vehicle) or 0
            local gear = nil
            if self.data.vehicle.manualMode then
                if engineRunning then
                    gear = self.data.vehicle.manualGear
                end
            else
                gear = engineRunning and GetVehicleCurrentGear(vehicle) or "N"
            end
            local engineHealth = engineRunning and math.floor(GetVehicleEngineHealth(vehicle)) or 1000
            local _, lowBeam, highBeam = GetVehicleLightsState(vehicle)
            local lightsOn = false
            if lowBeam == 1 or highBeam == 1 then
                lightsOn = true
            end
            if engineHealth < 0 then
                engineHealth = 0
            end
            if gear == 0 then
                gear = "R"
            end
            self.data.vehicle.speed = self.data.vehicle.kmh and
                math.floor(currentSpeed * 3.6)
                or
                math.floor(currentSpeed * 2.237)
            if rpm > 0.5 and self.data.vehicle.speed == 0 then
                self.data.vehicle.speed = 1
            end
            self.data.vehicle.fuel.level = self:GetFuelExport() or 100
            self.data.vehicle.fuel.max_level = 100
            self.data.vehicle.rpm = rpm
            self.data.vehicle.gear = gear
            self.data.vehicle.engineHealth = engineHealth
            self.data.vehicle.lightsOn = lightsOn
            Koci.Client:SendReactMessage("UPDATE_HUD_DATA", {
                vehicle = self.data.vehicle,
            })
            Wait(self.data.vehicle.thick.wait)
        end
    end)
end

function Koci.Client.HUD:VehicleSeatBeltThick()
    if Config.Settings.Seatbelt.active then
        CreateThread(function()
            while self.data.vehicle.inVehicle and self.data.vehicle.isSeatbeltOn do
                DisableControlAction(0, 75, true)
                Wait(1)
            end
        end)
    end
end

function Koci.Client.HUD:VehicleCruiseControlThick()
    if Config.Settings.CruiseControl.active then
        local vehicleClasses = {
            [0] = true,
            [1] = true,
            [2] = true,
            [3] = true,
            [4] = true,
            [5] = true,
            [6] = true,
            [7] = true,
            [8] = true,
            [9] = true,
            [10] = true,
            [11] = true,
            [12] = true,
            [13] = false,
            [14] = false,
            [15] = false,
            [16] = false,
            [17] = true,
            [18] = true,
            [19] = true,
            [20] = true,
            [21] = false
        }
        local veh = self.data.vehicle.entity
        local vehClass = GetVehicleClass(veh)
        if not vehicleClasses[vehClass] then return end
        local speed = GetEntitySpeed(veh)
        if self.data.vehicle.cruiseControlStatus then
            self.data.vehicle.cruiseControlStatus = false
            Koci.Client:SendNotify(_t("notify.cruiseControlOff"))
            return
        end
        if speed > 0 and GetVehicleCurrentGear(veh) > 0 then
            self.data.vehicle.cruiseControlStatus = true
            Koci.Client:SendNotify(_t("notify.cruiseControlOn"))
            speed = GetEntitySpeed(veh)
            local isTurningOrHandbraking = IsControlPressed(2, 76) or IsControlPressed(2, 63) or
                IsControlPressed(2, 64)
            CreateThread(function()
                while self.data.vehicle.inVehicle and speed > 0 and not self.data.vehicle.isPassenger and self.data.vehicle.cruiseControlStatus do
                    Wait(0)
                    if not isTurningOrHandbraking and GetEntitySpeed(veh) < speed - 1.5 then
                        speed = 0
                        self.data.vehicle.cruiseControlStatus = false
                        Wait(2000)
                        Koci.Client:SendNotify(_t("notify.cruiseControlOff"))
                        break
                    end
                    if not isTurningOrHandbraking and IsVehicleOnAllWheels(veh) and GetEntitySpeed(veh) < speed then
                        SetVehicleForwardSpeed(veh, speed)
                    end
                    if IsControlJustPressed(1, 246) then
                        speed = GetEntitySpeed(veh)
                    end
                    if IsControlJustPressed(2, 72) then
                        speed = 0
                        self.data.vehicle.cruiseControlStatus = false
                        Wait(2000)
                        Koci.Client:SendNotify(_t("notify.cruiseControlOff"))
                        break
                    end
                end
            end)
        end
    end
end

function Koci.Client.HUD:LowFuelThread(vehicle)
    if Config.Settings.VehicleHUD.lowFuelNotify then
        CreateThread(function()
            while self.data.vehicle.inVehicle and DoesEntityExist(vehicle) do
                local playerPedId = PlayerPedId()
                if playerLoaded() then
                    if IsPedInAnyVehicle(playerPedId, false) and not IsThisModelABicycle(GetEntityModel(GetVehiclePedIsIn(playerPedId, false))) then
                        if self:GetFuelExport() <= 20 then -- At 20% fuel left.
                            Koci.Client:SendNotify(_t("notify.low_fuel"), "error")
                            Wait(60000)
                        end
                    end
                end
                Wait(10000)
            end
        end)
    end
end

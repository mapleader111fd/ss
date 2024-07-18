--- @ Start Core Func.

function Koci.Client:TriggerServerCallback(key, payload, func)
    if not func then
        func = function() end
    end
    Koci.Callbacks[key] = func
    TriggerServerEvent("0r-hud:Server:HandleCallback", key, payload)
end

--- A simple wrapper around SendNUIMessage that you can use to
--- dispatch actions to the React frame.
---
---@param action string The action you wish to target
---@param data any The data you wish to send along with this action
function Koci.Client:SendReactMessage(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

---@param system ("esx_notify" | "qb_notify" | "custom_notify") System to be used
---@param type string inform / success / error
---@param title string Notification text
---@param text? string (optional) description, custom notify.
---@param duration? number (optional) Duration in miliseconds, custom notify.
---@param icon? string (optional) icon.
function Koci.Client:SendNotify(title, type, duration, icon, text)
    system = Config.NotifyType
    if system == "esx_notify" then
        if Config.FrameWork == "esx" then
            Koci.Framework.ShowNotification(title, type, duration)
        end
    elseif system == "qb_notify" then
        if Config.FrameWork == "qb" then
            Koci.Framework.Functions.Notify(title, type)
        end
    elseif system == "custom_notify" then
        Utils.Functions:CustomNotify(nil, title, type, text, duration, icon)
    end
end

-- Close Radar
DisplayRadar(Koci.Client.HUD.data.vehicle.miniMap.alwaysActive)

--- Gets player data based on the configured framework.
---@return PlayerData table player data.
function Koci.Client:GetPlayerData()
    if Config.FrameWork == "esx" then
        return Koci.Framework.GetPlayerData()
    elseif Config.FrameWork == "qb" then
        return Koci.Framework.Functions.GetPlayerData()
    end
end

-- @ End core func.
-- @ Start script func.

function playerLoaded()
    return Config.FrameWork == "esx" and
        Koci.Framework.IsPlayerLoaded() or
        LocalPlayer.state.isLoggedIn
end

function Koci.Client.HUD:Start()
    Koci.Client.PlayerData = Koci.Client:GetPlayerData()
    self:MainThick()
    self:SetMiniMap(self.data.vehicle.miniMap.style)
    DisplayRadar(self.data.vehicle.miniMap.alwaysActive)
    self.data.vehicle.kmh = Config.Settings.VehicleHUD.kmH
    Koci.Client:SendReactMessage("SET_HUDS_ACTIVE", {
        bars = Config.Settings.StatusBars,
        vehicle = Config.Settings.VehicleHUD,
        compass = Config.Settings.Compass,
        account = Config.Settings.AccountHud,
    })
    Wait(500)
    Koci.Client:SendReactMessage("setLocale", locales.ui)
    Koci.Client:SendReactMessage("LOAD_HUD_STORAGE")
    Wait(500)
    Koci.Client:SendReactMessage("setVisible", true)
    Wait(5000)
    self:SetMiniMap(self.data.vehicle.miniMap.style)
end

function Koci.Client.HUD:Toggle(state)
    if state == nil then
        self.data.isVisible = not self.data.isVisible
    else
        self.data.isVisible = state
    end
    Koci.Client:SendReactMessage("setVisible", self.data.isVisible)
end

exports("ToggleVisible", function(state)
    Koci.Client.HUD:Toggle(state)
end)

function Koci.Client.HUD:SetMiniMap(_type)
    Wait(50)
    local defaultAspectRatio = 1920 / 1080
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX / resolutionY
    local minimapOffset = 0
    if aspectRatio > defaultAspectRatio then
        minimapOffset = ((defaultAspectRatio - aspectRatio) / 3.6) - 0.008
    end
    local defaultAspectRatio = 1920 / 1080
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX / resolutionY
    local minimapOffset = 0
    if aspectRatio > defaultAspectRatio then
        minimapOffset = ((defaultAspectRatio - aspectRatio) / 3.6) - 0.008
    end
    local minimap = RequestScaleformMovie("minimap")
    if not HasScaleformMovieLoaded(minimap) then
        RequestScaleformMovie(minimap)
        while not HasScaleformMovieLoaded(minimap) do
            Wait(1)
        end
    end
    if _type == "square" then
        RequestStreamedTextureDict("squaremap", false)
        if not HasStreamedTextureDictLoaded("squaremap") then
            Wait(150)
        end
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
        AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")
    else
        RequestStreamedTextureDict("circlemap", false)
        if not HasStreamedTextureDictLoaded("circlemap") then
            Wait(150)
        end
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
        AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "circlemap", "radarmasksm")
    end
    SetMinimapComponentPosition("minimap", "L", "B", 0.0 + minimapOffset, -0.047, 0.1638, 0.183)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0 + minimapOffset, 0.00, 0.128, 0.20)
    SetMinimapComponentPosition("minimap_blur", "L", "B", -0.01 + minimapOffset, 0.025, 0.262, 0.300)
    SetBlipAlpha(GetNorthRadarBlip(), 0)
    SetRadarBigmapEnabled(true, false)
    SetMinimapClipType(_type == "square" and 0 or 1)
    Wait(500)
    SetRadarBigmapEnabled(false, false)
end

function Koci.Client.HUD:GetFuelExport()
    if GetResourceState("ox_fuel") == "started" then
        if Entity(self.data.vehicle.entity) then
            local ent = Entity(self.data.vehicle.entity).state.fuel or 0
            if Config.FrameWork == "esx" then
                return Koci.Framework.Math.Round(ent, 2)
            elseif Config.FrameWork == "qb" then
                return Koci.Framework.Shared.Round(ent, 2)
            end
        else
            return false
        end
    elseif GetResourceState("LegacyFuel") == "started" then
        if Config.FrameWork == "esx" then
            return Koci.Framework.Math.Round(exports["LegacyFuel"]:GetFuel(self.data.vehicle.entity) or 0, 2)
        elseif Config.FrameWork == "qb" then
            return Koci.Framework.Shared.Round(exports["LegacyFuel"]:GetFuel(self.data.vehicle.entity) or 0, 2)
        end
    elseif GetResourceState("cdn-fuel") == "started" then
        if Config.FrameWork == "esx" then
            return Koci.Framework.Math.Round(exports["cdn-fuel"]:GetFuel(self.data.vehicle.entity) or 0, 2)
        elseif Config.FrameWork == "qb" then
            return Koci.Framework.Shared.Round(exports["cdn-fuel"]:GetFuel(self.data.vehicle.entity) or 0, 2)
        end
    elseif GetResourceState("frkn-fuelstationv3") == "started" then
        if Config.FrameWork == "esx" then
            return Koci.Framework.Math.Round(exports["frkn-fuelstationv3"]:GetFuel(self.data.vehicle.entity) or 0, 2)
        elseif Config.FrameWork == "qb" then
            return Koci.Framework.Shared.Round(exports["frkn-fuelstationv3"]:GetFuel(self.data.vehicle.entity) or 0, 2)
        end
    elseif GetResourceState("ox_fuel") == "started" then
        if Config.FrameWork == "esx" then
            return Koci.Framework.Math.Round(Entity(self.data.vehicle.entity).state.fuel or 0, 2)
        elseif Config.FrameWork == "qb" then
            return Koci.Framework.Shared.Round(Entity(self.data.vehicle.entity).state.fuel or 0, 2)
        end
    elseif GetResourceState("ps-fuel") == "started" then
        if Config.FrameWork == "esx" then
            return Koci.Framework.Math.Round(exports["ps-fuel"]:GetFuel(self.data.vehicle.entity) or 0, 2)
        elseif Config.FrameWork == "qb" then
            return Koci.Framework.Shared.Round(exports["ps-fuel"]:GetFuel(self.data.vehicle.entity) or 0, 2)
        end
    else
        local response = Koci.Utils:CustomFuelExport(self.data.vehicle.entity)
        if Config.FrameWork == "esx" then
            return Koci.Framework.Math.Round(response or 0, 2)
        elseif Config.FrameWork == "qb" then
            return Koci.Framework.Shared.Round(response or 0, 2)
        end
    end
end

function Koci.Client.HUD:VehicleDriverCheck(vehicle)
    if not DoesEntityExist(vehicle) then
        return false
    end
    if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
        return true
    end
    return false
end

function Koci.Client.HUD:ActivateVehicleHud(veh)
    self.data.vehicle.show = true
    self:fVehicleInfoThick(veh)
    self:LowFuelThread(veh)
end

function Koci.Client.HUD:UpdateVehicleHud(data)
    if self.data.vehicle.miniMap.style ~= data.miniMap.style then
        self.data.vehicle.miniMap.style = data.miniMap.style
        self:SetMiniMap(data.miniMap.style)
    end
    if self.data.vehicle.miniMap.alwaysActive ~= data.miniMap.alwaysActive then
        self.data.vehicle.miniMap.alwaysActive = data.miniMap.alwaysActive
        DisplayRadar(data.miniMap.alwaysActive)
    end
    if self.data.vehicle.speedoMeter.fps ~= data.speedoMeter.fps then
        self.data.vehicle.speedoMeter.fps = data.speedoMeter.fps
        local w = 200
        if data.speedoMeter.fps == 15 then
            w = 200
        elseif data.speedoMeter.fps == 30 then
            w = 150
        elseif data.speedoMeter.fps == 60 then
            w = 100
        end
        self.data.vehicle.thick.wait = w
    end
end

function Koci.Client.HUD:UpdateCompassHud(data)
    if self.data.compass.onlyInVehicle ~= data.onlyInVehicle then
        self.data.compass.onlyInVehicle = data.onlyInVehicle
    end
    if self.data.compass.show ~= data.show then
        self.data.compass.show = data.show
    end
end

function Koci.Client.HUD:CheckCrossRoads(entity)
    local updateTick = GetGameTimer()
    if self.data.compass.lastCrossRoadCheck == -1 or updateTick - self.data.compass.lastCrossRoadCheck > 1500 then
        local pos = GetEntityCoords(entity)
        local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
        self.data.compass.lastCrossRoadCheck = updateTick
        self.data.compass.crossRoad = {
            street1 = GetStreetNameFromHashKey(street1),
            street2 = GetStreetNameFromHashKey(street2)
        }
    end
end

function Koci.Client.HUD:HeadUpdate(entity)
    local camRot = GetGameplayCamRot(0)
    local heading = string.format("%.0f", (360.0 - ((camRot.z + 360.0) % 360.0)))
    heading = tonumber(heading)
    if heading == 360 then heading = 0 end
    if heading ~= lastHeading then
        self.data.compass.heading = heading
    end
    lastHeading = heading
end

function Koci.Client.HUD:CheckVehicleFuelType(vehicle)
    for k, v in pairs(Config.ElectricVehicles) do
        if vehicle == GetHashKey(v) then
            return "electric"
        end
    end
    return "gasoline"
end

function Koci.Client.HUD:ChangeGearMode(value)
    if Config.Settings.VehicleHUD.manualModeType then
        if Koci.Utils:hasResource("hrsgears") then
            if not Koci.Client.HUD.data.vehicle.inVehicle then
                if type(value) ~= nil then
                    Koci.Client.HUD.data.vehicle.manualMode = value
                else
                    Koci.Client.HUD.data.vehicle.manualMode = not Koci.Client.HUD.data.vehicle.manualMode
                end
                TriggerEvent("hrsgears:SetManualMode", Koci.Client.HUD.data.vehicle.manualMode)
                -- if Koci.Client.HUD.data.vehicle.manualMode then
                --     Koci.Client:SendNotify(_t("notify.opened_manual_mode"), "success")
                -- else
                --     Koci.Client:SendNotify(_t("notify.closed_manual_mode"), "success")
                -- end
            else
                Koci.Client:SendNotify(_t("notify.manual_mode_change_error"), "error")
            end
        else
            Koci.Client:SendNotify(_t("notify.hrsgears_script_error"), "error")
        end
    end
end

function Koci.Client.HUD:EjectSeat()
    local playerPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(playerPed, false)
    local coords = GetOffsetFromEntityInWorldCoords(veh, 1.0, 0.0, 1.0)
    SetEntityCoords(playerPed, coords.x, coords.y, coords.z, true, true, true, false)
    Wait(1)
    SetPedToRagdoll(playerPed, 1000, 1000, 0, false, false, false)
    SetEntityVelocity(playerPed,
        self.data.vehicle.previousVelocity.x,
        self.data.vehicle.previousVelocity.y,
        self.data.vehicle.previousVelocity.z
    )
end

function Koci.Client.HUD:SeatBeltLogic(vehicle, currentSpeed)
    if Config.Settings.Seatbelt.active then
        if self.data.vehicle.inVehicle and not self.data.vehicle.isSeatbeltOn then
            local vehClass = GetVehicleClass(vehicle)
            if Config.SeatBeltBlackListVehicles[vehClass] or IsThisModelABike(vehicle) then
                self.data.vehicle.isSeatbeltOn = true
                return
            end
            local currentBodyHealth = GetVehicleBodyHealth(vehicle)
            local playerPedId = PlayerPedId()
            local prevSpeed = self.data.vehicle._lastEntitySpeed or 0
            local prevBodyHealth = self.data.vehicle._lastBodyHealth or 0
            SetPedConfigFlag(playerPedId, 32, true)
            local isVehMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0
            local vehAcceleration = (prevSpeed - currentSpeed) / GetFrameTime()
            local speedIsBiggerThan = prevSpeed > (60 / 2.237)
            local reallyFast = vehAcceleration > 981
            local isDamaged = false
            local frameBodyChange = prevBodyHealth - currentBodyHealth
            if currentBodyHealth < 1000 and frameBodyChange > 18.0 then
                isDamaged = true
            end
            if (isVehMovingFwd and speedIsBiggerThan and reallyFast and isDamaged) then
                self:EjectSeat()
            else
                self.data.vehicle.previousVelocity = GetEntityVelocity(vehicle)
            end
            self.data.vehicle._lastEntitySpeed = currentSpeed
            self.data.vehicle._lastBodyHealth = currentBodyHealth
        end
    end
end

function Koci.Client.HUD:UpdateAccounts(serverId)
    if Config.Settings.AccountHud.active then
        self.data.account.playerServerId = serverId
        local xPlayer = Koci.Client:GetPlayerData()
        if Config.FrameWork == "esx" then
            for _, data in pairs(xPlayer.accounts or {}) do
                if data.name == "bank" then
                    self.data.account.playerBalance.bank = data.money
                elseif data.name == "money" then
                    self.data.account.playerBalance.cash = data.money
                end
            end
        elseif Config.FrameWork == "qb" then
            self.data.account.playerBalance.bank = xPlayer.money["bank"]
            self.data.account.playerBalance.cash = xPlayer.money["cash"]
        end
    end
end

function Koci.Client.HUD:ToggleSeatBelt(state)
    state = state or Koci.Client.HUD.data.vehicle.isSeatbeltOn
    if Koci.Client.HUD.data.vehicle.inVehicle then
        local class = GetVehicleClass(Koci.Client.HUD.data.vehicle.entity)
        if class == 8 or class == 13 or class == 14 then return end
        Koci.Client.HUD.data.vehicle.isSeatbeltOn = not Koci.Client.HUD.data.vehicle.isSeatbeltOn
        Koci.Client:SendNotify(Koci.Client.HUD.data.vehicle.isSeatbeltOn and
            _t("notify.seatbeltOn")
            or
            _t("notify.seatbeltOff")
        )
        if Koci.Client.HUD.data.vehicle.isSeatbeltOn then
            Koci.Client.HUD:VehicleSeatBeltThick()
        end
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5.0, Koci.Client.HUD.data.vehicle.isSeatbeltOn and "carbuckle" or "carunbuckle", 0.25)
    end
end

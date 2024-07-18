RegisterNUICallback("OnHideSettingsMenu", function(_, cb)
    SetNuiFocus(false, false)
    cb(true)
end)

RegisterNUICallback("OnGearModeChanged", function(newMode, cb)
    Wait(500)
    Koci.Client.HUD:ChangeGearMode(newMode)
    cb(true)
end)

RegisterNUICallback("OnSettingsSaved", function(_, cb)
    Koci.Client:SendNotify(_t("hud.settings.saved"))
    cb(true)
end)

RegisterNUICallback("OnVehicleHudChanged", function(data, cb)
    Koci.Client.HUD:UpdateVehicleHud(data.newVH)
    cb(true)
end)

RegisterNUICallback("OnCompassHudChanged", function(data, cb)
    Koci.Client.HUD:UpdateCompassHud(data.newCompass)
    cb(true)
end)

RegisterNUICallback("openBigMap", function(_, cb)
    SetNuiFocus(false, false)
    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_MP_PAUSE"), 0, -1)
    cb(true)
end)

RegisterNUICallback("openPauseMenu", function(_, cb)
    SetNuiFocus(false, false)
    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_LANDING_MENU"), 0, -1)
    cb(true)
end)

RegisterNUICallback("nui:setCinematicMode", function(data, cb)
    Koci.Client.HUD.data.isCinematicHudActive = data
    if data then
        DisplayRadar(false)
    else
        if Koci.Client.HUD.data.vehicle.miniMap.alwaysActive or Koci.Client.HUD.data.vehicle.inVehicle then
            DisplayRadar(true)
        end
    end
    cb(true)
end)

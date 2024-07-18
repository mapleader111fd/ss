-- Not used by the encrypted code. Registers the racing command (/racing) when you have commands enabled.
RegisterCommand("racing", function()
    if clConfig.commandsEnabled then
        openRacingTablet()
    end
end)

-- Not used by the encrypted code. Gives you the opportunity to open the racing tablet client-side.
-- This can be used from any other client-side file by using 'exports['rahe-racing']:openRacingTablet()'.
function openRacingTablet(data)
    if data and data.useThinFrame then
        SendNUIMessage({ action = 'useThinBackgroundFrame' })
    end

    openTablet()
end

-- Not used by the encrypted code. Gives you the opportunity to open the racing tablet client-side, also used by the server-side file.
-- This can be used from any other client-side file by using 'TriggerEvent('rahe-racing:client:openTablet')'.
RegisterNetEvent('rahe-racing:client:openTablet', function(data)
    openRacingTablet(data)
end)

exports('racingtablet', function(data)
    openRacingTablet(data)
end)

-- Used by the encrypted code to send notifications to players.
function notifyPlayer(message)
    TriggerEvent('chatMessage', "SERVER", "normal", message)
end

-- Not used by the encrypted code. Allows you to add logic when the tablet is closed.
-- For example if you started an animation when opened, you can end the animation here.
RegisterNetEvent('rahe-racing:client:tabletClosed', function()

end)
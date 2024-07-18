config = {
    -- Formats used in the tablet date & time section in the bottom right corner.
    timeFormat = '%02d:%02d', -- ex. 00:00
    dateFormat = '%02d.%02d.%d', -- ex. 01.01.2000

    -- If you wish the player to have an active animation while holding the tablet.
    playAnimation = true,

    -- The time (in milliseconds) how long the installation of a new application will take (if requireInstall is true for the application).
    appInstallTimer = 5000,

    -- List of applications that will be displayed in the tablet.
    -- Keep in mind applications can also be dynamically added into here from other scripts using exports['rahe-tablet']:addApplication(data).
    applications = {
        exports('usb_install', function(data, slot)
            local metadata = {}
            if data.name == 'usb_racing' then
                metadata = {
                    appId = 'rahe-racing',
                    appName = 'Racing'
                }
            elseif data.name == 'usb_boosting' then
                metadata = {
                    appId = 'rahe-boosting',
                    appName = 'Boosting'
                }
            end
        
            slot.metadata = metadata
            TriggerServerEvent('rahe-tablet:server:installApp', slot, false)
        end)
    },

    -- When the player has never enabled/disabled any of his settings, he will use the following settings.
    -- If the player has at least once changed something in their settings, then this won't be used (his saved settings will be used).
    defaultSettings = {
        {
            id = 'dark',
            label = locale('settings_dark_mode'),
            value = true
        },
        {
            id = 'background',
            label = locale('settings_transparent_background'),
            value = false
        }
    }
}
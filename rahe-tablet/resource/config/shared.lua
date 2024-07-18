shConfig = {
    -- Set the framework that you're using. Possible values: 'AUTO', 'ESX', 'QB', 'CUSTOM'
    -- When using the 'AUTO' value, the system will automatically detect if you are running QB or ESX.
    -- When using the 'CUSTOM' value, you will have to fill the functions yourself in /framework/server.lua.
    framework = 'AUTO',

    -- How should the tablet be opened. Possible values: 'command', 'inventory'
    -- When using the 'command' value, the tablet will be openable with the command '/tablet'.
    -- When using the 'inventory' value, the tablet will be openable with an item (name configurable below).
    openMethod = 'inventory',

    -- What should the usable inventory item be called. (create this in your inventory system)
    -- We are naming it 'app_tablet' instead of 'tablet' to avoid conflicts with existing 'tablet' items that people have.
    itemId = 'app_tablet',

    -- Preset image backgrounds that the user can choose between.
    -- The images used here must be placed in the 'rahe-tablet/nui/img/backgrounds' directory.
    defaultBackgrounds = { '1.webp', '2.webp', '3.webp', '4.webp', '5.webp', '6.webp', '7.webp' },

    -- Set if players should be able to use custom backgrounds in their tablet.
    allowCustomBackgrounds = true,

    -- (if custom backgrounds are enabled) If this is defined, the user will be shown a 'file upload' section in the custom background modal.
    -- It will allow the user to press a button and be instantly redirected to this website in their browser to upload a picture.
    recommendedUploadWebsite = 'https://upload.rahe.dev',

    -- (if custom backgrounds are enabled) A list of image hosts the player will be allowed to use.
    -- If you have a 'recommendedUploadWebsite' defined in the previous option, then that will automatically be added into here.
    allowedImageHosts = {
        'media.breakingls.ee',
        'media.rahe.dev'
    },

    -- If applications can be configured to require installation or not. Related settings are also: appInstallTarget, appInstallTimer.
    -- If this is set to false, then installRequired will be ignored for applications. If set to true, installRequired will be taken into account.
    installEnabled = true,

    -- Possible values: 'player', 'metadata'
    -- If 'player' - the installed apps will be saved onto the player's character identifier. Installed applications will be available on all tablets.
    -- If 'metadata' - the installed apps will be set into tablet item metadata. Installed applications will only be available on the specific tablet.
    --
    -- IMPORTANT! Metadata, by default, is only supported for ox_inventory. If 'metadata' is selected and you aren't using ox_inventory, it will be
    -- automatically be set back to 'player'. If you wish to use 'metadata' with any other inventory, you must implement it yourself.
    appInstallTarget = 'metadata',
}

lib.locale()
version '5.5'
author 'jaksam1074'

client_scripts {
    -- Callbacks
    "utils/callbacks/cl_callbacks.lua",

    -- Integrations
    'integrations/sh_integrations.lua',
    'integrations/cl_integrations.lua',

    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/cl_miscellaneous.lua",

    -- Settings
    "utils/settings/cl_settings.lua",

    -- Framework
    'utils/framework/sh_framework.lua',
    'utils/framework/cl_framework.lua',

    -- Targeting
    "utils/targeting/cl_targeting.lua",

    -- Interaction points
    "utils/interaction_points/cl_interaction_points.lua",

    -- Dialogs
    "utils/dialogs/**/cl_*.lua",

    -- Police
    "utils/police/cl_police.lua",

    -- Locales
    'locales/*.lua',

    -- Client files
    "client/main.lua",
    "client/menu.lua",
    "client/lockpick.lua",
    "client/import.lua",
    "client/battering_ram.lua"
}

server_scripts {
    -- Warnings
    "utils/warnings/sv_*.lua",

    -- Dependency
    '@mysql-async/lib/MySQL.lua',

    -- Integrations
    'integrations/sh_integrations.lua',
    'integrations/sv_integrations.lua',    

    -- Callbacks
    "utils/callbacks/sv_callbacks.lua",
    
    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/sv_miscellaneous.lua",

    -- Settings
    "utils/settings/sv_settings.lua",

    -- Framework
    'utils/framework/sh_framework.lua',
    'utils/framework/sv_framework.lua',    

    -- Dialogs
    "utils/dialogs/**/sv_*.lua",
    
    -- Police
    "utils/police/sv_police.lua",

    -- Interaction points
    "utils/interaction_points/sv_interaction_points.lua",

    -- Dependency
    '@mysql-async/lib/MySQL.lua',

    -- Locales
    'locales/*.lua',
    
    -- Database creation
    'utils/database/database.lua',

    -- Script files
    "server/main.lua",
    "server/functions.lua",
    "server/buildings.lua",
    "server/lockpick.lua",
    "server/doors_models.lua",
    "server/doors_validator.lua",
    "server/import.lua",
    "server/code_integrator.lua",
}

ui_page 'html/index.html'

files {
    "html/index.html",
    "html/index.js",
    "html/index.css",
    "html/menu_translations/*.json",
    "icons/closed.png",
    "icons/opened.png",
    "utils/dialogs/**/*.js",
    "utils/dialogs/**/*.css",
    'html/assets/**/*.*',
    'audio/*.*',
}

fx_version 'cerulean'
game 'gta5'

lua54 'yes'

this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/L1_1.ytyp' 

files {
    'stream/L1_1.ytyp',
    'stream/L1_1.ydr',
}

escrow_ignore {
    "client/lockpick.lua",
    "locales/*.lua",
    "integrations/*.lua"
}

dependencies {
    "/onesync"
}
dependency '/assetpacks'
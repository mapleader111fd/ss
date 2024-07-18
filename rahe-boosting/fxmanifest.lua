--[[ FX Information ]]--
fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name 'rahe-boosting'
author 'RAHE Development'
description 'RAHE Boosting Extended'
version '1.4.8'

--[[ Manifest ]]--
dependencies {
    'rahe-hackingdevice',
    'oxmysql',
    'ox_lib',
    '/server:5848',
    '/onesync',
}

ui_page 'tablet/nui/index.html'

files {
    'tablet/nui/index.html',
    'tablet/nui/jquery-3.6.3.min.js',
    'tablet/nui/tailwind.css',
    'tablet/nui/alpine.js',
    'tablet/nui/translations.js',
    'tablet/nui/tailwind.css',

    'tablet/nui/img/*.png',
    'tablet/nui/img/*.jpg',
    'tablet/nui/img/*.jpeg'
}

shared_scripts {
    'config/shared.lua',
    'config/translations.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'config/client.lua',
    'tablet/**/client.lua',

    'public/client.lua',
    'game/client/*.lua',
    'api/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',

    'config/server.lua',
    'tablet/**/server.lua',

    'public/server.lua',
    'game/server/*.lua',
    'api/server.lua',
}

escrow_ignore {
    'api/client.lua',
    'api/server.lua',
    'public/client.lua',
    'public/server.lua',
    'config/*.lua'
}
dependency '/assetpacks'
--[[ FX Information ]]--
fx_version 'cerulean'
lua54 'yes'
game 'gta5'

--[[ Resource Information ]]--
name 'RAHE Tablet'
author 'Edward'
description 'A tablet system by RAHE Development.'
version '1.0.1'

--[[ Manifest ]]--
dependencies {
    'oxmysql',
    'ox_lib',
    '/server:7290',
    '/onesync',
}

shared_scripts {
    '@ox_lib/init.lua',
    'resource/config/shared.lua'
}

client_scripts {
    'resource/config/client.lua',
    'resource/client/**/*.lua',
    'resource/private/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'framework/server.lua',
    'resource/server/**/*.lua',
    'resource/private/server.lua'
}

ui_page 'nui/index.html'

files {
    'locales/*.json',
    'nui/index.html',
    'nui/alpine.js',
    'nui/tailwind.css',

    'nui/img/*.png',
    'nui/img/*.jpg',
    'nui/img/*.jpeg',
    'nui/img/*.webp',
    'nui/img/backgrounds/source/*.webp',
    'nui/img/backgrounds/thumbnail/*.webp'
}

escrow_ignore {
    'framework/server.lua',
    'resource/client/*.lua',
    'resource/config/*.lua',
    'resource/server/*.lua'
}
dependency '/assetpacks'
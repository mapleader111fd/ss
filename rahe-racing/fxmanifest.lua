--[[ FX Information ]]--
fx_version 'cerulean'
lua54 'yes'
game 'gta5'

--[[ Resource Information ]]--
name 'RAHE Racing System'
author 'Edward'
description 'A feature-rich racing system by RAHE Development.'
version '2.0.4'

--[[ Manifest ]]--
dependencies {
    'oxmysql',
    'ox_lib',
    '/server:5848',
    '/onesync',
}

--[[ Exports ]]--
export 'openRacingTablet'
server_export 'openRacingTablet'

shared_scripts {
    '@ox_lib/init.lua',
    'public/**/shared.lua',
    'resource/util/shared.lua'
}

client_scripts {
    'public/**/client.lua',
    'resource/**/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'public/**/server.lua',
    'resource/**/server.lua',
    'resource/tablet/tabs/leaderboard/ratings.js'
}

ui_page 'resource/tablet/nui/index.html'

files {
    'locales/*.json',

    'resource/tablet/nui/css/*.css',
    'resource/tablet/nui/img/*.png',
    'resource/tablet/nui/js/*.js',

    'resource/tablet/nui/index.html'
}

escrow_ignore {
    'public/**/*.lua'
}
dependency '/assetpacks'
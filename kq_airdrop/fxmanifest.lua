fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Airdrop by KuzQuality'
version '1.0.2'

client_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'locale.lua',
    'client/functions.lua',
    'client/client.lua',
    'client/editable/editable.lua',
    'client/debug.lua',
}

server_scripts {
    'locale.lua',
    'config.lua',
    'server/functions.lua',
    'server/editable/server.lua',
    'server/editable/esx.lua',
    'server/editable/qb.lua',
    'server/classes/plane.lua',
    'server/classes/drop.lua',
}

escrow_ignore {
    'config.lua',
    'locale.lua',
    'client/editable/*.lua',
    'server/editable/*.lua',
}

dependencies {
    'kq_lootareas',
}

dependency '/assetpacks'
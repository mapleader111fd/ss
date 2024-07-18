fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Advanced Loot Areas by KuzQuality'
version '1.2.3'

--
-- Server
--

server_scripts {
    'config.lua',

    'server/server.lua',
    'server/functions.lua',
    'server/events.lua',
    'server/area.lua',
    'server/creation.lua',
    'server/editable/esx.lua',
    'server/editable/qb.lua',
    'server/editable/editable.lua',

    'server/jsonAreas.lua',

    'locale/locale.lua',

}

files {
    'json_areas/*.json',
}

--
-- Client
--

client_scripts {
    'config.lua',
    'client/client.lua',
    'client/events.lua',
    'client/functions.lua',
    'client/editable/editable.lua',
    'client/editable/target.lua',
    'client/editable/esx.lua',
    'client/editable/qb.lua',
    'locale/locale.lua',
}

escrow_ignore {
    'config.lua',
    'client/editable/*.lua',
    'server/editable/*.lua',
    'locale/*.lua',
}

dependency '/assetpacks'
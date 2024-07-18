fx_version 'cerulean'

game 'gta5'

author 'DRC Scripts'
description 'DRC HOUSE ROBBERY'

version '1.0.2'

lua54 'yes'

dependencies {
	'/gameBuild:2189',
	'/onesync',
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua',
}

client_scripts {
    '@mka-lasers/client/client.lua',
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

files {
    'locales/*.json'
}

escrow_ignore {
    'shared/*.lua',
    'client/cl_Utils.lua',
    'server/sv_Utils.lua',
}
dependency '/assetpacks'
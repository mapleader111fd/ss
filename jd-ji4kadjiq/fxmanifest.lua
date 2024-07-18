
fx_version 'adamant'

author 'DRC Scripts'
description 'DRC ELECTRICIAN JOB'

version '2.0'

game 'gta5'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/script.js',
	'html/styles.css',
	'html/image/*.png',
	'html/sounds/switch_on.mp3',
	'html/sounds/switch_off.mp3',
	'html/sounds/check.mp3',
	'locales/*.json'
}

shared_scripts {
	'config.lua',
	'@ox_lib/init.lua'
}

client_script {
	'client/cl_utils.lua',
	'client/*.lua',
	'config.lua'
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	'config.lua'
}

escrow_ignore {
	'config.lua',
	'client/cl_utils',
	'locales/translations.json',
	'server/sv_utils'
}

data_file 'DLC_ITYP_REQUEST' 'stream/drc_prop_electro_switch.ytyp'

lua54 'yes'
dependency '/assetpacks'
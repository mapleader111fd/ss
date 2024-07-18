
fx_version 'cerulean'

game 'gta5'

author 'DRC Scripts'
description 'DRC GARDENER JOB'

version '1.1'

lua54 'yes'

ui_page 'html/index.html'

shared_scripts {
  '@ox_lib/init.lua',
  'shared/*.lua',
}

client_script {
	'client/cl_utils.lua',
	'client/cl_main.lua',
	'client/cl_Lawnmower.lua',
	'client/cl_PlantWatering.lua',
	'client/cl_RakingLeafs.lua',
	'client/cl_treePlant.lua',
	'client/cl_CleanWeeds.lua',
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

files {
	'locales/*.json',
    'html/index.html',
    'html/styles.css',
    'html/script.js',
	'html/*.png'
}


escrow_ignore {
	'shared/*.lua',
	'client/cl_utils',
	'server/sv_utills',
	'locales/*.json'
}


data_file 'DLC_ITYP_REQUEST' 'stream/drc_scripts_prop_leaves.ytyp'
dependency '/assetpacks'
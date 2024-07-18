fx_version 'cerulean'
game 'gta5'
version '1.0.3'
lua54 'yes'
this_is_a_map 'yes'

files {
    'nteam_game.dat151.rel'
}


data_file('DLC_ITYP_REQUEST')('stream/ytyp/nteam-mile.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/mlo/nteam_lobby.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/mlo/nteam_offices.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/mlo/nteam_pool.ytyp')
data_file 'AUDIO_GAMEDATA' 'nteam_game.dat'


shared_scripts {
	'@ox_lib/init.lua',
}

client_script{
	"elevator/*.lua",
}

escrow_ignore {
	'elevator/elevator-editable.lua',
}

dependency '/assetpacks'
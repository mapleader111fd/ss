fx_version 'cerulean'
game 'gta5'
version '1.0.2'
lua54 'yes'
this_is_a_map 'yes'

data_file('DLC_ITYP_REQUEST')('stream/ytyp/nteam_ccaffe_ytyp.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/ytyp/mp_residential.ytyp')


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
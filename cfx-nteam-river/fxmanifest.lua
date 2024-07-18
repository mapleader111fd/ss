fx_version 'cerulean'
game 'gta5'
version '1.0.1'
lua54 'yes'
this_is_a_map 'yes'



data_file('DLC_ITYP_REQUEST')('stream/nteam_damm.ytyp')


file "sp_manifest.ymt"
data_file "SCENARIO_POINTS_OVERRIDE_PSO_FILE" "sp_manifest.ymt"


replace_level_meta 'gta5'

files {
	'gta5.meta',
}
dependency '/assetpacks'
fx_version 'cerulean'
games {'gta5'}
description 'xTxVxTx Black Katana V2'

files{
	'**/weaponcomponents.meta',
	'**/weaponarchetypes.meta',
	'**/weaponanimations.meta',
	'**/pedpersonality.meta',
	'**/weapons.meta',
}

data_file 'WEAPONCOMPONENTSINFO_FILE' '**/weaponcomponents.meta'
data_file 'WEAPON_METADATA_FILE' '**/weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' '**/weaponanimations.meta'
data_file 'PED_PERSONALITY_FILE' '**/pedpersonality.meta'
data_file 'WEAPONINFO_FILE' '**/weapons.meta'

client_script 'cl_weaponNames.lua'

escrow_ignore {
  'stream/*.ytd',
  'stream/*.ydr',
  'CLOTHING ITEM VERSION/*.ytd',
  'CLOTHING ITEM VERSION/*.ydd'
}

lua54 'yes'
dependency '/assetpacks'
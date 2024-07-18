fx_version "cerulean"
game "gta5"
lua54 "yes"

author 'MXC'
description 'PITSTOP'
version '1.0.0'


data_file 'TIMECYCLEMOD_FILE' 'mxc_timecycle_list_01.xml'

files {
    'mxc_timecycle_list_01.xml',
}

escrow_ignore {
    "stream/[location]/[default]/*.ydr",
}

replace_level_meta 'gta5'

data_file 'SCENARIO_POINTS_OVERRIDE_PSO_FILE' 'sp_manifest.ymt'

files {
    'gta5.meta',
    'sp_manifest.ymt',
}
dependency '/assetpacks'
fx_version 'cerulean'

game 'gta5'

author 'okok#3488'
description 'okokTuning'
version '1.1.5'

ui_page 'web/ui.html'

files {
      'web/ui.html',
      'web/**/*',
      'web/*'
}

shared_scripts {
      '@ox_lib/init.lua',
      '@qb-core/shared/vehicles.lua',
      'locales/*',
      'config.lua'
}

client_scripts {
      'cl_utils.lua',
      'client.lua'
}

server_scripts {
      '@mysql-async/lib/MySQL.lua',
      'sv_utils.lua',
      'server.lua'
}

lua54 'yes'

escrow_ignore {
      'config.lua',
      'cl_utils.lua',
      'sv_utils.lua',
      'locales/*'
}

dependencies {
      'ox_lib'
}
dependency '/assetpacks'
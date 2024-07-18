fx_version 'cerulean'
game 'gta5'

author 'Vito Gos <gttmone10@gmail.com> @.vitoo.'
description 'Custom radio integrated for pma-voice'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/**/**'
}

shared_script 'config.js'
client_scripts {
    'client/client.js',
    'client/ui.js',
}
server_script 'server/server.js'

dependencies {
    'pma-voice',
    'qb-core'
}
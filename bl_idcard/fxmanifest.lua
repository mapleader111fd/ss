fx_version 'cerulean'

game "gta5"

author "Byte Labs"
version '1.0.0'
description 'Byte Labs ID Card'
repository 'https://github.com/Byte-Labs-Project/bl_idcard'

lua54 'yes'

dependencies {
    'bl_bridge',
}

ui_page 'build/index.html'
--ui_page 'http://localhost:3000/' --for dev

shared_script {
    '@ox_lib/init.lua',
    'shared/**'
}

server_script {
    '@bl_bridge/imports/server.lua',
    'server/**'
}

client_script {
    '@bl_bridge/imports/client.lua',
    'client/**',
}

files {
    'build/**',
}

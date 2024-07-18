fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_script {
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts{
    'client/main.lua',
    'client/functions.lua'
}

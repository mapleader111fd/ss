fx_version "adamant"
game "gta5"
lua54 "yes"
version '1.2.1'

title "LB Phone - Music App"
description "A custom music app for YT link player by Nyambura for LB-Phone."
author "Breze, Nyambura"

shared_scripts {"config.lua", "shared.lua"}

client_script "client/client.lua"
server_script "server/server.lua"

files {"ui/*"}

ui_page 'ui/index.html'

escrow_ignore {
    'config.lua',
    'shared.lua'
}

dependency '/assetpacks'
dependency '/assetpacks'
name "Jim-DJBooth"
author "Jimathy"
version "1.3.2"
description 'QB-DJBooth Edit By Jimathy'
fx_version "cerulean"
game "gta5"
lua54 'yes'
dependency 'xsound'

client_scripts {'@PolyZone/client.lua', '@PolyZone/BoxZone.lua', '@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua', '@PolyZone/ComboZone.lua', 'client.lua', 'locales/*.lua' }
shared_script { 'config.lua', 'locales/*.lua', 'shared.lua' }
server_script { 'server.lua' }
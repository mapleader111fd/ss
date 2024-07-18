fx_version "cerulean"
description "Basic Hacking device minigame"

lua54 'yes'

games {
  "gta5",
}

ui_page 'web/built-source/index.html'

client_script "client/**/*"
server_script "server/**/*"

files {
  'web/built-source/index.html',
  'web/built-source/**/*'
}
dependency '/assetpacks'
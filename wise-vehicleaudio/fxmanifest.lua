fx_version 'cerulean'
games {'gta5'}

files {
  'audioconfig/npolchar_game.dat151.rel',
  'audioconfig/npolchar_sounds.dat54.rel',
  'sfx/dlc_npolchar/npolchar.awc',
  'sfx/dlc_npolchar/npolchar_npc.awc',
  'sfx/dlc_npolchar/npolchar2.awc',
  'sfx/dlc_npolchar/npolchar2_npc.awc',
  'audioconfig/ecoboostv6_game.dat151.rel',
  'audioconfig/ecoboostv6_sounds.dat54.rel',
  'sfx/dlc_ecoboostv6/ecoboostv6.awc',
  'sfx/dlc_ecoboostv6/ecoboostv6_npc.awc',
  'audioconfig/cvpiv8_game.dat151.rel',
  'audioconfig/cvpiv8_sounds.dat54.rel',
  'sfx/dlc_cvpiv8/cvpiv8.awc',
  'sfx/dlc_cvpiv8/cvpiv8_npc.awc',
}


data_file 'AUDIO_GAMEDATA' 'audioconfig/npolchar_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/npolchar_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_npolchar'
data_file 'AUDIO_GAMEDATA' 'audioconfig/ecoboostv6_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/ecoboostv6_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_ecoboostv6'
data_file 'AUDIO_GAMEDATA' 'audioconfig/cvpiv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/cvpiv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_cvpiv8'

client_script {
    'vehicle_names.lua'
}
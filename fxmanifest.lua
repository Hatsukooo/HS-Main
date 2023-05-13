fx_version 'adamant'

game 'gta5'

description 'HS-Main'

version '1.0.0'

shared_scripts {
	'@es_extended/imports.lua',
	'@ox_lib/init.lua'
}

client_scripts {
	'config.lua',
	'client/*.lua',
}

server_scripts {
	'config.lua',
	'server/*.lua',
}

lua54 'yes'

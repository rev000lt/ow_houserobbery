fx_version 'cerulean'
game 'gta5' 
lua54 'yes'


shared_scripts {
    '@es_extended/imports.lua',
    'config.lua'
}

client_scripts {
    '@ox_lib/init.lua',
    'client/*.lua'
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
    'server/*.lua'
}
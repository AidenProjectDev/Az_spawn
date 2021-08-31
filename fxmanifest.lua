fx_version 'adamant'
games { 'gta5' }

client_scripts {
    'config.lua',
    'locale.lua',
	'locales/*.lua',
    'client/cl_*.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    'config.lua',
    'locale.lua',
	'locales/*.lua',
    'server/sv_*.lua',
}
fx_version 'adamant'
games { 'gta5' }

author 'JMC'
description 'Addon Extra Horn'
version '1.0'


client_scripts {
	'client/jmc_c.lua',
	'config.lua'
}

server_script 'server/jmc_s.lua'


ui_page('html/index.html')


files({
    'html/index.html',
	'html/sounds/horn.ogg'
})


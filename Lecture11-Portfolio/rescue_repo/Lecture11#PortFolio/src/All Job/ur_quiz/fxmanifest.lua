shared_script "@bt_defender/module/shared.lua"



fx_version 'adamant'
game 'gta5'

lua54 "yes"

description ''

version '1.0'

shared_scripts{
    'config/config.lua',
}

server_scripts {
    'config/functions/config.function.server.lua',
	"core/sv_main.lua"
}

client_scripts {
    'config/functions/config.function.client.lua',
    "core/cl_main.lua"
}

ui_page 'html/index.html'
files {'html/**'}
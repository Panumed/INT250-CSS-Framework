shared_script "@bt_defender/module/shared.lua"

fx_version 'adamant'
game 'gta5'


version '1.1'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js',
    'html/sounds/*.mp3',
    'html/img/**.**'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
	"core/sv_main.lua"
}

client_scripts {
    'config.lua',
    "core/cl_main.lua"
}

lua54 'yes'
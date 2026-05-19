fx_version 'cerulean'
game 'gta5'

author 'xCore <https://xcore-fivem.com>'
description 'XCORE AIRDROP'

lua54 'yes'

shared_scripts {
	'config/config.common.lua',
	'config/config.default.lua',
	'config/config.framework.lua',
	'config/config.translate.lua',
	'config/config.sorts.lua',
	'config/config.score.lua',
	'config/functions/config.functions.shared.lua',
	'core/shared/versions.lua',
	'core/shared/common.lua',
}

server_scripts {
	'config/config.admins.lua',
	'config/config.errors.lua',
	'config/functions/config.functions.server.lua',
	'config/airdrops/**.lua',
	'core/server/server.lua'
}

client_scripts {
	'config/functions/config.functions.client.lua',
	'core/client/client.lua',
	'core/client/dev.lua',
}

ui_page 'html/ui.html'

files {
	'html/**',
}

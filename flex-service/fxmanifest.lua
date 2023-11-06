fx_version "bodacious"
game "gta5"
lua54 "yes"

author "flexiboi"
description "Flex-service"
version "1.0.0"

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

client_scripts {
	'client/main.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/CircleZone.lua',
}

escrow_ignore {
	'locales/*.lua',
	'config.lua',
}

dependencies {
	'qb-core'
}
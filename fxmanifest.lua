fx_version 'cerulean'
game 'gta5'

author 'Randolio'
description 'Burgershot Job'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'bridge/client/**.lua',
    'cl_burgershot.lua',
}

server_scripts {
    'bridge/server/**.lua',
    'sv_burgershot.lua',
}

lua54 'yes'
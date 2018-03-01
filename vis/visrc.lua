-- load standard vis module, providing parts of the Lua API
require('vis')
require('plugins/vis-ctags/ctags')
require('plugins/mouse')

vis.events.subscribe(vis.events.INIT, function()
    -- Your global configuration options

    vis:map(vis.modes.NORMAL, '-', 'dd')
    vis:map(vis.modes.NORMAL, 'Q', ':q!<Enter>')
    vis:map(vis.modes.NORMAL, '<Backspace>', '<C-y>')
    vis:map(vis.modes.NORMAL, '<Enter>', '<C-e>')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    -- Your per window configuration options e.g.
    vis:command('set numbers on')
    vis:command('set autoindent on')
    vis:command('set show-tabs on')
    vis:command('set show-newlines on')
    vis:command('set show-eof on')
    vis:command('set numbers on')
    vis:command('set tabwidth 4')
    vis:command('set expandtab on')

    vis:command('set theme solarized')

    vis:command('set colorcolumn 120')
end)

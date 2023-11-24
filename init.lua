--vim.cmd[[source ./lua/settings.lua]]
require("config")
require('settings')
require('plugins')
require('markdown')
require('nerdcommenter')
require('keymaps')
vim.cmd 'colorscheme tokyonight-moon'

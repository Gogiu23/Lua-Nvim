require('settings')
require('plugins')
require('markdown')
require('keymaps')
require("lspconfig").clangd.setup{}
require'lspconfig'.kotlin_language_server.setup{}
require'lspconfig'.marksman.setup{}
vim.cmd[[colorscheme OceanicNext]]

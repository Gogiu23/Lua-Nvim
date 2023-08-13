--vim.cmd[[source ./lua/settings]]
require('settings')
require('plugins')
require('markdown')
require('keymaps')
require("lspconfig").clangd.setup{}
require'lspconfig'.kotlin_language_server.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
require'lspconfig'.marksman.setup{}
vim.cmd[[colorscheme tokyonight-moon]]

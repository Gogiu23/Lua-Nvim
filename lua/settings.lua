--vim.g.loaded_netrw=1
--vim.g.loaded_netrwPlugin=1
vim.g.nvim_tree_disable_netrw = 0
vim.opt.termguicolors=true
vim.cmd[[let g:ruby_host_prog="/usr/bin/neovim-ruby-host.ruby2.4"]]
vim.cmd[[set splitright]]
vim.cmd[[set splitbelow]]
vim.cmd[[set noswapfile]]
vim.cmd[[set number]]
vim.cmd[[set relativenumber]]
vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set scrolloff=5]]
vim.cmd[[set scrollopt=ver]]
vim.cmd[[set path+=**]]
vim.cmd[[filetype indent on]]
vim.cmd[[set smartindent]]
vim.cmd[[filetype plugin on]]
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics,
{
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = 'Warning',
	},
	update_in_insert = true,
}
)

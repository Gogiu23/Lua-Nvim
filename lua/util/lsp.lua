local map = vim.keymap.set
local N = "n"

local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	map(N, "<leader>lf", "<cmd>Lspsaga finder<CR>", opts, { desc = "Lspsaga finder" }) -- go to definition
	map(N, "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", opts, { desc = "Lspsaga peek definition" }) -- peak definition
	map(N, "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
	map(N, "<leader>lc", "<cmd>Lspsaga code_action<CR>", opts, { desc = "code actions" })
	map(N, "<leader>lr", "<cmd>Lspsaga rename<CR>", opts, { desc = "rename" }) -- smart rename
	map(N, "gD", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	map(N, "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts, { desc = "Prev diagnostic" })
	map(N, "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts, { desc = "Next diagnostic" })
	map(N, "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", opts, { desc = "Hover documentation under cursors" })
end
return M

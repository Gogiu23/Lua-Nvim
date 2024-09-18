local M = {}

M.on_attach = function()
	local map = vim.keymap.set
	local N = "n"
	--Lspsaga
	map(N, "<leader>lf", "<cmd>Lspsaga finder<CR>", { desc = "Finder" }) -- go to definition
	map(N, "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", { desc = "See definition" }) -- peak definition
	map(N, "<leader>lc", "<cmd>Lspsaga code_action<CR>", { desc = "code actions" })
	map(N, "<leader>lr", "<cmd>Lspsaga rename<CR>", { desc = "rename" }) -- smart rename
	map(N, "<leader>lD", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "See trouble per line" }) -- show  diagnostics for line
	map(N, "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous diagnostic" })
	map(N, "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next diagnostic" })
	map(N, "<leader>la", "<cmd>Lspsaga outline<CR>", { desc = "Lspsaga outline" })
end
return M

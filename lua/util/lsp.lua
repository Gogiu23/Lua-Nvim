local map = vim.keymap.set
local N = "n"

local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	--Lspsaga
	map(N, "<leader>l", "<cmd>Lspsaga<CR>", opts, { desc = "Lspasaga" })
	map(N, "<leader>lf", "<cmd>Lspsaga finder<CR>", opts, { desc = "Lspsaga finder" }) -- go to definition
	map(N, "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", opts, { desc = "Lspsaga peek definition" }) -- peak definition
	-- map(N, "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
	map(N, "<leader>lc", "<cmd>Lspsaga code_action<CR>", opts, { desc = "code actions" })
	map(N, "<leader>lr", "<cmd>Lspsaga rename<CR>", opts, { desc = "rename" }) -- smart rename
	map(N, "gD", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	map(N, "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts, { desc = "Prev diagnostic" })
	map(N, "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts, { desc = "Next diagnostic" })
	map(N, "K", "<cmd>Lspsaga hover_doc<CR>", opts, { buffer = 0 })
	map(N, "<leader>la", "<cmd>Lspsaga outline<CR>", opts, { desc = "Lspsaga outline" })
	-- map({ N, V }, "K", vim.lsp.buf.hover, opts, { buffer = 0 })

	--GlanceLua
	map(N, "<leader>g", "<cmd>Glance", opts, { desc = "Glance" })
	map(N, "<leader>gD", "<CMD>Glance definitions<CR>", opts, { desc = "Glance definitions" })
	map(N, "<leader>gR", "<CMD>Glance references<CR>", opts, { desc = "Glance references" })
	map(N, "<leader>gY", "<CMD>Glance type_definitions<CR>", opts, { desc = "Glance type_definitions" })
	map(N, "<leader>gM", "<CMD>Glance implementations<CR>", opts, { desc = "Glance implementations" })
end
return M

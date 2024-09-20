return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	build = ":MasonUpdate",
	keys = {
		{"<leader>m", "<CMD>Mason<CR>"},
	},
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		--Import Mason
		local mason = require("mason")
		-- IMport Mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		mason.setup({
			ui = {
				icons = {
					package_installed = " ",
					package_pending = "󰞌 ",
					package_uninstalled = "󰞇 ",
				},
			},
		})
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
			},
		})
	end,
}

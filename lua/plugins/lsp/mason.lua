return {
	"williamboman/mason.nvim",
	-- cmd = "Mason",
	-- build = ":MasonUpdate",
	-- keys = {
	-- 	{ "<leader>m", "<CMD>Mason<CR>" },
	-- },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		--Import Mason
		local mason = require("mason")
		-- IMport Mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		--import mason tool installer
		local mason_tools = require("mason-tool-installer")

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
		mason_tools.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"eslint_d",
				"ktfmt",
				"ktlint",
				"clang-format",
			},
			run_on_start = true,
		})
	end,
}

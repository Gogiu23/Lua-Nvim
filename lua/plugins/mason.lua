return {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {
						"efm",
						"lua-ls",
					},
					automatic_installation = true,
				},
				config = function()
					require("mason-lspconfig").setup({})
				end,
			},
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
}

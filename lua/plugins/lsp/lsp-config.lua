return {
	{
		"neovim/nvim-lspconfig",
		event = "InsertEnter",
		dependencies = {
			"williamboman/mason.nvim",
			"creativenull/efmls-configs-nvim",
		},
		config = function()
			require("neoconf").setup({})
			local on_attach = require("util.lsp").on_attach
			local langs = require("util.langs").langs
			local lspconf = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()
			local signs = { Error = " ", Warn = " ", Hint = "󱧤", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			--lua
			lspconf.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								vim.fn.expand("$VIMRUNTIME/lua"),
								vim.fn.stdpath("config") .. "/lua" .. "/nvim/lua",
							},
						},
					},
				},
			})

			lspconf.jsonls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconf.emmet_language_server.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			--Typescript and javascript lsp
			lspconf.ts_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconf.cssls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			--html lsp
			lspconf.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					html = {
						format = {
							indentHandlebars = false,
							indentInnerHtml = true,
						},
					},
				},
			})

			lspconf.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconf.kotlin_language_server.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					kotlin_language_server = {},
				},
			})

			lspconf.efm.setup({
				filetypes = vim.tbl_keys(langs),
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
					hover = true,
					documentSymbol = true,
					codeAction = true,
					completion = true,
				},
				settings = {
					languages = langs,
				},
			})
		end,
	},
}

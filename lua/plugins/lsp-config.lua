return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewfile" },
		dependencies = {
			"williamboman/mason.nvim",
			"creativenull/efmls-configs-nvim",
		},
		config = function()
			require("neoconf").setup({})
			local on_attach = require("util.lsp").on_attach
			local lspconf = require("lspconfig")
			local signs = { Error = " ", Warn = " ", Hint = "󱧤", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			--lua
			lspconf.lua_ls.setup({
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
			local luacheck = require("efmls-configs.linters.luacheck")
			local stylua = require("efmls-configs.formatters.stylua")

			lspconf.efm.setup({
				filetypes = {
					"lua",
				},
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
					hover = true,
					documentSymbol = true,
					codeAction = true,
					completion = true,
				},
				settings = {
					languages = {
						lua = {
							luacheck,
							stylua,
						},
					},
				},
			})
			--Format on save
			local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = lsp_fmt_group,
				callback = function(ev)
					local efm = vim.lsp.get_active_clients({ name = "efm", bufnr = ev.buf })

					if vim.tbl_isempty(efm) then
						return
					end

					vim.lsp.buf.format({ name = "efm" })
				end,
			})
		end,
	},
}

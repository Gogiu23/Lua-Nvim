return {
	"neovim/nvim-lspconfig",
	event = { "BufreadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		--import nvim-lspconfig plugin
		local lspconfig = require("lspconfig")
		-- import mason lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local map = vim.keymap.set
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local N = "n"
		local V = "v"
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				--set keybinds
				opts.desc = "Show LSP references"
				map(N, "gR", "<CMD>Telescope lsp_references<CR>", opts)
				opts.desc = "Go to Declaration"
				map(N, "gD", vim.lsp.buf.declaration, opts)
				opts.desc = "Show LSP definitions"
				map(N, "gd", "<CMD>Telescope lsp_definitions<CR>", opts)
				opts.desc = "LSP implementations"
				map(N, "gI", "<CMD>Telescopeq lsp_implementations<CR>", opts)
				opts.desc = "LSP Type definitions"
				map(N, "gt", "<CMD>Telescope lsp_type_definitions<CR>", opts)
				opts.desc = "Code Action"
				map({ N, V }, "<leader>ca", vim.lsp.buf.code_action, opts)
				opts.desc = "Smart Rename"
				map(N, "gr", vim.lsp.buf.rename, opts)
				opts.desc = "Diagnostics"
				map(N, "<leader>D", "<CMD>Telescope diagnostics bufnr=0<CR>", opts)
				opts.desc = "Diagnostics for line"
				map(N, "<leader>d", vim.diagnostic.open_float, opts)
				opts.desc = "LSP Restart"
				map(N, "<leader>Lr", "<CMD>LspRestart<CR>", opts)
			end,
		})
		local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
		local servers = { "ts_ls", "kotlin_language_server" }
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
			})
		end
		mason_lspconfig.setup_handlers({
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["clangd"] = function()
				lspconfig["clangd"].setup({
					capabilities = capabilities,
					formatting = {
						style = "file",
					},
				})
			end,
			["html"] = function()
				lspconfig["html"].setup({
					capabilities = capabilities,
					filetypes = { "html", "javascript" },
				})
			end,
			-- ["emmet_ls"] = function()
			-- 	lspconfig["emmet_language_server"].setup({
			-- 		capabilities = capabilities,
			-- 		filetypes = { "html", "javascript", "javascriptreact" },
			-- 	})
			-- end,
			["cssls"] = function()
				lspconfig["cssls"].setup({
					capabilities = capabilities,
					filetypes = {
						"css",
						"html",
						"javascript",
						"javascriptreact",
					},
				})
			end,
			["jsonls"] = function()
				lspconfig["jsonls"].setup({
					capabilities = capabilities,
					filetypes = {
						"json",
					},
				})
			end,
		})
	end,
}

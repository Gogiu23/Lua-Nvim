return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		-- neodev.nvim ya no es necesario en 0.11+, vim.lsp.config lo maneja
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local map = vim.keymap.set
		local N = "n"
		local V = "v"

		-- Keymaps (sin cambios)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				opts.desc = "Show LSP references"
				map(N, "gR", "<CMD>Telescope lsp_references<CR>", opts)
				opts.desc = "Go to Declaration"
				map(N, "gD", vim.lsp.buf.declaration, opts)
				opts.desc = "Show LSP definitions"
				map(N, "gd", "<CMD>Telescope lsp_definitions<CR>", opts)
				opts.desc = "LSP implementations"
				map(N, "gI", "<CMD>Telescope lsp_implementations<CR>", opts)
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

		-- Diagnostic signs (nueva API en 0.11+)
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		-- Nueva API: vim.lsp.config en lugar de lspconfig[x].setup()
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})

		vim.lsp.config("clangd", {
			-- formatting.style no es una opción LSP estándar,
			-- clangd lo lee del .clang-format del proyecto
		})

		vim.lsp.config("html", {
			filetypes = { "html", "javascript" },
		})

		vim.lsp.config("emmet_language_server", {
			filetypes = { "html", "javascript", "javascriptreact" },
		})

		vim.lsp.config("cssls", {
			filetypes = { "css", "html", "javascript", "javascriptreact" },
		})

		vim.lsp.config("jsonls", {
			filetypes = { "json" },
		})

		-- Servidores simples sin config extra
		local servers = { "ts_ls", "kotlin_language_server" }
		for _, lsp in ipairs(servers) do
			vim.lsp.enable(lsp)
		end

		-- mason-lspconfig activa automáticamente los servidores instalados
		-- ya no necesitas setup_handlers para esto
		require("mason-lspconfig").setup({
			handlers = {
				function(server)
					vim.lsp.enable(server)
				end,
			},
		})
	end,
}

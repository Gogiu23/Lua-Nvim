return {
	"stevearc/conform.nvim",
	event = { "BufreadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				kotlin = { "ktfmt" },
			},
			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 500,
			},
		})
	end,
}

return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none", -- ✅ necesario cuando defines todo manual
				["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<C-y>"] = { "select_and_accept" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-j>"] = { "snippet_forward", "fallback" },
				["<C-k>"] = { "snippet_backward", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},
			completion = {
				list = {
					selection = {
						preselect = false, -- ✅ preselecciona el primer item
						auto_insert = false, -- ✅ no inserta hasta que aceptes
					},
				},
				accept = {
					auto_brackets = {
						enabled = false,
					},
				},
				menu = {
					border = "rounded",
					draw = {
						components = {
							kind_icon = {
								text = function(ctx)
									if ctx.source_name ~= "Path" then
										return require("lspkind").symbol_map[ctx.kind] or ("" .. ctx.icon_gap)
									end

									local is_unknown_type = vim.tbl_contains(
										{ "link", "socket", "fifo", "char", "block", "unknown" },
										ctx.item.data.type
									)
									local mini_icon, _ = require("mini.icons").get(
										is_unknown_type and "os" or ctx.item.data.type,
										is_unknown_type and "" or ctx.label
									)

									return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
								end,

								highlight = function(ctx)
									if ctx.source_name ~= "Path" then
										return ctx.kind_hl
									end

									local is_unknown_type = vim.tbl_contains(
										{ "link", "socket", "fifo", "char", "block", "unknown" },
										ctx.item.data.type
									)
									local mini_icon, mini_hl = require("mini.icons").get(
										is_unknown_type and "os" or ctx.item.data.type,
										is_unknown_type and "" or ctx.label
									)
									return mini_icon ~= nil and mini_hl or ctx.kind_hl
								end,
							},
						},
					},
				},
				documentation = {
					window = { border = "rounded" },
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},
			sources = {
				-- add lazydev to your completion providers
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
}

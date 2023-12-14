return {
	{
		"echasnovski/mini.nvim",
		event = { "BufReadPre", "BufNewFile" },
		version = "*",
		dependencies = {
			{
				"echasnovski/mini.surround",
				version = "*",
				config = function()
					require("mini.surround").setup()
				end,
			},
			{
				"echasnovski/mini.pairs",
				version = "*",
				config = function()
					require("mini.pairs").setup()
				end,
			},
			{
				"echasnovski/mini.move",
				version = "*",
				config = function()
					require("mini.move").setup()
				end,
			},
			{
				"echasnovski/mini.animate",
				opts = function()
					-- don't use animate when scrolling with the mouse
					local mouse_scrolled = true
					for _, scroll in ipairs({ "Up", "Down" }) do
						local key = "<ScrollWheel" .. scroll .. ">"
						vim.keymap.set({ "", "i" }, key, function()
							mouse_scrolled = true
							return key
						end, { expr = true })
					end
					local animate = require("mini.animate")
					return {
						resize = {
							timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
						},
						scroll = {
							timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
							subscroll = animate.gen_subscroll.equal({
								predicate = function(total_scroll)
									if mouse_scrolled then
										mouse_scrolled = false
										return false
									end
									return total_scroll > 1
								end,
							}),
						},
					}
				end,
			},
			{
				"echasnovski/mini.indentscope",
				event = { "BufReadPre", "BufNewFile" },
				version = "*", -- wait till new 0.7.0 release to put it back on semver
				opts = {
					symbol = "│",
					options = { try_as_border = true },
				},
				init = function()
					vim.api.nvim_create_autocmd("FileType", {
						pattern = {
							"help",
							"alpha",
							"dashboard",
							"neo-tree",
							"Trouble",
							"trouble",
							"lazy",
							"mason",
							"notify",
							"toggleterm",
							"lazyterm",
						},
						callback = function()
							vim.b.miniindentscope_disable = true
						end,
					})
				end,
			},
		},
	},
}

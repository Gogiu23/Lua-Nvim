return {
	--Oil nvim
	{
		"stevearc/oil.nvim",
		lazy = false,
		keys = {
			{
				"-",
				function()
					require("oil").open_float(nil, { preview = { vertical = true } }, nil)
				end,
				desc = "Toggle Oil Explorer",
			},
		},
		event = function()
			if vim.fn.argc() == 1 then
				return "ColorScheme"
			else
				return { "BufReadPre", "BufNewFile" }
			end
		end,
		opts = {},
		config = function()
			local detail = false

			require("oil").setup({
				delete_to_trash = true,
				keymaps = {
					["gd"] = {
						desc = "Toggle file detail view",
						callback = function()
							detail = not detail
							if detail then
								require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
							else
								require("oil").set_columns({ "icon" })
							end
						end,
					},
					["g?"] = { "actions.show_help", mode = "n" },
					["<C-s>"] = false,
					["<C-p>"] = "actions.preview",
					["<C-v>"] = "actions.select_vsplit",
					["<C-x>"] = "actions.select_split",
					["C-c"] = { "actions.close", mode = "n" },
					["g."] = { "actions.toggle_hidden", mode = "n" },
				},
				use_default_keymaps = true,
				float = {
					padding = 4,
					border = "rounded",
					win_options = {
						winblend = 7,
						winhighlight = "Normal:Normal,NormalFloat:NormalFloat",
					},
				},
			})
		end,
	},
}

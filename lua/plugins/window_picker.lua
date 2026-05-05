return {
	"s1n7ax/nvim-window-picker",
	version = "2.*",
	config = function()
		vim.keymap.set("n", "<leader>w", function()
			local picked = require("window-picker").pick_window()
			if picked then
				vim.api.nvim_set_current_win(picked)
			end
		end, { desc = "Pick window" })
		require("window-picker").setup({
			hint = "floating-big-letter", -- asegura que aparecen las letras flotantes
			selection_chars = "FJDKSLA;CMRUEIWOQP",
			filter_rules = {
				include_current_win = false,
				autoselect_one = false,
				bo = {
					filetype = { "NvimTree", "neo-tree", "notify", "snacks_notif" },
					buftype = { "terminal" },
				},
			},
			highlights = {
				enabled = true,
				statusline = {
					focused = {
						fg = "#ededed",
						bg = "#e35e4f",
						bold = true,
					},
					unfocused = {
						fg = "#ededed",
						bg = "#44cc41",
						bold = true,
					},
				},
				winbar = {
					focused = {
						fg = "#ededed",
						bg = "#e35e4f",
						bold = true,
					},
					unfocused = {
						fg = "#ededed",
						bg = "#44cc41",
						bold = true,
					},
				},
			},
		})
	end,
}

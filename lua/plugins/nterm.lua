return {
	"Gogiu23/Nterm",
	-- lazy.nvim calls require("nterm").setup(opts) once the plugin is loaded
	opts = {
		position = "float", -- 'float', 'bottom', 'left' or 'right'
		size = 0.3, -- docked positions: fraction of the editor
		theme = "nterm", -- 'auto': colors from your colorscheme, 'nterm': built-in palette
		opacity = 1, -- floating windows, 0..1 (uses 'winblend')
		transparent = false, -- no background: your terminal emulator's transparency shows
	},
}

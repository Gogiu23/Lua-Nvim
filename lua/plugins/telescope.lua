return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup()

		telescope.load_extension("fzf");
		local keymap = vim.keymap
		keymap.set("n", "<C-f>", "<cmd>Telescope find_files<cr>", {})
		keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<cr>", {})
--		keymap.set("n", "<leader>fb", builtin.buffers, {})
--		keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end
}

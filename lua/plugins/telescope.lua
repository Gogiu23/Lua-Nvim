return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	cmd = "Telescope",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		-- ✅ Shim compatibilidad Neovim 0.12
		-- if not vim.treesitter.language.ft_to_lang then
		-- 	vim.treesitter.language.ft_to_lang = function(ft)
		-- 		return vim.treesitter.language.get_lang(ft) or ft
		-- 	end
		-- end

		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- Layout
				sorting_strategy = "ascending",
				layout_strategy = "flex",
				layout_config = {
					prompt_position = "top",
					horizontal = { preview_width = 0.55 },
					vertical = { mirror = false },
				},
				-- -- Apariencia
				border = true,
				-- -- Comportamiento
				initial_mode = "normal",
				file_ignore_patterns = { "node_modules", ".git/", ".DS_Store" },
				color_devicons = true,
				path_display = { "truncate" }, -- más limpio que tail
				-- -- Mappings en modo normal
				mappings = {
					n = {
						["q"] = actions.close,
						["<Esc>"] = actions.close,
						["<Up>"] = actions.cycle_history_prev,
						["<Down>"] = actions.cycle_history_next,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
					},
					i = {
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
					},
				},
			},
			pickers = {
				colorscheme = { enable_preview = true },
				live_grep = {
					additional_args = { "--hidden" },
				},
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		})

		-- Highlights
		local TelescopePrompt = {
			TelescopePromptTitle = { bg = "#40E0D0" },
			TelescopePromptNormal = { bg = "#212F3D" },
			TelescopePromptBorder = { fg = "#212F3D", bg = "#212F3D" },
			TelescopePromptCounter = { bg = "#212F3D" },
			TelescopePromptPrefix = { bg = "#212F3D" },
		}
		for hl, col in pairs(TelescopePrompt) do
			vim.api.nvim_set_hl(0, hl, col)
		end

		-- Extensions
		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")

		-- Keymaps
		local keymap = vim.keymap.set
		local builtin = require("telescope.builtin")
		local N = "n"

		-- Archivos
		keymap(N, "<leader>ff", builtin.find_files, { desc = "Find files" })
		keymap(N, "<leader>fc", "<CMD>Telescope file_browser path=%:p:h<CR>", { desc = "File browser" })
		keymap(N, "<leader>fz", builtin.live_grep, { desc = "Live grep" })
		keymap(N, "<leader>fs", builtin.grep_string, { desc = "Grep string under cursor" })
		keymap(N, "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
		keymap(N, "<leader>fm", builtin.man_pages, { desc = "Man pages" })
		keymap(N, "<leader>ft", "<CMD>Telescope colorscheme<CR>", { desc = "Themes" })
		keymap(N, "<leader>D", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
		-- Buffers
		keymap(N, "<leader>bb", builtin.buffers, { desc = "Buffers" })
		keymap(N, "<leader>bf", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find in buffer" })
		-- Help
		keymap(N, "<leader>ht", builtin.help_tags, { desc = "Help tags" })
		keymap(N, "<leader>hi", builtin.command_history, { desc = "Command history" })
		keymap(N, "<leader>hh", builtin.highlights, { desc = "Highlights" })
		keymap(N, "<leader>hk", builtin.keymaps, { desc = "Keymaps" }) -- ✅ nuevo útil
		-- Git
		keymap(N, "<leader>gc", builtin.git_commits, { desc = "Git commits" })
		keymap(N, "<leader>gb", builtin.git_bcommits, { desc = "Git buffer commits" })
		keymap(N, "<leader>gr", builtin.git_branches, { desc = "Git branches" })
		keymap(N, "<leader>gs", builtin.git_status, { desc = "Git status" })
	end,
}

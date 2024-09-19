return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"HUAHUAI23/telescope-session.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope._extensions.file_browser.actions")
		telescope.setup({
			defaults = {
				theme = "center",
				border = true,
				sorting_strategy = "ascending",
				path_display = {
					tail = {},
				},
				layout_strategy = "flex",
				layout_config = {
					prompt_position = "top",
				},
				prompt_prefix = "  ",
				selection_caret = " ",
				initial_mode = "normal",
				file_ignore_patterns = { "node_modules" },
				color_devicons = true,
				mappings = {
					n = {
						["q"] = require("telescope.actions").close,
						["<up>"] = false,
						["<Down"] = false,
						["<Up>"] = actions.cycle_history_prev,
						["<Down>"] = actions.cycle_history_next,
					},
				},
			},
			pickers = {},
			extensions = {
				xray23 = {
					sessionDir = vim.fn.stdpath("data") .. "/vimSession",
				},
				file_browser = {
					theme = "ivy",
					path = vim.loop.cwd(),
					cwd = vim.loop.cwd(),
					cwd_to_path = true,
					grouped = true,
					files = true,
					add_dirs = true,
					depth = 1,
					auto_depth = false,
					select_buffer = false,
					hidden = { file_browser = true, folder_browser = false },
					respect_gitignore = vim.fn.executable("fd") == 1,
					no_ignore = false,
					follow_symlinks = false,
					browse_files = require("telescope._extensions.file_browser.finders").browse_files,
					browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
					hide_parent_dir = false,
					collapse_dirs = false,
					prompt_path = false,
					quiet = false,
					dir_icon = "",
					dir_icon_hl = "Default",
					display_stat = { date = true, size = true, mode = true },
					hijack_netrw = true,
					use_fd = true,
					git_status = true,
					mappings = {
						["n"] = {
							["c"] = fb_actions.create,
							["r"] = fb_actions.rename,
							["m"] = fb_actions.move,
							["y"] = fb_actions.copy,
							["d"] = fb_actions.remove,
							["o"] = fb_actions.open,
							["g"] = fb_actions.goto_parent_dir,
							["e"] = fb_actions.goto_home_dir,
							["w"] = fb_actions.goto_cwd,
							["t"] = fb_actions.change_cwd,
							["f"] = fb_actions.toggle_browser,
							["h"] = fb_actions.toggle_hidden,
							["s"] = fb_actions.toggle_all,
						},
					},
				},
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		--Telescope Prompt
		local TelescopePrompt = {
			TelescopePromptTitle = {
				bg = "#40E0D0",
			},
			TelescopePromptNormal = {
				bg = "#212F3D",
			},
			TelescopePromptBorder = {
				fg = "#212F3D",
				bg = "#212F3D",
			},
			TelescopePromptCounter = {
				bg = "#212F3D",
			},
			TelescopePromptPrefix = {
				bg = "#212F3D",
			},
		}
		for hl, col in pairs(TelescopePrompt) do
			vim.api.nvim_set_hl(0, hl, col)
		end
		telescope.load_extension("file_browser")
		telescope.load_extension("fzf")
		telescope.load_extension("xray23")
		local keymap = vim.keymap.set
		local builtin = require("telescope.builtin")
		local N = "n"
		keymap(N, "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find files" })
		keymap(N, "<leader>fc", "<CMD>Telescope file_browser path=%:p:h<CR>", { desc = "File browser" })
		keymap(N, "<leader>fz", "<cmd>Telescope live_grep<cr>", { desc = "live grep in cwd" })
		keymap(N, "<leader>fs", builtin.grep_string, { desc = "find string under cursor" })
		keymap(N, "<leader>fp", builtin.planets, { desc = "Planets" })
		keymap(N, "<leader>r", builtin.oldfiles, { desc = "oldfiles" })
		keymap(N, "<leader>fm", builtin.man_pages, { desc = "man pages" })
		--Buffers Telescope
		keymap(N, "<leader>bb", builtin.buffers, { desc = "Buffers" })
		keymap(N, "<leader>bf", builtin.current_buffer_fuzzy_find, { desc = "fz in the current buffer" })
		keymap(N, "<leader>bt", builtin.current_buffer_tags, { desc = "fz tags in current buffer" })
		--Help Telescope
		keymap(N, "<leader>ht", builtin.help_tags, { desc = "tags_helps" })
		keymap(N, "<leader>hi", builtin.command_history, { desc = "command history" })
		keymap(N, "<leader>hh", builtin.highlights, { desc = "Highlights" })
		--Git Telescope
		keymap(N, "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
		keymap(N, "<leader>gb", builtin.git_bcommits, { desc = "Git Buffers" })
		keymap(N, "<leader>gr", builtin.git_branches, { desc = "Git branches" })
		keymap(N, "<leader>gs", builtin.git_status, { desc = "Git Status" })
	end,
}

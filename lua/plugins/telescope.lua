return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	-- keys = {
	-- 	{ "<leader>f", desc = "Telescope" },
	-- },
	-- cmd = "Telescope",
	-- module = "Telescope",
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
		local extension = require("telescope")
		local N = "n"
		keymap(N, "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find files" })
		keymap(N, "<leader>fc", extension.extensions.file_browser.file_browser, { desc = "File browser" })
		keymap(N, "<leader>fz", "<cmd>Telescope live_grep<cr>", { desc = "live grep in cwd" })
		keymap(N, "<leader>fs", builtin.grep_string, { desc = "find string under cursor" })
		keymap(N, "<leader>fbb", builtin.buffers, { desc = "Buffers" })
		keymap(N, "<leader>fht", builtin.help_tags, { desc = "tags_helps" })
		keymap(N, "<leader>fp", builtin.planets, { desc = "Planets" })
		keymap(N, "<leader>fhi", builtin.command_history, { desc = "command history" })
		keymap(N, "<leader>fo", builtin.oldfiles, { desc = "oldfiles" })
		keymap(N, "<leader>ft", builtin.tags, { desc = "search tags(ctags -R)" })
		keymap(N, "<leader>fm", builtin.man_pages, { desc = "man pages" })
		keymap(N, "<leader>fbf", builtin.current_buffer_fuzzy_find, { desc = "fz in the current buffer" })
		keymap(N, "<leader>fbt", builtin.current_buffer_tags, { desc = "fz tags in current buffer" })
		keymap(N, "<leader>fgc", builtin.git_commits, { desc = "list all commits with diff preview" })
		keymap(N, "<leader>fgb", builtin.git_bcommits, { desc = "list all buffers commits" })
		keymap(N, "<leader>fgr", builtin.git_branches, { desc = "list all branches" })
		keymap(N, "<leader>fgs", builtin.git_status, { desc = "list git status" })
		keymap(N, "<leader>fhh", builtin.highlights, { desc = "Highlights" })
	end,
}

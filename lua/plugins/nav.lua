return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>e",
				function()
					require("nvim-tree.api").tree.toggle({
						path = "cwd",
						find_file = true,
						update_root = true,
						focus = true,
					})
				end,
				desc = "Toggle Tree(cwd)",
			},
			{
				"<leader>E",
				function()
					require("nvim-tree.api").tree.toggle({
						path = "/",
					})
				end,
				desc = "Toggle Tree (Root Dir)",
			},
		},
		dependencies = {
			{
				"b0o/nvim-tree-preview.lua",
			},
		},
		config = function()
			local preview = require("nvim-tree-preview")
			local function my_on_attach(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end
				api.config.mappings.default_on_attach(bufnr)
				vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
				vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
				-- Option B: Smart tab behavior: Only preview files, expand/collapse directories.
				vim.keymap.set("n", "<Tab>", function()
					local ok, node = pcall(api.tree.get_node_under_cursor)
					if ok and node then
						if node.type == "directory" then
							api.node.open.edit()
						else
							preview.watch()
							-- preview.node(node, { toggle_focus = false })
						end
					end
				end, opts("Preview"))
			end
			-- Default config:
			-- preview.setup({
			-- 	keymaps = {
			-- 		["<Esc>"] = { action = "close", unwatch = true },
			-- 		["<Tab>"] = { action = "toggle_focus" },
			-- 		["<CR>"] = { open = "edit" },
			-- 		["<C-t>"] = { open = "tab" },
			-- 		["<C-v>"] = { open = "vertical" },
			-- 		["<C-x>"] = { open = "horizontal" },
			-- 	},
			-- 	min_width = 10,
			-- 	min_height = 5,
			-- 	max_width = 85,
			-- 	max_height = 25,
			-- 	wrap = false, -- Whether to wrap lines in the preview window
			-- 	border = "rounded", -- Border style for the preview window
			-- })
			require("nvim-tree").setup({
				on_attach = my_on_attach,
				hijack_cursor = true,
				auto_reload_on_write = true,
				disable_netrw = false,
				hijack_netrw = false,
				hijack_unnamed_buffer_when_opening = true,
				root_dirs = {},
				prefer_startup_root = false,
				sync_root_with_cwd = true,
				reload_on_bufenter = false,
				respect_buf_cwd = false,
				select_prompts = false,
				sort = {
					sorter = "name",
					folders_first = true,
					files_first = false,
				},
				view = {
					centralize_selection = true,
					cursorline = true,
					debounce_delay = 15,
					side = "left",
					preserve_window_proportions = true,
					number = true,
					relativenumber = true,
					signcolumn = "yes",
					width = 40,
					float = {
						enable = true,
						quit_on_focus_loss = true,
						open_win_config = {
							relative = "editor",
							border = "rounded",
							width = 40,
							height = 30,
							row = 1,
							col = 2,
						},
					},
				},
				renderer = {
					add_trailing = true,
					group_empty = false,
					full_name = false,
					root_folder_label = ":~:s?$?/..?",
					indent_width = 2,
					special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
					symlink_destination = true,
					highlight_git = true,
					highlight_diagnostics = false,
					highlight_opened_files = "none",
					highlight_modified = "none",
					indent_markers = {
						enable = true,
						inline_arrows = true,
						icons = {
							corner = "└",
							edge = "│",
							item = "│",
							bottom = "─",
							none = " ",
						},
					},
					icons = {
						web_devicons = {
							file = {
								enable = true,
								color = true,
							},
							folder = {
								enable = true,
								color = true,
							},
						},
						git_placement = "before",
						diagnostics_placement = "signcolumn",
						modified_placement = "after",
						padding = " ",
						symlink_arrow = " ➛ ",
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
							diagnostics = true,
							modified = true,
						},
						glyphs = {
							default = "",
							symlink = "",
							bookmark = "󰆤",
							modified = "●",
							folder = {
								arrow_closed = "",
								arrow_open = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
						},
					},
				},
				hijack_directories = {
					enable = true,
					auto_open = true,
				},
				update_focused_file = {
					enable = false,
					update_root = false,
				},
				system_open = {
					cmd = "",
					args = {},
				},
				git = {
					enable = true,
					show_on_dirs = true,
					show_on_open_dirs = true,
					disable_for_dirs = {},
					timeout = 400,
				},
				diagnostics = {
					enable = false,
					show_on_dirs = true,
					show_on_open_dirs = true,
					debounce_delay = 50,
					severity = {
						min = vim.diagnostic.severity.HINT,
						max = vim.diagnostic.severity.ERROR,
					},
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				modified = {
					enable = false,
					show_on_dirs = true,
					show_on_open_dirs = true,
				},
				filters = {
					git_ignored = true,
					dotfiles = false,
					git_clean = false,
					no_buffer = false,
					custom = {},
					exclude = {},
				},
				live_filter = {
					prefix = "[FILTER]: ",
					always_show_folders = true,
				},
				filesystem_watchers = {
					enable = true,
					debounce_delay = 50,
					ignore_dirs = {},
				},
				actions = {
					use_system_clipboard = true,
					change_dir = {
						enable = true,
						global = true,
						restrict_above_cwd = false,
					},
					expand_all = {
						max_folder_discovery = 300,
						exclude = {},
					},
					file_popup = {
						open_win_config = {
							col = 1,
							row = 1,
							relative = "cursor",
							border = "shadow",
							style = "minimal",
						},
					},
					open_file = {
						quit_on_open = true,
						eject = true,
						resize_window = true,
						window_picker = {
							enable = true,
							picker = "default",
							chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
							exclude = {
								filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
								buftype = { "nofile", "terminal", "help" },
							},
						},
					},
					remove_file = {
						close_window = true,
					},
				},
				trash = {
					cmd = "gio trash",
				},
				tab = {
					sync = {
						open = false,
						close = false,
						ignore = {},
					},
				},
				notify = {
					threshold = vim.log.levels.INFO,
					absolute_path = false,
				},
				ui = {
					confirm = {
						remove = true,
						trash = true,
					},
				},
				experimental = {},
				log = {
					enable = false,
					truncate = false,
					types = {
						all = false,
						config = false,
						copy_paste = false,
						dev = false,
						diagnostics = false,
						git = false,
						profile = false,
						watcher = false,
					},
				},
			}) -- END_DEFAULT_OPTS
		end,
	},
	{
		"stevearc/aerial.nvim",
		lazy = true,
		keys = {
			{ "<leader>aa", "<cmd>AerialToggle right<CR>", desc = "Aerial toggle" },
		},
		config = function()
			require("aerial").setup({})
		end,
	},
	--Oil nvim
	{
		"stevearc/oil.nvim",
		keys = {
			{ "-", "<CMD>Oil<CR>", desc = "Oil Explorer" },
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
			require("oil").setup({
				keymaps = {
					["<C-s>"] = false,
					["<C-v>"] = "actions.select_vsplit",
					["<C-x>"] = "actions.select_split",
				},
			})
		end,
	},
}

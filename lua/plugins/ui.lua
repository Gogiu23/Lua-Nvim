return {
	{
		'akinsho/bufferline.nvim',
		event = {"BufReadPre", "BufNewFile"},
		version = "*",
		config = function ()
			local map = vim.keymap.set
			local N = "n"
			local opts = {noremap = "true"}

			map(N, "<C-.>", "<cmd>BufferLineCycleNext<CR>", opts)
			map(N, "<C-,>", "<cmd>BufferLineCyclePrev<CR>", opts)
			map(N, "<C-c>", "<cmd>bdelete<CR>", opts)
			require("bufferline").setup({
				options = {
					themable = false,
					buffer_close_icon = "󰅙 ",
					close_command = "bdelete %d",
					close_icon = "󰅗",
					indicator = {
						icon = "󱋱 ",
						style = "underline",
					},
					left_trunc_marker = "",
					modified_icon = "󰽂",
					max_name_length = 18,
					max_prefix_length = 15,
					truncate_names = true,
					tab_size = 18,
					diagnostics = "",
					diagnostics_update_in_insert = false,
					offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
					right_mouse_command = "bdelete! %d",
					right_trunc_marker = "",
					show_close_icon = true,
					show_tab_indicators = true,
					color_icons = true,
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					always_show_bufferline = true,
					sort_by = 'insert_after_current',
					separator_style = {
						"󱋱",
						-- "slope",
						-- "thick",
						-- "thin",
						-- { 'any', 'any' }
					},
					hover = {
						enabled = true,
						delay = 100,
						reveal = {'close'}
					},
				},
				highlights = {
					fill = {
						fg = "white",
						bg = "#17202A",
						-- bg = "#1f7aca",
					},
					tab = {
						fg = "white",
					},
					tab_selected = {
						fg = 'white',
						bg = '#1E8449',
					},
					tab_close = {
						fg = 'white',
						bg = '#C0392B',
					},
					background = {
						fg = "white",
						bg = "#17202A",
					},
					buffer_visible = {
						fg = "white",
						bg = "#FD6C63",
					},
					buffer_selected = {
						fg = "white",
						bg = "#FD6C63",
					},
					separator = {
						fg = "white",
						bg = "#17202A",
					},
					separator_selected = {
						fg = "white",
						bg = "#FD6C63",
					},
					separator_visible = {
						fg = "white",
						bg = "#FD6C63",
					},
					close_button = {
						fg = "white",
						bg = "#17202A",
					},
					close_button_selected = {
						fg = "#F4D03F",
						bg = "#FD6C63",
					},
					close_button_visible = {
						fg = { attribute = "fg", highlight = "Normal" },
						bg = { attribute = "bg", highlight = "Normal" },
					},
					modified = {
						fg = "white",
						bg = "#FD6C63",
					},
					modified_visible = {
						fg = "white",
						bg = "#FD6C63",
					},
					modified_selected = {
						fg = "white",
						bg = "#FD6C63",
					},
				},
			})
		end
	},

	--lualine
	{
		'nvim-lualine/lualine.nvim',
		event = {"BufreadPre", "BufNewFile"},
		config = function()
			local map = vim.keymap.set

			local custom_fname = require('lualine.components.filename'):extend()
			local highlight = require'lualine.highlight'
			local default_status_colors = { saved = '#8FFC7B', modified = '#FD6C63' }

			function custom_fname:init(options)
				custom_fname.super.init(self, options)
				self.status_colors = {
					saved = highlight.create_component_highlight_group(
					{fg = default_status_colors.saved}, 'filename_status_saved', self.options),
					modified = highlight.create_component_highlight_group(
					{fg = default_status_colors.modified}, 'filename_status_modified', self.options),
				}
				if self.options.color == nil then self.options.color = '' end
			end

			function custom_fname:update_status()
				local data = custom_fname.super.update_status(self)
				data = highlight.component_format_highlight(vim.bo.modified
				and self.status_colors.modified
				or self.status_colors.saved) .. data
				return data
			end
			local function keymap()
				if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
					return '⌨ ' .. vim.b.keymap_name
				end
				return ''
			end

			require('lualine').setup({
				options = {
					globalstatus = true,
					component_separators = '',
					section_separators = '',
					icons_enabled = true,
					theme = 'auto',
					disabled_filetypes = {
						statusline = {"dashboard"},
					},
				},
				sections = {
					lualine_a = {
						{
							'mode',
							icon = {'  '},
						},
					},
					lualine_b = {
						{
							'branch',
							icon = {'  ', color={fg='white'}},
						},
						{
							'diagnostics',
							sources = {'coc'},
							sections = {'error', 'warn',},
							update_in_insert = false,
							always_visible = false,
						},
					},
					lualine_c = {
						{
							custom_fname,
							path = 4,
							icon = {' '},
							symbols = {
								modified = ' 󰷥 ',
								readonly = '󰷤 ',
								newfile = '󰎔 '
							}
						},
					},
					lualine_x = {'filetype'},
					lualine_y = {'progress'},
					lualine_z = {
						{
							'location',
							icon = ''
						},
						'searchcount',
						"os.date(' %H:%M')",
						"os.date(' %a %m %b  ')"
					}
				},
				extensions = {'nvim-tree', 'lazy'}
			})
			local lualine = {
				lualine_b_normal = {
					fg = white,
					bg = "#FF6262",
					bold = true
				},
			}
			for hl, col in pairs(lualine) do
				vim.api.nvim_set_hl(0, hl, col)
			end
		end,
	},

	{
		"echasnovski/mini.indentscope",
		event = {"BufReadPre", "BufNewFile"},
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
	{
		"echasnovski/mini.animate",
		event = {"BufReadPre", "BufNewFile"},
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
}
-- 					-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)

return {
	--lualine
	{
		'nvim-lualine/lualine.nvim',
		event = {"BufreadPre", "BufNewFile"},
		config = function()
			local option = vim.opt
			local map = vim.keymap.set
			local N = "n"
			local opt = {noremap = false, silent = true}

			option.showtabline = 2
			map(N, "<C-.>", "<cmd>bnext<CR>", opt)
			map(N, "<C-,>", "<cmd>bprev<CR>", opt)
			map(N, "<C-c>", "<cmd>bdelete<CR>", opt)
			local map = vim.keymap.set

			local custom_fname = require('lualine.components.filename'):extend()
			local highlight = require'lualine.highlight'
			local default_status_colors = { saved = '#239B56', modified = '#922B21' }

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
					icons_enabled = true,
					theme = 'OceanicNext',
					section_separators = { left = '', right = '' },
					-- component_separators = { left = '', right = '' },
					-- component_separators = { left = '', right = ''},
					component_separators = { left = '|', right = '󱋱'},
					-- section_separators = { left = '', right = ''},
					disabled_filetypes = {
						statusline = {"dashboard"},
						tabline = {"dasboard"},
					},
					refresh = {
						statusline = 1000,
						tabline = 1000,
					},
				},
				sections = {
					lualine_a = {
						{
							'mode',
							icons_enabled = true,
							icon = "  "
						},
					},
					lualine_b = {
						{
							'branch',
							icon = {
								' ',
								color = {
									fg = 'white',
								},
							},
						},
						'diff',
						'diagnostics'
					},
					lualine_c = {
						{
							custom_fname,
							path = 4,
							symbols = {
								modified = '󰽂 ',
								readonly = '󱙃 ',
							},
						},
					},
					lualine_x = {
						{
							'fileformat',
							symbols = {
								unix = '',
							},
						},
						{
							'filetype',
							icon_only = true,
						},
					},
					lualine_y = {
						{
							'progress',
							icon = "",
						},
					},
					lualine_z = {
						{
							'location',
							icon = {"", color = {bold = true}},
						},
					},
				},
				tabline = {
					lualine_a = {
						{
							'filetype',
							icon_only = true,
							icon = {align = 'right'},
						},
						{
											'buffers',
							mode = 0,
							use_mode_colors = true,
							symbols = {
								modified = ' 󰽂 ',
								alternate_file = '#',
								directory =  ' ',
							},
						},
					},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {
						'searchcount',
						"os.date('󱑇 %H:%M')",
						"os.date(' %a%m%b')",
					},
				},
			})
		end,
	},
}

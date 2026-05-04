return {
	{
		"romgrk/barbar.nvim",
		event = { "BufreadPre", "BufNewFile" },
		dependencies = {
			"lewis6991/gitsigns.nvim",
		},
		init = function()
			vim.g.barbar_auto_setup = true
			local barbar = require("barbar")
			return {
				barbar.setup({
					insert_at_end = true,
				}),
			}
		end,
		opts = {},
		version = "^1.0.0",
	},
	--lualine
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufreadPre", "BufNewFile" },
		config = function()
			local function macro_recording()
				local reg = vim.fn.reg_recording()
				if reg == "" then
					return ""
				end
				return " @" .. reg .. " recording"
			end
			local option = vim.opt
			option.showtabline = 2

			local custom_fname = require("lualine.components.filename"):extend()
			local highlight = require("lualine.highlight")
			local default_status_colors = { saved = "#56B6C6", modified = "tomato" }

			function custom_fname:init(options)
				custom_fname.super.init(self, options)
				self.status_colors = {
					saved = highlight.create_component_highlight_group(
						{ bg = default_status_colors.saved },
						"filename_status_saved",
						self.options
					),
					modified = highlight.create_component_highlight_group(
						{ bg = default_status_colors.modified },
						"filename_status_modified",
						self.options
					),
				}
				if self.options.color == nil then
					self.options.color = ""
				end
			end

			function custom_fname:update_status()
				local data = custom_fname.super.update_status(self)
				data = highlight.component_format_highlight(
					vim.bo.modified and self.status_colors.modified or self.status_colors.saved
				) .. data
				return data
			end

			require("lualine").setup({
				options = {
					globalstatus = true,
					icons_enabled = true,
					theme = "OceanicNext",
					section_separators = { left = "", right = "" },
					-- component_separators = { left = "", right = "" },
					-- component_separators = { left = '', right = ''},
					-- component_separators = { left = "|", right = "󱋱" },
					-- section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = { "dashboard" },
						-- tabline = { "dasboard" },
					},
					refresh = {
						statusline = 1000,
						-- tabline = 1000,
					},
				},
				sections = {
					lualine_a = {
						{
							"mode",
							icons_enabled = true,
							icon = "  ",
						},
					},
					lualine_b = {
						{
							"branch",
							icon = {
								" ",
								color = {
									fg = "white",
								},
							},
						},
						"diff",
						"diagnostics",
					},
					lualine_c = {
						{
							custom_fname,
							path = 4,
							symbols = {
								modified = "󰽂 ",
								readonly = "󱙃 ",
							},
						},
					},
					lualine_x = {
						{
							"fileformat",
							symbols = {
								unix = "",
							},
						},
						{
							"filetype",
							icon_only = true,
						},
					},
					lualine_y = {
						{
							macro_recording,
							color = { fg = "#ff9e64", gui = "bold" },
						},
						{
							"progress",
							icon = "",
						},
					},
					lualine_z = {
						{
							"location",
							icon = { "", color = { bold = true } },
						},
						{
							"searchcount",
						},
						{
							"os.date('󱑇 %H:%M')",
						},
						{
							"os.date(' %a%d%b')",
						},
					},
				},
			})
		end,
	},
}

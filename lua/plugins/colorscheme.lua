return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- Default options:
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = true, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						wave = {},
						lotus = {},
						dragon = {},
						all = {
							ui = { bg_gutter = "none" },
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					}
				end,
				theme = "wave", -- Load "wave" theme
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})
			-- setup must be called before loading
			vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			local transparent = true -- set to true if you would like to enable transparency

			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				transparent = transparent,
				styles = {
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
				},
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = transparent and colors.none or bg_dark
					colors.bg_float = transparent and colors.none or bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = transparent and colors.none or bg_dark
					colors.bg_statusline = transparent and colors.none or bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})

			-- vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = true,
				default_integrations = true,
				integrations = {
					treesitter = true,
					notify = true,
					mason = true,
					noice = true,
					which_key = true,
				},
			})
			-- vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
				---Default is "medium".
				background = "soft",
				---How much of the background should be transparent. 2 will have more UI
				---components be transparent (e.g. status line background)
				transparent_background_level = 2,
				---Whether italics should be used for keywords and more.
				italics = true,
				---Disable italic fonts for comments. Comments are in italics by default, set
				---this to `true` to make them _not_ italic!
				disable_italic_comments = true,
				---By default, the colour of the sign column background is the same as the as normal text
				---background, but you can use a grey background by setting this to `"grey"`.
				sign_column_background = "grey",
				---The contrast of line numbers, indent lines, etc. Options are `"high"` or
				---`"low"` (default).
				ui_contrast = "high",
				---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
				---
				---When this option is used in conjunction with show_eob set to `false`, the
				---end of the buffer will only be hidden inside the active window. Inside
				---inactive windows, the end of buffer filler characters will be visible in
				---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
				dim_inactive_windows = false,
				---Some plugins support highlighting error/warning/info/hint texts, by
				---default these texts are only underlined, but you can use this option to
				---also highlight the background of them.
				diagnostic_text_highlight = false,
				---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
				diagnostic_virtual_text = "coloured",
				---Some plugins support highlighting error/warning/info/hint lines, but this
				---feature is disabled by default in this colour scheme.
				diagnostic_line_highlight = false,
				---By default, this color scheme won't colour the foreground of |spell|, instead
				---colored under curls will be used. If you also want to colour the foreground,
				---set this option to `true`.
				spell_foreground = false,
				---Whether to show the EndOfBuffer highlight.
				show_eob = true,
				---Style used to make floating windows stand out from other windows. `"bright"`
				---makes the background of these windows lighter than |hl-Normal|, whereas
				---`"dim"` makes it darker.
				---
				---Floating windows include for instance diagnostic pop-ups, scrollable
				---documentation windows from completion engines, overlay windows from
				---installers, etc.
				---
				---NB: This is only significant for dark backgrounds as the light palettes
				---have the same colour for both values in the switch.
				float_style = "bright",
				---Inlay hints are special markers that are displayed inline with the code to
				---provide you with additional information. You can use this option to customize
				---the background color of inlay hints.
				---
				---Options are `"none"` or `"dimmed"`.
				inlay_hints_background = "none",
				---You can override specific highlights to use other groups or a hex colour.
				---This function will be called with the highlights and colour palette tables.
				---@param highlight_groups Highlights
				---@param palette Palette
				on_highlights = function(highlight_groups, palette) end,
				---You can override colours in the palette to use different hex colours.
				---This function will be called once the base and background colours have
				---been mixed on the palette.
				---@param palette Palette
				colours_override = function(palette) end,
			})
			-- vim.cmd([[colorscheme everforest]])
		end,
	},
}

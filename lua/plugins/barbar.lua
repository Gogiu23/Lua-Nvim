return {
	'romgrk/barbar.nvim',
	opts = {},
	config = function () 
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
		map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
		map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
		map('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', opts)
		map('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', opts)
		map('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', opts)
		map('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', opts)
		map('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', opts)
		map('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', opts)
		map('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', opts)
		map('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', opts)
		map('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', opts)
		map('n', '<C-0>', '<Cmd>BufferLast<CR>', opts)
		require'barbar'.setup({
			animation = true,
			tabpages = true,
			focus_on_close = 'previous',
			icons = {
				-- Configure the base icons on the bufferline.
				-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
				buffer_index = false,
				buffer_number = false,
				button = '',
				-- Enables / disables diagnostic symbols
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
					[vim.diagnostic.severity.WARN] = {enabled = false},
					[vim.diagnostic.severity.INFO] = {enabled = false},
					[vim.diagnostic.severity.HINT] = {enabled = true},
				},
				gitsigns = {
					added = {enabled = true, icon = '+'},
					changed = {enabled = true, icon = '~'},
					deleted = {enabled = true, icon = '-'},
				},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				separator = {left = '▎', right = ''},

				-- If true, add an additional separator at the end of the buffer list
				separator_at_end = true,

				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				modified = {button = '●'},
				pinned = {button = '', filename = true},

				-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
				preset = 'default',

				-- Configure the icons on the bufferline based on the visibility of a buffer.
				-- Supports all the base icon options, plus `modified` and `pinned`.
				alternate = {filetype = {enabled = false}},
				current = {buffer_index = true},
				inactive = {button = '×'},
				visible = {modified = {buffer_number = false}},
			},
		})
	end,
}

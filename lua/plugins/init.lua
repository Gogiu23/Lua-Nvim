return {
	-- {'mbbill/undotree'},
	{
		'udalov/kotlin-vim',
		ft = "kt",
	},
	{
			'numToStr/Comment.nvim',
			event = "VeryLazy",
			opts = {},
			config = function ()
				require('Comment').setup()
			end
	},
	{
		'turbio/bracey.vim',
		ft = "html",
	},
	{
		-- highlight the tag corresponding
		'gregsexton/MatchTag',
		ft = "html",
	},
	{
		-- change tag authomatically
		'AndrewRadev/tagalong.vim',
		ft = "html",
	},
	{
		'voldikss/vim-floaterm',
		keys = {
			{"<leader>t", ":FloatermToggle<CR>", desc = "floaterm"}
		},
		config = function ()
--			vim.cmd[[nnoremap <leader>t :FloatermToggle<CR>]]
			vim.cmd[[tnoremap <leader>t <C-\><C-n>:FloatermToggle<CR>]]
			vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', {noremap = true})
		end
	},
}

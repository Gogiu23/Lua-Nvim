return {
	-- {'mbbill/undotree'},
	{
		'udalov/kotlin-vim',
		ft = "kt",
	},
	{
		'preservim/nerdcommenter',
		config = function ()
			vim.cmd[[" Create default mappings
			let g:NERDCreateDefaultMappings = 1

			" Add spaces after comment delimiters by default
			let g:NERDSpaceDelims = 1

			" Use compact syntax for prettified multi-line comments
			let g:NERDCompactSexyComs = 1

			" Align line-wise comment delimiters flush left instead of following code indentation
			let g:NERDDefaultAlign = 'left'

			" Set a language to use its alternate delimiters by default
			let g:NERDAltDelims_java = 1

			" Add your own custom formats or override the defaults
			let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

			" Allow commenting and inverting empty lines (useful when commenting a region)
			let g:NERDCommentEmptyLines = 1

			" Enable trimming of trailing whitespace when uncommenting
			let g:NERDTrimTrailingWhitespace = 1

			" Enable NERDCommenterToggle to check all selected lines is commented or not 
			let g:NERDToggleCheckAllLines = 1]]
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
		config = function ()
			vim.cmd[[nnoremap <leader>t :FloatermToggle<CR>]]
			vim.cmd[[tnoremap <leader>t <C-\><C-n>:FloatermToggle<CR>]]
			vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', {noremap = true})
		end
	},
}

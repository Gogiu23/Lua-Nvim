return {
	{
		-- highlight the tag corresponding
		"gregsexton/MatchTag",
		ft = "html",
	},
	--Floatterm
	{
		"voldikss/vim-floaterm",
		lazy = true,
		keys = {
			{ "<C-/>", ":FloatermToggle<CR>", desc = "floaterm" },
		},
		config = function()
			vim.cmd([[
			tnoremap <C-n> <C-\><C-n>:FloatermNew<CR>
			tnoremap <C-/> <C-\><C-n>:FloatermToggle<CR>
			tnoremap <C-.> <C-\><C-n>:FloatermNext<CR>
			tnoremap <C-,> <C-\><C-n>:FloatermPrev<CR>
			tnoremap <C-c> <C-\><C-n>:FloatermKill!<CR>
			]])
			vim.cmd([[
			let g:floaterm_title = 'GiuliTerm ($1)'
			let g:floaterm_height = 0.9
			let g:floaterm_width = 0.8
			let g:floaterm_titleposition = 'center'
			"highlights
			hi Floaterm guibg=#191e2a
			hi FloatermBorder guibg=#191e2a guifg=#ffcc66
			]])
		end,
	},
	--Dressing library
	{
		"stevearc/dressing.nvim",
		event = "BufReadPre",
	},
	{
		"folke/neoconf.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = "Neoconf",
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>au", ":UndotreeToggle<CR>", desc = "Undotree" },
		},
		config = function()
			vim.cmd([[let g:undotree_SetFocusWhenToggle = 1]])
		end,
	},
}

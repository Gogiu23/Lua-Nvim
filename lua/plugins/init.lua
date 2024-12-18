local index = 0
return {
	{
		"olrtg/nvim-emmet",
		config = function()
			vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
		end,
	},
	{
		-- highlight the tag corresponding
		"gregsexton/MatchTag",
		ft = "html",
	},
	--Floatterm
	{
		"voldikss/vim-floaterm",
		cmd = "FloatermToggle",
		keys = {
			{
				--Command only activate When terminal is open or not
				"<C-/>",
				function()
					if index == 0 then
						index = index + 1
						vim.cmd(":FloatermNew --cwd=<buffer>")
					else
						vim.cmd(":FloatermToggle")
					end
				end,
				desc = "Floaterm toggle or new",
			},
			{
				--LazyGit
				"<leader>gl",
				function()
					vim.cmd(":FloatermNew --cwd=<buffer>")
					vim.cmd("startinsert")
					vim.fn.chansend(vim.b.terminal_job_id, "lazygit\n")
				end,
			},
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

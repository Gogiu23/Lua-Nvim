return {
	'neoclide/coc.nvim',
	event = "InsertEnter",
	branch = 'release',
	config = function ()
		local cmd = vim.cmd
		cmd[[nmap <silent> gd <Plug>(coc-definition)]]
		cmd[[nmap <silent> gy <Plug>(coc-type-definition)]]
		cmd[[nmap <silent> gi <Plug>(coc-implementation)]]
		cmd[[nmap <silent> gr <Plug>(coc-references)]]
		cmd[[  
		function! CheckBackspace() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction

		" Insert <tab> when previous text is space, refresh completion if not.
		inoremap <silent><expr> <TAB>
		\ coc#pum#visible() ? coc#pum#next(1):
		\ CheckBackspace() ? "\<Tab>" :
		\ coc#refresh()
		inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]]
		cmd[[ inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
		\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]]
	end
}

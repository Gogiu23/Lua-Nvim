-- MAPS FOR THE COMMON USE
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true}) --save with Ctrl-s

--AUTOINDENT
vim.cmd[[nnoremap <leader><leader> :normal gg=G''<CR>]]
--MAPS FOR EVOLUTE THE (JKHL) KEYNOTES
vim.api.nvim_set_keymap('n', 'L', '<end>', {noremap = true})
vim.api.nvim_set_keymap('n', 'H', '<home>', {noremap = true})
vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', ':normal 10j<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'K', ':normal 10k<CR>', {noremap = true})

--COC CONFIG
vim.cmd[[nmap <silent> gd <Plug>(coc-definition)]]
vim.cmd[[nmap <silent> gy <Plug>(coc-type-definition)]]
vim.cmd[[nmap <silent> gi <Plug>(coc-implementation)]]
vim.cmd[[nmap <silent> gr <Plug>(coc-references)]]
vim.cmd[[  
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
vim.cmd[[ inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]]

-- vim.api.nvim_set_keymap('n', ']', 'gt', {noremap = true})
-- vim.api.nvim_set_keymap('n', '[', 'gT', {noremap = true})
-- vim.cmd[[nnoremap ] gt <CR>]]
-- vim.cmd[[nnoremap [ gT <CR>]]
vim.cmd[[nnoremap <leader>e :source ~/.config/nvim/init.lua<CR>]]
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit $HOME/.config/nvim/init.lua<CR>', {noremap = true})

--MOVE VISUAL STRINGS TROUGHT THE SCREEN
vim.cmd[[vnoremap <S-j> :m '>+1<CR>gv=gv]] 
vim.cmd[[vnoremap <S-k> :m '<-2<CR>gv=gv]]

-- MAPS FOR THE NvimTreeToggle
vim.cmd[[nnoremap <space> :NvimTreeToggle<CR>]]

--MAPS FOR TELESCOPE
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- MAPS FOR THE FLOATERM
vim.cmd[[nnoremap <leader>t :FloatermToggle<CR>]]
vim.cmd[[tnoremap <leader>t <C-\><C-n>:FloatermToggle<CR>]]
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', {noremap = true})

-- --commenter in c/c++
-- vim.keymap.set('n', 'cc', ':normal Hi//jk<CR>', {})
-- vim.keymap.set('n', '.c', ':normal Hxxj<CR>', {})

--KEYMAPS GLANCE.NVIM
vim.keymap.set('n', 'gD', '<CMD>Glance definitions<CR>')
vim.keymap.set('n', 'gR', '<CMD>Glance references<CR>')
vim.keymap.set('n', 'gY', '<CMD>Glance type_definitions<CR>')
vim.keymap.set('n', 'gM', '<CMD>Glance implementations<CR>')

--IMPLEMENTATION VIM FUGITIVE
vim.api.nvim_set_keymap('n', '<leader>g', '<CMD>Git<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gc', '<CMD>Git commit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>g+', '<CMD>Git push<CR>', {noremap = true})

-- VIM COMMENTER
vim.cmd[[map <C-/> <plug>NERDCommenterToggle]]

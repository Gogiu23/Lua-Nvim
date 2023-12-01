-- MAPS FOR THE COMMON USE
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true}) --save with Ctrl-s

--AUTOINDENT
vim.cmd[[nnoremap <leader><leader> :normal gg=G''<CR>]]

--MAPS FOR EVOLUTE THE (JKHL) KEYNOTES
vim.api.nvim_set_keymap('n', 'L', '<end>', {noremap = true})
vim.api.nvim_set_keymap('n', 'H', '<home>', {noremap = true})
vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true})

--MOVE VISUAL STRINGS TROUGHT THE SCREEN
vim.cmd[[vnoremap <S-j> :m '>+1<CR>gv=gv]] 
vim.cmd[[vnoremap <S-k> :m '<-2<CR>gv=gv]]

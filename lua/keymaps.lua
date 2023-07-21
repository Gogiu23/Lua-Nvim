-- MAPS FOR THE COMMON USE
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'L', '<end>', {noremap = true})
vim.api.nvim_set_keymap('n', 'H', '<home>', {noremap = true})
vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true})
vim.cmd[[nnoremap <leader>e :source ~/.config/nvim/init.lua<CR>]]
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
vim.keymap.set('n', '<leader>un', ':UndotreeToggle<CR>', {noremap = true})

--Commenter in C/C++
vim.keymap.set('n', 'cc', ':normal Hi//jk<CR>', {})
vim.keymap.set('n', '.c', ':normal Hxxj<CR>', {})

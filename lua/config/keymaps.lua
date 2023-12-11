local map = vim.keymap.set
local N = "n"
local V = "v"
local opts = {remap = true, silent = false}

--AUTOINDENT
vim.cmd[[nnoremap <leader><leader> :normal gg=G''<CR>]]

--MAPS FOR EVOLUTE THE (JKHL) KEYNOTES
map({'n', 'v'}, 'L', '<end>', {noremap = true})
map({'n', 'v'}, 'H', '<home>', {noremap = true})
map("i", "jk", "<esc>", {desc = "exit"})

--MOVE VISUAL STRINGS TROUGHT THE SCREEN
vim.cmd[[vnoremap <S-j> :m '>+1<CR>gv=gv]] 
vim.cmd[[vnoremap <S-k> :m '<-2<CR>gv=gv]]

-- Resize window using <ctrl> arrow keys
map("n", "<C-j>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-k>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

--Save File
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

--Toggle paste mode
map( "n", "<leader>sp", "<cmd>set paste!<CR>", {desc = "pastetoggle"})

--Toggle comments
map(N, "<C-/>", "gcc", opts)
map(V, "<C-/>", "gc", opts)

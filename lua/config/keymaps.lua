local map = vim.keymap.set
local I = "i"
local N = "n"
local V = "v"
local E = "jk"
local opts = { remap = true, silent = true }

--Activate template html
map(N, "<leader>tr", "<CMD>read ~/templateHtml/index.html<CR>", { desc = "template html", expr = true })

--Moving between buffers and delete ones
map(N, "<C-.>", "<cmd>bnext<CR>", opts)
map(N, "<C-,>", "<cmd>bprev<CR>", opts)
map(N, "<C-c>", "<cmd>BufferDelete<CR>", opts)

--MAPS FOR EVOLUTE THE (JKHL) KEYNOTES
map({ N, V }, "L", "<end>", { noremap = true })
map({ N, V }, "H", "<home>", { noremap = true })
map("i", E, "<esc>", { desc = "exit" })

--MOVE VISUAL STRINGS TROUGHT THE SCREEN
vim.cmd([[vnoremap <C-j> :m '>+1<CR>gv=gv]])
vim.cmd([[vnoremap <C-k> :m '<-2<CR>gv=gv]])

-- Resize window using <ctrl> arrow keys
map(N, "<C-j>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map(N, "<C-k>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map(N, "<C-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map(N, "<C-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Clear search with <esc>
map({ I, N }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

--Save File
map({ "i", "x", "n", "s" }, "<C-s>", "<CMD>w!<cr><esc>", opts)

--Toggle paste mode
map("n", "<leader>sp", "<cmd>set paste!<CR>", { desc = "pastetoggle" })

--keymaps for luasnips
map({ "i", "s" }, "<C-L>", "<cmd>lua require('luasnip').jump(-1)<CR>", opts)
map({ "i", "s" }, "<C-J>", "<cmd>lua require('luasnip').jump(1)<CR>", opts)

--code snippet for Google
local search = function()
	local input = vim.fn.input("")
	local browser = "'https://www.google.com/search?q=" .. input .. "'"
	local cmd = "!open" .. " " .. browser
	vim.cmd(cmd)
end

--code snippet for chat gpt
local chatgpt = function()
	local browser = "'https://chat.openai.com/'"
	local cmd = "!open" .. " " .. browser
	vim.cmd(cmd)
end

map(N, "<leader>sg", search, { desc = "search Google" })
map(N, "<leader>sc", chatgpt, { desc = "search chatgpt" })

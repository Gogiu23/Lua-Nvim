local map = vim.keymap.set
local N = "n"
local V = "v"
local opts = { remap = true, silent = true }

--activate template html
map(N, "<leader>r", "<CMD>read ~/templateHtml/index.html<CR>", { desc = "template html" })

--nvimtree space activate
map(N, "<space>", "<cmd>NvimTreeToggle<CR>", opts)

--AUTOINDENT
vim.cmd([[nnoremap <leader><leader> :normal gg=G''<CR>]])

--MAPS FOR EVOLUTE THE (JKHL) KEYNOTES
map({ "n", "v" }, "L", "<end>", { noremap = true })
map({ "n", "v" }, "H", "<home>", { noremap = true })
map("i", "jk", "<esc>", { desc = "exit" })

--MOVE VISUAL STRINGS TROUGHT THE SCREEN
vim.cmd([[vnoremap <C-j> :m '>+1<CR>gv=gv]])
vim.cmd([[vnoremap <C-k> :m '<-2<CR>gv=gv]])

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
map("n", "<leader>sp", "<cmd>set paste!<CR>", { desc = "pastetoggle" })

--Toggle comments
map(N, "<C-/>", "gcc", opts)
map(V, "<C-/>", "gc", opts)

--keymaps for luasnips
map({ "i", "s" }, "<C-L>", "<cmd>lua require('luasnip').jump(-1)<CR>", opts)
map({ "i", "s" }, "<C-J>", "<cmd>lua require('luasnip').jump(1)<CR>", opts)

local search = function()
	local input = vim.fn.input("")
	local browser = "'https://www.google.com/search?q=" .. input .. "'"
	local cmd = "!open" .. " " .. browser
	vim.cmd(cmd)
end

local chatgpt = function()
	local browser = "'https://chat.openai.com/'"
	local cmd = "!open" .. " " .. browser
	vim.cmd(cmd)
end

map(N, "<leader>sg", search, { desc = "search Google" })
map(N, "<leader>sc", chatgpt, { desc = "search chatgpt" })

-- search Google()
-- map(
-- 	N,
-- 	"<leader>sg",
-- 	"<cmd>lua vim.fn.system({'/Applications/Google Chrome.app/Contents/MacOS/Google Chrome', 'https://www.google.com/search?q=' .. vim.fn.input('')})<CR>",
-- 	opts,
-- 	{ desc = "Search Google" }
--

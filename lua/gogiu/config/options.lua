local opt = vim.opt
vim.g.autoformat = true
opt.wrap = false
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 2
opt.scrolloff = 5
opt.sidescrolloff = 8 -- Columns of context
opt.shortmess:append({ W = true, I = true, c = true, C = true })

opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.expandtab = true
opt.scrollopt = "ver"
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.path:append({ "**" })
-- opt.filetype.indent = true
opt.smartindent = true
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
-- opt.filetype.plugin = true
opt.clipboard:append({ "unnamedplus" })
opt.autowrite = true --enable autowrite
opt.confirm = true --confirm to save the file
opt.cursorline = true
opt.mouse = "a"
opt.showmode = false
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.list = false
opt.numberwidth = 4
opt.fillchars = { eob = " " }
opt.pumblend = 10
opt.pumheight = 10
if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end
opt.formatoptions = "jcroqlnt"
opt.completeopt = "menu,menuone,noselect"
opt.laststatus = 3

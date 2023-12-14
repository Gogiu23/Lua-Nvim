```lua
local popup = require("plenary.popup")
local win_id

function ShowMenu(opts, cb)
    local height = 5
    local width = 40
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    win_id = popup.create(opts, {
            title = "Search Google",
            line = math.floor(((vim.o.lines - height) / 2) - 1),
            col = math.floor((vim.o.columns - width) / 2),
            minwidth = width,
            minheight = height,
            borderchars = borderchars,
            callback = cb,
            })
local bufnr = vim.api.nvim_win_get_buf(Win_id)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { silent = false })
    end
function MyMenu()
    local opts = {}
local cb = function(_, sel)
    print("it works")
    end
ShowMenu(opts, cb)
    end
    function CloseMenu()
vim.api.nvim_win_close(win_id, true)
    end
MyMenu()
    ```

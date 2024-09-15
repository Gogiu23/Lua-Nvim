local M = {}

local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")
local prettier_d = require("efmls-configs.formatters.prettier_d")
local eslint_d = require("efmls-configs.linters.eslint_d")
-- local cpplint = require("efmls-configs.linters.cpplint")
-- local clang_format = require("efmls-configs.formatters.clang_format")

M.langs = {
	lua = { stylua, luacheck },
	javascript = { eslint_d, prettier_d },
	javascriptreact = { eslint_d, prettier_d },
	typescript = { eslint_d, prettier_d },
	html = { eslint_d, prettier_d },
	-- cpp = { cpplint, clang_format },
}
return M

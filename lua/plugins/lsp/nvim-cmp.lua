return {
	{
		"ray-x/navigator.lua",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
		},
		config = function()
			require("navigator").setup({
				mason = true,
				default_mapping = false,
				keymaps = {
					{ key = "<leader>Lr", func = require("navigator.reference").async_ref, desc = "References" },
					{ key = "<leader>Ld", func = require("navigator.definition").definition, desc = "Definition" },
					{ key = "<leader>LD", func = vim.lsp.buf.declaration, desc = "Declaration" },
					-- for lsp handler
					{
						key = "<leader>Lp",
						func = require("navigator.definition").definition_preview,
						"gp",
						desc = "Definition_preview",
					}, -- paste
					{
						key = "<leader>LP",
						func = require("navigator.definition").type_definition_preview,
						"gP",
						desc = "Type_definition_preview",
					}, -- paste
					{
						key = "<leader>Lt",
						func = require("navigator.treesitter").buf_ts,
						desc = "Treesitter buffer",
					},
					{
						key = "<leader>LT",
						func = require("navigator.treesitter").bufs_ts,
						desc = "Treesitter Buffers",
					},
					{
						key = "<leader>Lc",
						func = require("navigator.ctags").ctags,
						desc = "Ctags",
					},
					{
						key = "<leader>ca",
						func = require("navigator.codeAction").code_action,
						desc = "Code_action",
						mode = { "n", "v" },
					},
					-- { key = '<Leader>re', func = 'rename()' },
					{
						key = "<leader>Lr",
						func = require("navigator.rename").rename,
						desc = "Rename",
					},
					{
						key = "<leader>Li",
						func = vim.lsp.buf.incoming_calls,
						desc = "incoming_calls",
					},
					{
						key = "<Leader>Lo",
						func = vim.lsp.buf.outgoing_calls,
						desc = "outgoing_calls",
					},
					-- {
					-- 	key = "gi",
					-- 	func = vim.lsp.buf.implementation,
					-- 	desc = "implementation",
					-- }, -- insert
					-- {
					-- 	key = "<Space>D",
					-- 	func = vim.lsp.buf.type_definition,
					-- 	desc = "type_definition",
					-- },
					{
						key = "<leader>Ls",
						func = require("navigator.diagnostics").show_diagnostics,
						desc = "Show diagnostics",
					},
					{
						key = "<leader>LS",
						func = require("navigator.diagnostics").show_buf_diagnostics,
						desc = "Show diagnostics in buffer",
					},
					{
						key = "<Leader>Lss",
						func = require("navigator.diagnostics").toggle_diagnostics,
						desc = "Toggle diagnostics",
					},
					{
						key = "]r",
						func = require("navigator.treesitter").goto_next_usage,
						desc = "goto_next_usage",
					},
					{
						key = "[r",
						func = require("navigator.treesitter").goto_previous_usage,
						desc = "goto_previous_usage",
					},
					-- {
					-- 	key = "<Space>wa",
					-- 	func = require("navigator.workspace").add_workspace_folder,
					-- 	desc = "add_workspace_folder",
					-- },
					-- {
					-- 	key = "<Space>wr",
					-- 	func = require("navigator.workspace").remove_workspace_folder,
					-- 	desc = "remove_workspace_folder",
					-- },
					{
						key = "<leader>Lf",
						func = vim.lsp.buf.format,
						desc = "Format",
						mode = { "n", "v", "x" },
					},
					-- {
					-- 	key = "<Space>gm",
					-- 	func = require("navigator.formatting").range_format,
					-- 	mode = "n",
					-- 	desc = "range format operator e.g gmip",
					-- },
					-- {
					-- 	key = "<Space>wl",
					-- 	func = require("navigator.workspace").list_workspace_folders,
					-- 	desc = "list_workspace_folders",
					-- },
					-- {
					-- 	key = "<Space>la",
					-- 	func = require("navigator.codelens").run_action,
					-- 	desc = "run code lens action",
					-- 	mode = "n",
					-- },
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"windwp/nvim-autopairs",
			"hrsh7th/cmp-nvim-lua",
			{ "jackieaskins/cmp-emmet", build = "npm run release" },
		},
		opts = function()
			-- require("luasnip.loaders.from_vscode").load()
			local luasnip = require("luasnip")
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()

			return {
				completion = {
					completeopt = "menu,menuone,noselect",
				},
				view = {
					entries = {
						name = "custom",
					},
				},
				window = {
					documentation = {
						border = "rounded",
					},
					completion = {
						border = "none",
						winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
					},
					scrollbar = true,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({ select = false }),
						-- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
						c = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
						if cmp.visible() then
							local entry = cmp.get_selected_entry()
							if not entry then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
							end
							cmp.confirm()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.confirm()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if not cmp.visible() and luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "emmet" },
				}),
				-- `/` cmdline setup.
				cmp.setup.cmdline("/", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				}),
				-- `:` cmdline setup.
				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{
							name = "cmdline",
							option = {
								ignore_cmds = { "Man", "!" },
							},
						},
					}),
				}),
				--luakind vscode pictograms
				formatting = {
					format = function(entry, item)
						local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
						item = require("lspkind").cmp_format({
							-- any lspkind format settings here
						})(entry, item)
						if color_item.abbr_hl_group then
							item.kind_hl_group = color_item.abbr_hl_group
							item.kind = color_item.abbr
						end
						return item
					end,
				},
				sorting = defaults.sorting,
			}
		end,
		---@param opts cmp.ConfigSchema
		config = function(_, opts)
			for _, source in ipairs(opts.sources) do
				source.group_index = source.group_index or 1
			end
			require("cmp").setup(opts)
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		event = { "BufReadPre", "BufNewFile" },
		build = "make install_jsregexp",
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			{
				"hrsh7th/nvim-cmp",
				dependencies = {
					"saadparwaiz1/cmp_luasnip",
				},
				opts = function(_, opts)
					opts.snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					}
					table.insert(opts.sources, { name = "luasnip" })
				end,
			},
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},
}

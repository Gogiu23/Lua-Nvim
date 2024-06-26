return {
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
			local has_words_before = require("util.cmp").has_words_before
			-- require("luasnip.loaders.from_vscode").load()
			local luasnip = require("luasnip")
			local cmp = require("cmp")
			local lspkind = require("lspkind")
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
						border = "rounded",
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
					--Using tab to complete only with one voice
					-- ["<Tab>"] = cmp.mapping(function(fallback)
					-- 	if cmp.visible() then
					-- 		if #cmp.get_entries() == 1 then
					-- 			cmp.confirm({ select = true })
					-- 		else
					-- 			cmp.select_next_item()
					-- 		end
					-- 	elseif luasnip.expand_or_jumpable() then
					-- 		luasnip.expand_or_jump()
					-- 	elseif has_words_before() then
					-- 		cmp.complete()
					-- 		if #cmp.get_entries() == 1 then
					-- 			cmp.confirm({ select = true })
					-- 		end
					-- 	else
					-- 		fallback()
					-- 	end
					-- end, { "i", "s" }),
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
					-- {
					-- 	name = "html-css",
					-- 	option = {
					-- 		enable_on = {
					-- 			"html",
					-- 			"css",
					-- 			"javascript",
					-- 			"javascriptreact",
					-- 		},
					-- 		file_extensions = { "css", "sass", "less" },
					-- 		style_sheets = {
					-- 			"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css",
					-- 		},
					-- 	},
					-- },
					-- { name = "nvim_lua" },
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
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
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
	-- {
	-- 	"Jezda1337/nvim-html-css",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("html-css"):setup()
	-- 	end,
	-- },
}

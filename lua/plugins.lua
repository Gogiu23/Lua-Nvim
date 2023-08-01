require('packer').startup(function(use)
--PACKER
	use 'wbthomason/packer.nvim'
--LUALINE
	use {
		'nvim-lualine/lualine.nvim',
	}

--COC
	use {'neoclide/coc.nvim', branch = 'release'}

--NVIM TREE
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}

--COLORSCHEME
	--TOKYO NIGHT
	use {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	}
	--OCEANICNEXT
	use {'mhartington/oceanic-next'}
--TELESCOPE
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
--TREESITTER
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
--VIM FLOATERM
	use 'voldikss/vim-floaterm'

--MARKDOWN PREVIEW
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
--UNDOTREE
	use 'mbbill/undotree'
--MASON
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}
	use({
		"dnlhc/glance.nvim",
		config = function()
			require('glance').setup({
				-- your configuration
			})
		end,
	})

--VIM FUGITIVE
	use {'tpope/vim-fugitive'}
end)

--FORMATTER
require('packer').use { 'mhartington/formatter.nvim' }

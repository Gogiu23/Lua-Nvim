-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		['clangd'] = {autostart = true},
	},
}
lspconfig.kotlin_language_server.setup {
	settings = {
		kotlin = {
			compiler = {
				jvm = {
					target = "1.8";
				}
			};
		};
	}
}
lspconfig.marksman.setup{}

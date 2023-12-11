return {
	'echasnovski/mini.pairs',
	event = {"BufReadPre", "BufNewFile"},
	version = "*",
	config = function ()
		require('mini.pairs').setup()
	end
}

return
{
	"smoka7/multicursors.nvim",
	keys = {
		{"<leader>m", "<cmd>MCstart<CR>", desc = {"start multicursor"} }
	},
	-- event = "VeryLazy",
	dependencies = {
		'smoka7/hydra.nvim',
	},
	opts = {},
	cmd = { 
		'MCstart', 
		'MCvisual', 
		'MCclear', 
		'MCpattern', 
		'MCvisualPattern', 
		'MCunderCursor' 
	},
	keys = {
		{
			mode = { 'v', 'n' },
			'<Leader>m',
			'<cmd>MCstart<cr>',
			desc = 'Create a selection for selected text or word under the cursor',
		},
	},
}

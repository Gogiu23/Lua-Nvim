return {
	"smoka7/multicursors.nvim",
	dependencies = {
		"smoka7/hydra.nvim",
	},
	opts = {},
	cmd = {
		"MCstart",
		"MCvisual",
		"MCclear",
		"MCpattern",
		"MCvisualPattern",
		"MCunderCursor",
	},
	keys = {
		{
			mode = { "v", "n" },
			"<Leader>M",
			"<cmd>MCstart<cr>",
		},
	},
}

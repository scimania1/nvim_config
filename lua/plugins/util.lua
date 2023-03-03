return {
	{
		"echasnovski/mini.pairs",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
}

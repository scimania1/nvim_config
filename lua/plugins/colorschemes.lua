return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		opts = {
			dimInactive = true,
		},
		config = function(_, opts)
			require("kanagawa").load()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		config = function(_, _)
			require("catppuccin").load()
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
	},
}

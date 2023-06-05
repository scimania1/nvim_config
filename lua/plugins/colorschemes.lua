return {
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		opts = {
			dimInactive = true,
		},
		config = function(_, opts)
			require("kanagawa").load()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
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
		opts = {
			no_italic = true,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd("colorscheme catppuccin")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		opts = {
			disable_italics = true,
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"ribru17/bamboo.nvim",
		lazy = true,
		config = function(_, _)
			require("bamboo").load()
		end,
	},
}

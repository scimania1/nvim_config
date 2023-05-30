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
		lazy = true,
		opts = { style = "night" },
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
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
		"loctvl842/monokai-pro.nvim",
		lazy = true,
		config = function(_, _)
			require("monokai-pro").setup()
			vim.cmd([[colorscheme monokai-pro]])
		end,
	},
}

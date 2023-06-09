return {
	-- {
	-- 	"echasnovski/mini.pairs",
	-- 	version = false,
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function(_, opts)
	-- 		require("mini.pairs").setup(opts)
	-- 	end,
	-- },
	{
		"windwp/nvim-autopairs",
		event = { "BufReadPre", "BufNewFile" },
		config = function(_, _)
			require("nvim-autopairs").setup()
			require("nvim-autopairs").get_rules("'")[1].not_filetypes = { "rust", "lisp" }
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function(_, opts)
			require("mini.surround").setup(opts)
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function(_, _)
			require("todo-comments").setup()
		end,
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "open Undo Tree" },
		},
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function(_, _)
			require("gitsigns").setup()
		end,
	},
	{
		"tpope/vim-fugitive",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Fugitive" },
		},
	},
	{
		"uga-rosa/ccc.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		},
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
}

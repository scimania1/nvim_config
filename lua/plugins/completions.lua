return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			region_check_events = "InsertEnter",
			delete_check_events = { "TextChanged" },
		},
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		opts = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					-- { name = "cmdline" },
				}),
				formatting = {
					-- format = lspkind.cmp_format({ with_text = false , max_width = 50 }),
					format = lspkind.cmp_format(),
				},
				experimental = {
					ghost_text = {
						hl_group = "LspCodeLens",
					},
				},
				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			}
		end,
		--    config = function(_, opts)
		--      local cmp = require("cmp")
		--      cmp.setup(opts)
		--      cmp.setup.cmdline('/', {
		--        mapping = cmp.mapping.preset.cmdline(),
		--        sources = {
		--          { name = 'buffer' }
		--        }
		--      })
		--      cmp.setup.cmdline(':', {
		--        mapping = cmp.mapping.preset.cmdline(),
		--        sources = cmp.config.sources({
		--          { name = 'path' }
		--        }, {
		--            {
		--              name = 'cmdline',
		--              option = {
		--                ignore_cmds = { 'Man', '!' }
		--              }
		--            }
		--          })
		--      })
		--    end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
}

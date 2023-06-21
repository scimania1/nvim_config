return {
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
				globalstatus = true,
				theme = "auto",
				disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
			},
			-- winbar = {
			-- 	lualine_a = {},
			-- 	lualine_b = {},
			-- 	lualine_c = { "filename" },
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {},
			-- },
			-- inactive_winbar = {
			-- 	lualine_a = {},
			-- 	lualine_b = {},
			-- 	lualine_c = { "filename" },
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {},
			-- },
		},
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon",
				},
				color_icons = true,
				diagnostics = "nvim_lsp",
				separator_style = "slope",
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			-- lsp = {
			-- 	auto_attach = true,
			-- 	preference = { "rust_analyzer", "null-ls" },
			-- },
			-- highlight = true,
			-- click = true,
		},
		-- config = function(_, opts)
		-- 	require("nvim-navic").setup(opts)
		-- end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{
		"SmiteshP/nvim-navbuddy",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lsp = { auto_attach = true },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			symbol = "│",
			show_end_of_line = true,
			show_trailing_blankline_indent = false,
			show_current_context = false,
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
		},
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			stages = "fade",
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "rcarriga/nvim-notify" },
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					-- ["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
        -- stylua: ignore
        keys = {
            {
                "<S-Enter>",
                function() require("noice").redirect(vim.fn.getcmdline()) end,
                mode = "c",
                desc =
                "Redirect Cmdline"
            },
            {
                "<leader>snl",
                function() require("noice").cmd("last") end,
                desc =
                "Noice Last Message"
            },
            {
                "<leader>snh",
                function() require("noice").cmd("history") end,
                desc =
                "Noice History"
            },
            { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
            {
                "<c-f>",
                function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
                silent = true,
                expr = true,
                desc =
                "Scroll forward",
                mode = {
                    "i", "n", "s" }
            },
            {
                "<c-b>",
                function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
                silent = true,
                expr = true,
                desc =
                "Scroll backward",
                mode = {
                    "i", "n", "s" }
            },
        },
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.buttons.val = {
				dashboard.button("f", " " .. " Find file", ":lua require('telescope.builtin').find_files()<cr>"),
				dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
				dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
				dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.footer.opts.hl = "Type"
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.opts.layout[1].val = 8
			return dashboard
		end,
		config = function(_, dashboard)
			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			require("alpha").setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
	{ "MunifTanjim/nui.nvim", lazy = true },
}

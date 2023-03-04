return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
		},
		opts = {
			diagnostics = {
				virtual_text = { spacing = 4, prefix = "●" },
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = false,
				-- float = {
				--   focusable = true,
				--   style = "minimal",
				--   border = "rounded",
				--   source = "always",
				--   header = "",
				--   prefix = "",
				-- },
			},
			servers = {
				jsonls = {},
				lua_ls = {
					-- mason = false, -- set to false if you don't want this server to be installed with mason
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						},
					},
				},
			},
		},
		config = function(plugin, opts)
			local mason = require("mason")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				border = "rounded",
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local on_attach = function(client, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
				nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- See `:help K` for why this keymap
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

				-- Lesser used LSP functionality
				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
				nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
				nmap("<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "[W]orkspace [L]ist Folders")
				nmap("<leader>vd", function()
					vim.diagnostic.open_float()
				end, "Open Float")

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })
			end

			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(opts.servers),
				automatic_installation = true,
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = opts.servers[server_name],
					})
				end,
			})

			-- icons for diagnostics
			vim.diagnostic.config(opts.diagnostics)
		end,
	},
	-- {
	-- 	"folke/neodev.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		debug = true,
	-- 		experimental = {
	-- 			pathStrict = true,
	-- 		},
	-- 	},
	-- },
	{
		"folke/trouble.nvim",
    cmd = "Trouble",
		dependencies = "nvim-tree/nvim-web-devicons",
		keys = {
			{ "<leader>sd", "<cmd>TroubleToggle<cr>", desc = "shows diagnostics in trouble.nvim" },
		},
	},
}

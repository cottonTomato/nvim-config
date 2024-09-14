return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"williamboman/mason-lspconfig.nvim",
			"MysticalDevil/inlay-hints.nvim",
		},
		ft = {
			"cpp",
			"go",
			"lua",
			"javascript",
			"javascriptreact",
			"python",
			"typescript",
			"typescriptreact",
			"rust",
			"zig",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local inlay_hints = require("inlay-hints")

			local keymap = vim.keymap
			local opts = { silent = true }

			-- keymap
			opts.desc = "Restart LSP"
			keymap.set("n", "<leader><leader>+", "<cmd>LspRestart<CR>", opts)

			opts.desc = "Rename symbol"
			keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

			opts.desc = "See code actions"
			keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

			opts.desc = "Previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "Z", vim.diagnostic.open_float, opts)

			opts.desc = "Show documentation"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local capabilities = cmp_nvim_lsp.default_capabilities()

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["pyright"] = function()
					lspconfig["pyright"].setup({
						settings = {
							pyright = {
								disableOrganizeImports = true,
							},
						},
					})
				end,
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						on_attach = function(client, bufnr)
							inlay_hints.on_attach(client, bufnr)
						end,
						settings = {
							Lua = {
								hint = {
									enable = true,
								},
							},
						},
					})
				end,
				["gopls"] = function()
					lspconfig["gopls"].setup({
						on_attach = function(client, bufnr)
							inlay_hints.on_attach(client, bufnr)
						end,
						settings = {
							gopls = {
								hints = {
									rangeVariableTypes = true,
									parameterNames = true,
									constantValues = true,
									assignVariableTypes = true,
									compositeLiteralFields = true,
									compositeLiteralTypes = true,
									functionTypeParameters = true,
								},
							},
						},
					})
				end,
				["ts_ls"] = function()
					lspconfig["ts_ls"].setup({
						on_attach = function(client, bufnr)
							inlay_hints.on_attach(client, bufnr)
						end,
						settings = {
							typescript = {
								inlayHints = {
									includeInlayParameterNameHints = "all",
									includeInlayParameterNameHintsWhenArgumentMatchesName = true,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
									includeInlayVariableTypeHintsWhenTypeMatchesName = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayEnumMemberValueHints = true,
								},
							},
							javascript = {
								inlayHints = {
									includeInlayParameterNameHints = "all",
									includeInlayParameterNameHintsWhenArgumentMatchesName = true,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
									includeInlayVariableTypeHintsWhenTypeMatchesName = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayEnumMemberValueHints = true,
								},
							},
						},
					})
				end,
				["zls"] = function()
					lspconfig["zls"].setup({
						on_attach = function(client, bufnr)
							inlay_hints.on_attach(client, bufnr)
						end,
						settings = {
							zls = {
								enable_inlay_hints = true,
								inlay_hints_show_builtin = true,
								inlay_hints_exclude_single_argument = true,
								inlay_hints_hide_redundant_param_names = false,
								inlay_hints_hide_redundant_param_names_last_token = false,
							},
						},
					})
				end,
			})

			lspconfig["clangd"].setup({
				capabilities = capabilities,
				cmd = { "clangd", "--clang-tidy" },
				on_attach = function(client, bufnr)
					inlay_hints.on_attach(client, bufnr)
				end,
				settings = {
					clangd = {
						InlayHints = {
							Designators = true,
							Enabled = true,
							ParameterNames = true,
							DeducedTypes = true,
						},
						fallbackFlags = { "-std=c++20" },
					},
				},
			})

			lspconfig["rust_analyzer"].setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					inlay_hints.on_attach(client, bufnr)
				end,
				settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
						},
						inlayHints = {
							bindingModeHints = {
								enable = false,
							},
							chainingHints = {
								enable = true,
							},
							closingBraceHints = {
								enable = true,
								minLines = 25,
							},
							closureReturnTypeHints = {
								enable = "never",
							},
							lifetimeElisionHints = {
								enable = "never",
								useParameterNames = false,
							},
							maxLength = 25,
							parameterHints = {
								enable = true,
							},
							reborrowHints = {
								enable = "never",
							},
							renderColons = true,
							typeHints = {
								enable = true,
								hideClosureInitialization = false,
								hideNamedConstructor = false,
							},
						},
					},
				},
			})
		end,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		ft = {
			"cpp",
			"go",
			"lua",
			"javascript",
			"javascriptreact",
			"python",
			"typescript",
			"typescriptreact",
			"rust",
			"zig",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		opts = {},
	},
	{
		"zbirenbaum/neodim",
		event = "LspAttach",
		opts = {
			alpha = 0.75,
			blend_color = "#000000",
			hide = {
				underline = true,
				virtual_text = true,
				signs = true,
			},
			regex = {
				"[uU]nused",
				"[nN]ever [rR]ead",
				"[nN]ot [rR]ead",
			},
			priority = 128,
			disable = {},
		},
	},
	{
		"kosayoda/nvim-lightbulb",
		ft = {
			"cpp",
			"go",
			"lua",
			"javascript",
			"javascriptreact",
			"python",
			"typescript",
			"typescriptreact",
			"rust",
			"zig",
		},
		opts = {
			sign = {
				enabled = false,
			},
			virtual_text = {
				enabled = true,
			},
			autocmd = {
				enabled = true,
			},
			ignore = {
				ft = {
					"alpha",
					"neo-tree",
					"help",
				},
			},
		},
	},
}

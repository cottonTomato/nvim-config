return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"mason-org/mason-lspconfig.nvim",
		},
		ft = {
			"c",
			"cpp",
			"javascript",
			"javascriptreact",
			"lua",
			"python",
			"typescript",
			"typescriptreact",
			"rust",
		},
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local keymap = vim.keymap
			local opts = { silent = true }

			-- keymap
			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", opts)

			opts.desc = "Rename symbol"
			keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)

			opts.desc = "See code actions"
			keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

			opts.desc = "Previous diagnostic"
			keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, opts)

			opts.desc = "Next diagnostic"
			keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "Z", vim.diagnostic.open_float, opts)

			opts.desc = "Show documentation"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			local capabilities = cmp_nvim_lsp.default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						hint = {
							enable = true,
						},
					},
				},
			})

			vim.lsp.config("tsserver", {
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

			vim.lsp.config("basedpyright", {
				basedpyright = {
					disableOrganizeImports = true,
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
					},
				},
			})

			vim.lsp.config("clangd", {
				cmd = { "clangd", "--clang-tidy" },
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

			vim.lsp.config("rust_analyzer", {
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

			vim.lsp.enable({ "clangd", "rust_analyzer" })
		end,
	},
	{
		"MysticalDevil/inlay-hints.nvim",
		event = "LspAttach",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("inlay-hints").setup()
			vim.keymap.set(
				"n",
				"<leader>th",
				"<cmd>InlayHintsToggle<cr>",
				{ desc = "Toggle inlay hints", silent = true }
			)
		end,
	},
}

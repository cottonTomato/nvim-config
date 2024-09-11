return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"williamboman/mason-lspconfig.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local keymap = vim.keymap
			local opts = { silent = true }

			-- keymap
			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>+", "<cmd>LspRestart<CR>", opts)

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
						capabilities = capabilities,
						settings = {
							["pyright"] = {
								disableOrganizeImports = true,
							},
						},
					})
				end,
			})

			lspconfig["clangd"].setup({
				capabilities = capabilities,
				cmd = { "clangd", "--clang-tidy" },
			})

			lspconfig["rust_analyzer"].setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
						},
					},
				},
			})
		end,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
}

return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				dependencies = {
					"jay-babu/mason-nvim-dap.nvim",
				},
			},
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = " ",
						package_pending = "󱌢 ",
						package_uninstalled = " ",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"bashls", -- bash
					"neocmake", -- cmake
					"gopls", -- go
					"lua_ls", -- lua
					"pyright", -- python
					"tsserver", -- ts, tsx
					"zls", -- zig
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					-- formatters
					"shfmt", -- bash
					"clang-format", -- c cpp
					"gersemi", -- cmake
					"goimports", -- go
					"stylua", -- lua
					"mdformat", -- markdown
					"prettier", -- js, ts, json, yaml
					"sql-formatter", -- sql
					"taplo", -- toml
					"xmlformatter", -- xml
					-- linters
					"shellcheck", -- bash
					"golangci-lint", -- go
					"luacheck", -- lua
					"markdownlint", -- markdown
					"biome", -- js, ts
					"sqlfluff", -- sql
					-- linter + formatter
					"buf", -- protobuf
					"ruff", -- python
					-- misc
					"codespell", -- spellings linter
				},
				integrations = {
					["mason-nvim-dap"] = true,
				},
			})

			-- keymap
			vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Open Mason", silent = true })
		end,
	},
}

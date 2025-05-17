return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		opts = {
			ui = {
				border = "single",
				icons = {
					package_installed = " ",
					package_pending = "󱌢 ",
					package_uninstalled = " ",
				},
			},
		},
		keys = {
			{
				"<leader><leader>m",
				"<cmd>Mason<cr>",
				mode = "n",
				desc = "Open Mason",
				silent = true,
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = "williamboman/mason.nvim",
		lazy = true,
		opts = {
			ensure_installed = {
				"neocmake", -- cmake
				"lua_ls", -- lua
				"pyright", -- python
				"ts_ls", -- ts, tsx
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		lazy = true,
		opts = {
			ensure_installed = {
				-- formatters
				"shfmt", -- bash
				"prettier", -- html, js, jsx, ts, tsx, json, yaml
				"gersemi", -- cmake
				"stylua", -- lua
				"mdformat", -- markdown
				"sql-formatter", -- sql
				"taplo", -- toml
				"xmlformatter", -- xml
				-- linters
				"luacheck", -- lua
				"markdownlint", -- markdown
				"eslint-lsp", -- js, ts
				-- linter + formatter
				"ruff", -- python
				-- misc
				"codespell", -- spellings linter
			},
		},
	},
}

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
				"bashls", -- bash
				"neocmake", -- cmake
				"gopls", -- go
				"lua_ls", -- lua
				"pyright", -- python
				"ts_ls", -- ts, tsx
				"zls", -- zig
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"williamboman/mason.nvim",
		},
		lazy = true,
		opts = {
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
		},
	},
}

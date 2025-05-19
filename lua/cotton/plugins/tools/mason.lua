return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason" },
		opts = {
			ui = {
				border = "rounded",
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
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"neocmake", -- cmake
				"lua_ls", -- lua
				"basedpyright", -- python
				"ts_ls", -- ts, tsx
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
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
				"tex-fmt", -- tex, bib, cls, sty
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

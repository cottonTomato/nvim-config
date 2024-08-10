-- TODO: iron out details about rust, cpp, zig
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
					"clangd", -- c cpp
					"gopls", -- go
					"lua_ls", -- lua
					"tsserver", -- ts, tsx
					"zls", -- zig
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"shfmt", -- bash formatting
					"clang-format", -- c cpp formatting
					"goimports", -- go formatting
					"golangci-lint", -- go linting
					"stylua", -- lua formatting
					"luacheck", -- lua linting
					"prettier", -- js, ts formatting
					"taplo", -- toml formatting
					"codespell", -- spellings autocorrect
					"biome", -- js, ts linting
				},
				integrations = {
					["mason-nvim-dap"] = true,
				},
			})

			-- keymap
			vim.keymap.set("n", "<leader>tm", ":Mason<CR>", { desc = "Open Mason", silent = true })
		end,
	},
}

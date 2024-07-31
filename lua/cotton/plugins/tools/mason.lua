-- TODO: iron out details about rust, python, cpp, zig
return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
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
					"bashls",
					"clangd",
					"gopls",
					"lua_ls",
					"pyright",
					"rust_analyzer",
					"tsserver",
					"zls",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"shfmt",
					"clang-format",
					"goimports",
					"stylua",
					"black",
					"rustfmt",
					"prettier",
					"taplo",
					"codespell",
					-- "biome",
					-- "golangci-lint",
					-- "shellcheck",
					-- "luacheck",
				},
			})

			-- keymap
			vim.keymap.set("n", "<leader>tm", ":Mason<CR>", { desc = "Open Mason", silent = true })
		end,
	},
}

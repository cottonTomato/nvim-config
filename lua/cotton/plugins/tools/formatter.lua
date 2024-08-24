return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					bash = { "shfmt" },
					c = { "clang-format" },
					cmake = { "gersemi" },
					cpp = { "clang-format" },
					fish = { "fish_indent" },
					go = { "goimports" },
					html = { "prettier" },
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					json = { "prettier" },
					just = { "just" },
					lua = { "stylua" },
					markdown = { "mdformat" },
					proto = { "buf" },
					python = { "ruff_format", "ruff_organize_imports" },
					rust = { "rustfmt" },
					sql = { "sql_formatter" },
					toml = { "taplo" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					xml = { "xmlformat" },
					yaml = { "prettier" },
					zig = { "zigfmt" },
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 500,
				},
			})

			-- keymap
			vim.keymap.set({ "n", "x" }, "<leader>lf", function()
				conform.format({
					lsp_format = "fallback",
					timeout_ms = 500,
				})
			end, {
				desc = "Format buffer",
				silent = true,
			})
		end,
	},
}

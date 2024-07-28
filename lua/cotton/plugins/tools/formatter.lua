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
					cpp = { "clang-format" },
					go = { "goimports" },
					lua = { "stylua" },
					python = { "black" },
					rust = { "rustfmt" },
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					-- zig = { "zigfmt" },
					json = { "prettier" },
					toml = { "taplo" },
					yaml = { "prettier" },
					["*"] = { "codespell" },
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

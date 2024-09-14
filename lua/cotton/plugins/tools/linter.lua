return {
	{
		"mfussenegger/nvim-lint",
		dependencies = "WhoIsSethDaniel/mason-tool-installer.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local linter = require("lint")

			linter.linter_by_ft = {
				bash = { "shellcheck" },
				go = { "golangcilint" },
				javascript = { "biomejs" },
				javascriptreact = { "biomejs" },
				lua = { "luacheck" },
				markdown = { "markdownlint" },
				proto = { "buf_lint" },
				python = { "ruff" },
				sql = { "sqlfluff" },
				typescript = { "biomejs" },
				typescriptreact = { "biomejs" },
			}

			vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
				group = vim.api.nvim_create_augroup("lint", { clear = true }),
				callback = function()
					linter.try_lint(nil, { ignore_errors = true })
					linter.try_lint("codespell")
				end,
				desc = "Linting",
			})

			-- keymap
			vim.keymap.set("n", "<leader>ll", linter.try_lint, { desc = "Lint buffer", silent = true })
		end,
	},
}

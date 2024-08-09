return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local linter = require("lint")

			linter.linter_by_ft = {
				-- c = { "clang-tidy" },
				-- cpp = { "clang-tidy" },
				go = { "golangcilint" },
				lua = { "luacheck" },
				-- rust = { "clippy" },
				javascript = { "biomejs" },
				typescript = { "biomejs" },
				javascriptreact = { "biomejs" },
				typescriptreact = { "biomejs" },
				-- no nice linter for zig
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					linter.try_lint()
				end,
			})

			-- keymap
			vim.keymap.set("n", "<leader>ll", linter.try_lint, { desc = "Lint file", silent = true })
		end,
	},
}

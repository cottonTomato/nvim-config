return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre" },
		config = function()
			local linter = require("lint")

			linter.linters_by_ft = {
				fish = { "fish" },
				javascript = { "eslint" },
				javascriptreact = { "eslint" },
				lua = { "luacheck" },
				markdown = { "markdownlint" },
				python = { "ruff" },
				tex = { "lacheck" },
				typescript = { "eslint" },
				typescriptreact = { "eslint" },
			}

			local linting_callback = function()
				require("lint").try_lint()
				require("lint").try_lint("codespell")
			end

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = linting_callback,
				desc = "Linting",
			})
			vim.keymap.set("n", "<leader>ll", linting_callback, {
				desc = "Lint buffer",
				silent = true,
			})
		end,
	},
}

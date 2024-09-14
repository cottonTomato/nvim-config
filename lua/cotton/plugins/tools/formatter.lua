return {
	{
		"stevearc/conform.nvim",
		dependencies = "WhoIsSethDaniel/mason-tool-installer.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>lf",
				function()
					require("conform").format({ lsp_format = "fallback", timeout_ms = 500 })
				end,
				mode = "n",
				desc = "Format buffer",
				silent = true,
			},
		},
		opts = {
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
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}

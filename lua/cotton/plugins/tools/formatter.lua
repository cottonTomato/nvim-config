return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>lf",
				function()
					require("conform").format({ lsp_fallback = true, async = true })
				end,
				mode = "n",
				desc = "Format buffer",
				silent = true,
			},
		},
		opts = {
			formatters_by_ft = {
				bash = { "shfmt" },
				bib = { "tex-fmt" },
				c = { "clang-format" },
				cls = { "tex-fmt" },
				cmake = { "gersemi" },
				cpp = { "clang-format" },
				fish = { "fish_indent" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				just = { "just" },
				lua = { "stylua" },
				markdown = { "mdformat" },
				python = { "ruff_format", "ruff_organize_imports" },
				rust = { "rustfmt" },
				sql = { "sql_formatter" },
				sty = { "tex-fmt" },
				tex = { "tex-fmt" },
				toml = { "taplo" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				xml = { "xmlformatter" },
				yaml = { "prettier" },
			},
			format_after_save = {
				lsp_format = "fallback",
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}

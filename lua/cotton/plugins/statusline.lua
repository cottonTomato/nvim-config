return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/lsp-progress.nvim",
		},
		event = "VeryLazy",
		config = function()
			local lsp_progress = require("lsp-progress")
			lsp_progress.setup({})

			require("lualine").setup({
				options = {
					globalstatus = true,
					icons_enabled = false,
				},
				sections = {
					lualine_c = {
						"filename",
						function()
							return lsp_progress.progress()
						end,
					},
					lualine_x = {
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
						},
						{ "encoding" },
						{ "fileformat" },
						{ "filetype" },
					},
				},
				extensions = {
					"lazy",
					"nvim-tree",
				},
			})

			vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				group = "lualine_augroup",
				pattern = "LspProgressStatusUpdated",
				callback = require("lualine").refresh,
			})
		end,
	},
}

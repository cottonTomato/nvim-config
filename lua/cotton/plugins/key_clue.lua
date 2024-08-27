return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			preset = "modern",
			icons = {
				breadcrumb = ">",
				separator = " ",
				mappings = false,
			},
			win = {
				border = "single",
			},
		},
	},
}

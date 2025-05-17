-- TODO: fix this shi, i.e. do smtn with is!!
return {
	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		opts = {},
		keys = {
			{
				"<leader><leader>q",
				"<cmd>lua require('quicker').toggle()<cr>",
				mode = "n",
				desc = "Open quickfixlist",
				silent = true,
			},
		},
	},
}

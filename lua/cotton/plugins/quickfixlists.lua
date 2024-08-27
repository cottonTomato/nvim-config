return {
	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		opts = {},
		keys = {
			{
				"gq",
				"<cmd>lua require('quicker').toggle()<cr>",
				mode = "n",
				desc = "Open quickfixlist",
				silent = true,
			},
			{
				"gl",
				"<cmd>lua require('quicker').toggle({ loclist = true })<cr>",
				mode = "n",
				desc = "Open loclist",
				silent = true,
			},
		},
	},
}

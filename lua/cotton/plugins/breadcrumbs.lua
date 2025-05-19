return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lsp = { auto_attach = true },
			window = {
				border = "rounded",
				sections = {
					left = {
						size = "20%",
					},
					mid = {
						size = "30%",
					},
				},
			},
			node_markers = {
				enabled = true,
				icons = {
					leaf = "  ",
					leaf_selected = "→ ",
					branch = " ",
				},
			},
		},
		keys = {
			{
				"<leader>bx",
				"<cmd>Navbuddy<cr>",
				"n",
				desc = "Buffer outline navigation",
				silent = true,
			},
		},
	},
}

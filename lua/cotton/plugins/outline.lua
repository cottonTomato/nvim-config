return {
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				"SmiteshP/nvim-navic",
				"MunifTanjim/nui.nvim",
			},
		},
		opts = { lsp = { auto_attach = true } },
		keys = {
			{
				"<leader>eo",
				"<cmd>lua require('nvim-navbuddy').open()<cr>",
				mode = "n",
				desc = "Explore outline",
				silent = true,
			},
		},
	},
}

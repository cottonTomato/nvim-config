-- TODO: swtich back to oil
return {
	{
		"echasnovski/mini.files",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				use_as_default_explorer = false,
			},
		},
		keys = {
			{
				"<leader><leader>f",
				"<cmd>lua require('mini.files').open()<cr>",
				mode = "n",
				desc = "Explore file system",
				silent = true,
			},
		},
	},
}

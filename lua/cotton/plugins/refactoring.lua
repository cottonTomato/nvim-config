return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			prompt_func_return_type = {
				go = true,
				cpp = true,
				c = true,
				h = true,
				hpp = true,
				cxx = true,
			},
			prompt_func_param_type = {
				go = true,
				cpp = true,
				c = true,
				h = true,
				hpp = true,
				cxx = true,
			},
		},
		keys = {
			{
				"<leader>re",
				"<cmd>Refactor extract<cr>",
				mode = "x",
				desc = "Extract",
				silent = true,
			},
			{
				"<leader>rE",
				"<cmd>Refactor extract_to_file<cr>",
				mode = "x",
				desc = "Extract to file",
				silent = true,
			},
			{
				"<leader>rv",
				"<cmd>Refactor extract_var<cr>",
				mode = "x",
				desc = "Extract variable",
				silent = true,
			},
			{
				"<leader>ri",
				"<cmd>Refactor inline_var<cr>",
				mode = { "n", "x" },
				desc = "Inline variable",
				silent = true,
			},
			{
				"<leader>rI",
				"<cmd>Refactor inline_func<cr>",
				mode = "n",
				desc = "Inline function",
				silent = true,
			},
			{
				"<leader>rb",
				"<cmd>Refactor extract_block<cr>",
				mode = "n",
				desc = "Extract block",
				silent = true,
			},
			{
				"<leader>rB",
				"<cmd>Refactor extract_block_to_file",
				mode = "n",
				desc = "Extract block to file",
				silent = true,
			},
			{
				"<leader>rr",
				"<cmd>lua require('refactoring').select_refactor()<cr>",
				mode = { "n", "x" },
				desc = "Open refactoring menu",
				silent = true,
			},
		},
	},
	{
		"cshuaimin/ssr.nvim",
		opts = {
			border = "single",
		},
		keys = {
			{
				"<leader>rs",
				"<cmd>lua require('ssr').open()<cr>",
				mode = { "n", "x" },
				desc = "Structured search & replace",
				silent = true,
			},
		},
	},
}

return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
		event = "VeryLazy",
		cmd = "Trouble",
		opts = {
			focus = true,
			warn_no_results = false,
			keys = {
				["<cr>"] = "jump_close",
				o = "jump",
			},
			win = {
				size = {
					height = 15,
				},
			},
		},
		keys = {
			{
				"<leader>xt",
				"<cmd>Trouble todo toggle<CR>",
				mode = "n",
				desc = "Explore workspace todos",
				silent = true,
			},
			{
				"<leader>xd",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				mode = "n",
				desc = "Explore buffer diagnostics",
				silent = true,
			},
			{
				"<leader>xD",
				"<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<CR>",
				mode = "n",
				desc = "Explore workspace diagnostics",
				silent = true,
			},
			{ "gD", "<cmd>Trouble lsp_declarations toggle<CR>", mode = "n", desc = "Go to declaration", silent = true },
			{ "gd", "<cmd>Trouble lsp_definitions toggle<CR>", mode = "n", desc = "Go to definition", silent = true },
			{
				"gT",
				"<cmd>Trouble lsp_type_definitions toggle<CR>",
				mode = "n",
				desc = "Go to type definition",
				silent = true,
			},
			{
				"<leader>xi",
				"<cmd>Trouble lsp_implementations toggle<CR>",
				mode = "n",
				desc = "Explore implementations",
				silent = true,
			},
			{
				"<leader>xr",
				"<cmd>Trouble lsp_references toggle<CR>",
				mode = "n",
				desc = "Explore references",
				silent = true,
			},
			{
				"<leader>xc",
				"<cmd>Trouble lsp_incoming_calls toggle<CR>",
				mode = "n",
				desc = "Explore incoming calls",
				silent = true,
			},
			{
				"<leader>xC",
				"<cmd>Trouble lsp_outgoing_calls toggle<CR>",
				mode = "n",
				desc = "Explore outgoing calls",
				silent = true,
			},
			{
				"<leader>xs",
				"<cmd>Trouble telescope toggle<CR>",
				mode = "n",
				desc = "Explore telescope",
				silent = true,
			},
		},
	},
}

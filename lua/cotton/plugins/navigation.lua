return {
	{
		"mrjones2014/smart-splits.nvim",
		opts = {},
		keys = {
			{
				"<M-h>",
				"<cmd>lua require('smart-splits').move_cursor_left()<cr>",
				"n",
				desc = "Focus window right",
				silent = true,
			},
			{
				"<M-l>",
				"<cmd>lua require('smart-splits').move_cursor_right()<cr>",
				"n",
				desc = "Focus window left",
				silent = true,
			},
			{
				"<M-j>",
				"<cmd>lua require('smart-splits').move_cursor_down()<cr>",
				"n",
				desc = "Focus window down",
				silent = true,
			},
			{
				"<M-k>",
				"<cmd>lua require('smart-splits').move_cursor_up()<cr>",
				"n",
				desc = "Focus window up",
				silent = true,
			},
			{
				"<M-S-h>",
				"<cmd>lua require('smart-splits').resize_left()<cr>",
				"n",
				desc = "Resize split right",
				silent = true,
			},
			{
				"<M-S-l>",
				"<cmd>lua require('smart-splits').resize_right()<cr>",
				"n",
				desc = "Resize split left",
				silent = true,
			},
			{
				"<M-S-j>",
				"<cmd>lua require('smart-splits').resize_down()<cr>",
				"n",
				desc = "Resize split down",
				silent = true,
			},
			{
				"<M-S-k>",
				"<cmd>lua require('smart-splits').resize_up()<cr>",
				"n",
				desc = "Move cursor up",
				silent = true,
			},
		},
	},
	{
		"chrisgrieser/nvim-spider",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			skipInsignificantPunctuation = false,
		},
		keys = {
			{
				"w",
				"<cmd>lua require('spider').motion('w')<CR>",
				mode = { "n", "o", "x" },
				desc = "Spider-w",
				silent = true,
			},
			{
				"e",
				"<cmd>lua require('spider').motion('e')<CR>",
				mode = { "n", "o", "x" },
				desc = "Spider-e",
				silent = true,
			},
			{
				"b",
				"<cmd>lua require('spider').motion('b')<CR>",
				mode = { "n", "o", "x" },
				desc = "Spider-b",
				silent = true,
			},
		},
	},
	{
		"echasnovski/mini.jump2d",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			silent = false,
			mappings = {
				start_jumping = "gt",
			},
			allowed_lines = {
				cursor_at = false,
			},
		},
	},
	{
		"otavioschwanck/arrow.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			show_icons = true,
			hide_handbook = false,
			leader_key = "<cr>",
			mappings = {
				toggle = " ",
				open_horizontal = "s",
			},
			index_keys = "fjdksla;cmrueiwoqp",
		},
	},
}

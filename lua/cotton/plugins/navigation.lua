return {
	{
		"numToStr/Navigator.nvim",
		opts = {
			disable_on_zoom = true,
			mux = "auto",
		},
		keys = {
			{
				"<A-h>",
				"<CMD>NavigatorLeft<CR>",
				mode = { "n", "t" },
				desc = "Navigate Left",
				silent = true,
			},
			{
				"<A-l>",
				"<CMD>NavigatorRight<CR>",
				mode = { "n", "t" },
				desc = "Navigate Right",
				silent = true,
			},
			{
				"<A-k>",
				"<CMD>NavigatorUp<CR>",
				mode = { "n", "t" },
				desc = "Navigate Up",
				silent = true,
			},
			{
				"<A-j>",
				"<CMD>NavigatorDown<CR>",
				mode = { "n", "t" },
				desc = "Navigate Down",
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
		version = "*",
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

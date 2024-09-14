return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		opts = function()
			return {
				toggler = {
					block = "gbb",
				},
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
	},
	{
		"gbprod/substitute.nvim",
		dependencies = { "gbprod/yanky.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return {
				on_substitute = require("yanky.integration").substitute(),
			}
		end,
		keys = {
			{
				"gs",
				function()
					require("substitute").operator()
				end,
				mode = "n",
				desc = "Substitute",
				silent = true,
			},
			{
				"gss",
				function()
					require("substitute").line()
				end,
				mode = "n",
				desc = "Substitute line",
				silent = true,
			},
			{
				"gS",
				function()
					require("substitute").eol()
				end,
				mode = "n",
				desc = "Substitute to EOL",
				silent = true,
			},
			{
				"gs",
				function()
					require("substitute").visual()
				end,
				mode = "x",
				desc = "Substitute",
				silent = true,
			},
			{
				"gx",
				function()
					require("substitute.exchange").operator()
				end,
				mode = "n",
				desc = "Exchange",
				silent = true,
			},
			{
				"gxx",
				function()
					require("substitute.exchange").line()
				end,
				mode = "n",
				desc = "Exchange line",
				silent = true,
			},
			{
				"gxc",
				function()
					require("substitute.exchange").cancel()
				end,
				mode = "n",
				desc = "Substitute cancel",
				silent = true,
			},
			{
				"gx",
				function()
					require("substitute.exchange").visual()
				end,
				mode = "x",
				desc = "Substitute",
				silent = true,
			},
		},
	},
	{
		"gbprod/yanky.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		keys = {
			{
				"p",
				"<Plug>(YankyPutAfter)",
				mode = { "n", "x" },
				desc = "Paste after",
				silent = true,
			},
			{
				"P",
				"<Plug>(YankyPutBefore)",
				mode = { "n", "x" },
				desc = "Paste before",
				silent = true,
			},
			{
				"]P",
				"<Plug>(YankyPutIndentAfterLinewise)",
				mode = { "n", "x" },
				desc = "Paste after linewise",
				silent = true,
			},
			{
				"[P",
				"<Plug>(YankyPutIndentBeforeLinewise)",
				mode = { "n", "x" },
				desc = "Previous entry in kill ring",
				silent = true,
			},
			{
				"<C-p>",
				"<Plug>(YankyPreviousEntry)",
				mode = "n",
				desc = "Paste after",
				silent = true,
			},
			{
				"<C-n>",
				"<Plug>(YankyNextEntry)",
				mode = "n",
				desc = "Next entry in Kill ring",
				silent = true,
			},
		},
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			useDefaultKeymaps = true,
			disabledKeymaps = {
				"r",
				"im",
				"am",
				"il",
				"al",
				"ie",
				"ae",
				"iC",
				"aC",
				"ic",
				"ac",
				"i#",
				"a#",
				"ix",
				"ax",
				"iD",
				"aD",
				"iP",
				"aP",
				"iy",
				"ay",
				"iN",
				"aN",
			},
			notifyNotFound = false,
		},
		keys = {
			{
				"iM",
				"<cmd>lua require('various-textobjs').chainMember('inner')<cr>",
				mode = { "o", "x" },
				desc = "inner method chain",
				silent = true,
			},
			{
				"aM",
				"<cmd>lua require('various-textobjs').chainMember('outer')<cr>",
				mode = { "o", "x" },
				desc = "outer method chain",
				silent = true,
			},
		},
	},
	{
		"echasnovski/mini.surround",
		event = { "BufReadPre", "BufNewFile" },
		version = "*",
		opts = {
			mappings = {
				add = "s",
				delete = "ds",
				replace = "cs",
				find = "",
				find_left = "",
				highlight = "",
				update_n_lines = "",
				suffix_last = "",
				suffix_next = "",
			},
			respect_selection_type = true,
			silent = true,
		},
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"echasnovski/mini.move",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			mappings = {
				left = "<C-h>",
				right = "<C-l>",
				down = "<C-j>",
				up = "<C-k>",
				line_left = "<C-h>",
				line_right = "<C-l>",
				line_down = "<C-j>",
				line_up = "<C-k>",
			},
		},
	},
	{
		"echasnovski/mini.align",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}

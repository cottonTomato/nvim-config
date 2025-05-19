return {
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return {
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
				"gp",
				"<Plug>(YankyPutIndentAfterLinewise)",
				mode = { "n", "x" },
				desc = "Paste after linewise",
				silent = true,
			},
			{
				"gP",
				"<Plug>(YankyPutIndentBeforeLinewise)",
				mode = { "n", "x" },
				desc = "Paste before linewise",
				silent = true,
			},
			{
				"<C-p>",
				"<Plug>(YankyPreviousEntry)",
				mode = "n",
				desc = "Previous entry in kill ring",
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
			keymaps = {
				useDefaults = false,
			},
		},
		keys = {
			{
				"ai",
				"<cmd>lua require('various-textobjs').indentation('outer')<cr>",
				mode = { "o", "x" },
				desc = "outer indentation level",
				silent = true,
			},
			{
				"ii",
				"<cmd>lua require('various-textobjs').indentation('inner')<cr>",
				mode = { "o", "x" },
				desc = "inner indentation level",
				silent = true,
			},

			{
				"R",
				"<cmd>lua require('various-textobjs').restOfIndentation()<cr>",
				mode = { "o", "x" },
				desc = "rest of indentation",
				silent = true,
			},

			{
				"aS",
				"<cmd>lua require('various-textobjs').subword('outer')<cr>",
				mode = { "o", "x" },
				desc = "outer subword",
				silent = true,
			},
			{
				"iS",
				"<cmd>lua require('various-textobjs').subword('inner')<cr>",
				mode = { "o", "x" },
				desc = "inner subword",
				silent = true,
			},

			{
				"C",
				"<cmd>lua require('various-textobjs').toNextClosingBracket()<cr>",
				mode = { "o", "x" },
				desc = "to next closing bracket",
				silent = true,
			},

			{
				"Q",
				"<cmd>lua require('various-textobjs').toNextQuotationMark()<cr>",
				mode = { "o", "x" },
				desc = "to next quotation mark",
				silent = true,
			},

			{
				"aq",
				"<cmd>lua require('various-textobjs').anyQuote('outer')<cr>",
				mode = { "o", "x" },
				desc = "outer quote",
				silent = true,
			},
			{
				"iq",
				"<cmd>lua require('various-textobjs').anyQuote('inner')<cr>",
				mode = { "o", "x" },
				desc = "inner quote",
				silent = true,
			},

			{
				"ab",
				"<cmd>lua require('various-textobjs').anyBracket('outer')<cr>",
				mode = { "o", "x" },
				desc = "outer bracket/braces",
				silent = true,
			},
			{
				"ib",
				"<cmd>lua require('various-textobjs').anyBracket('inner')<cr>",
				mode = { "o", "x" },
				desc = "inner bracket/braces",
				silent = true,
			},

			{
				"gG",
				"<cmd>lua require('various-textobjs').entireBuffer()<cr>",
				mode = { "o", "x" },
				desc = "entire buffer",
				silent = true,
			},

			{
				"n",
				"<cmd>lua require('various-textobjs').nearEoL()<cr>",
				mode = { "o", "x" },
				desc = "to EoL",
				silent = true,
			},

			{
				"L",
				"<cmd>lua require('various-textobjs').url()<cr>",
				mode = { "o", "x" },
				desc = "url",
				silent = true,
			},

			{
				"!",
				"<cmd>lua require('various-textobjs').diagnostic()<cr>",
				mode = { "o", "x" },
				desc = "diagnostic",
				silent = true,
			},

			{
				"aM",
				"<cmd>lua require('various-textobjs').chainMember('outer')<cr>",
				mode = { "o", "x" },
				desc = "outer method chain",
				silent = true,
			},
			{
				"iM",
				"<cmd>lua require('various-textobjs').chainMember('inner')<cr>",
				mode = { "o", "x" },
				desc = "inner method chain",
				silent = true,
			},

			{
				"aF",
				"<cmd>lua require('various-textobjs').filepath('outer')<cr>",
				mode = { "o", "x" },
				desc = "filepath",
				silent = true,
			},
			{
				"iF",
				"<cmd>lua require('various-textobjs').filepath('inner')<cr>",
				mode = { "o", "x" },
				desc = "filename",
				silent = true,
			},
		},
	},
	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			keymaps = {
				insert = false,
				insert_line = false,
				normal = false,
				normal_cur = false,
				normal_line = false,
				normal_cur_line = false,
				visual = false,
				visual_line = false,
				delete = false,
				change = false,
				change_line = false,
			},
			move_cursor = "sticky",
		},
		keys = {
			{
				"s",
				"Plug(nvim-surround-normal)",
				mode = "n",
				desc = "Surround",
				silent = true,
			},
			{
				"ss",
				"Plug(nvim-surround-normal-cur)",
				mode = "n",
				desc = "Surround line",
				silent = true,
			},
			{
				"s",
				"Plug(nvim-surround-visual)",
				mode = "x",
				desc = "Surround",
				silent = true,
			},
			{
				"ds",
				"Plug(nvim-surround-delete)",
				mode = "n",
				desc = "Surround delete",
				silent = true,
			},
			{
				"cs",
				"Plug(nvim-surround-change)",
				mode = "n",
				desc = "Surround change",
				silent = true,
			},
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
				left = "<C-S-h>",
				right = "<C-S-l>",
				down = "<C-S-j>",
				up = "<C-S-k>",
				line_left = "<C-S-h>",
				line_right = "<C-S-l>",
				line_down = "<C-S-j>",
				line_up = "<C-S-k>",
			},
		},
	},
}

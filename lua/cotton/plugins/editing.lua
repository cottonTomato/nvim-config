return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			local comment = require("Comment")
			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

			---@diagnostic disable-next-line: missing-fields
			comment.setup({
				---@diagnostic disable-next-line: missing-fields
				toggler = {
					block = "gbb",
				},
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	},
	{
		"gbprod/substitute.nvim",
		dependencies = { "gbprod/yanky.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local substitute = require("substitute")
			local exchange = require("substitute.exchange")

			substitute.setup({
				on_substitute = require("yanky.integration").substitute(),
			})

			-- keymap
			local keymap = vim.keymap

			keymap.set("n", "gs", substitute.operator, { desc = "Substitute", silent = true })
			keymap.set("n", "gss", substitute.line, { desc = "Substitute line", silent = true })
			keymap.set("n", "gS", substitute.eol, { desc = "Substitute to EOL", silent = true })
			keymap.set("x", "gs", substitute.visual, { desc = "Substitute", silent = true })

			keymap.set("n", "gx", exchange.operator, { desc = "Exchange", silent = true })
			keymap.set("n", "gxx", exchange.line, { desc = "Exchange line", silent = true })
			keymap.set("n", "gxc", exchange.cancel, { desc = "Exchange cancel", silent = true })
			keymap.set("x", "gx", exchange.visual, { desc = "Exchange", silent = true })
		end,
	},
	{
		"gbprod/yanky.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("yanky").setup()

			-- keymap
			local keymap = vim.keymap

			keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "Paste after", silent = true })
			keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "Paste before", silent = true })
			keymap.set(
				"n",
				"<C-p>",
				"<Plug>(YankyPreviousEntry)",
				{ desc = "Previous entry in kill ring", silent = true }
			)
			keymap.set("n", "<C-n>", "<Plug>(YankyNextEntry)", { desc = "Next entry in Kill ring", silent = true })
		end,
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local textobjs = require("various-textobjs")

			textobjs.setup({
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
			})

			-- keymap

			vim.keymap.set({ "o", "x" }, "iM", function()
				textobjs.chainMember("inner")
			end, { desc = "inner method chain" })
			vim.keymap.set({ "o", "x" }, "aM", function()
				textobjs.chainMember("outer")
			end, { desc = "outer method chain" })
		end,
	},
	{
		"echasnovski/mini.surround",
		event = { "BufReadPre", "BufNewFile" },
		version = "*",
		opts = {
			mappings = {
				replace = "sc",
				suffix_last = "p",
			},
			respect_selection_type = true,
			silent = true,
		},
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
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
		opts = {
			mappings = {
				start = "gq",
				start_with_preview = "gw",
			},
		},
	},
}

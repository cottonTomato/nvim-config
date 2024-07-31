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
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	},
	{
		"chrisgrieser/nvim-spider",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local spider = require("spider")

			-- keymap
			local keymap = vim.keymap
			keymap.set({ "n", "o", "x" }, "w", function()
				spider.motion("w")
			end, { desc = "Spider-w" })
			keymap.set({ "n", "o", "x" }, "e", function()
				spider.motion("e")
			end, { desc = "Spider-e" })
			keymap.set({ "n", "o", "x" }, "b", function()
				spider.motion("b")
			end, { desc = "Spider-b" })
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

			keymap.set("n", "s", substitute.operator, { desc = "Substitute", silent = true })
			keymap.set("n", "ss", substitute.line, { desc = "Substitute line", silent = true })
			keymap.set("n", "S", substitute.eol, { desc = "Substitute to EOL", silent = true })
			keymap.set("x", "s", substitute.visual, { desc = "Substitute", silent = true })

			keymap.set("n", "sx", exchange.operator, { desc = "Exchange", silent = true })
			keymap.set("n", "sxx", exchange.line, { desc = "Exchange line", silent = true })
			keymap.set("x", "X", exchange.visual, { desc = "Exchange", silent = true })
			keymap.set("n", "sxc", exchange.cancel, { desc = "Exchange cancel", silent = true })
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
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		version = "*",
		opts = {
			keymaps = {
				insert = "<C-g>s",
				insert_line = "<C-g>S",
				normal = "gs",
				normal_cur = "gss",
				normal_line = "gS",
				normal_cur_line = "gSS",
				visual = "gs",
				visual_line = "gS",
				delete = "ds",
				change = "cs",
				change_line = "cS",
			},
			move_cursor = "sticky",
		},
	},
}

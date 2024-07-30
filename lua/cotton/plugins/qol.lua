return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local todo_comments = require("todo-comments")
			todo_comments.setup()

			-- keymap
			local keymap = vim.keymap
			keymap.set("n", "[t", function()
				todo_comments.jump_prev()
			end, { desc = "Previous todo comment", silent = true })
			keymap.set("n", "]t", function()
				todo_comments.jump_next()
			end, { desc = "Next todo comment", silent = true })
		end,
	},
	-- TODO: style this
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			icons = {
				separator = " ",
				mappings = false,
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"echasnovski/mini.bufremove",
		version = "*",
		config = function()
			local bufremove = require("mini.bufremove")
			bufremove.setup({})

			-- keymap
			local keymap = vim.keymap

			keymap.set("n", "<leader>bc", function()
				bufremove.delete(0, false)
			end, { desc = "Close buffer", silent = true })
			keymap.set("n", "<leader>bq", function()
				bufremove.delete(0, true)
			end, { desc = "Force close buffer", silent = true })
		end,
	},
}

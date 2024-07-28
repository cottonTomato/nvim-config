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
	-- TODO: try this
	-- {
	--   "folke/edgy.nvim",
	--   event = "VeryLazy",
	--   opts = {}
	-- },
	-- TODO: try this
	-- {
	--   "nvim-focus/focus.nvim",
	--   version = "*",
	--   keys = {
	--     { "<leader>wm", ":FocusToggle", desc = "Toggle Focus Mode" }
	--   }
	-- },
}

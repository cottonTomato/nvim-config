return {
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup({
				disable_on_zoom = true,
				mux = "auto",
			})

			-- keymap
			local keymap = vim.keymap

			keymap.set({ "n", "t" }, "<A-h>", "<CMD>NavigatorLeft<CR>", { desc = "Navigate Left", silent = true })
			keymap.set({ "n", "t" }, "<A-l>", "<CMD>NavigatorRight<CR>", { desc = "Navigate Right", silent = true })
			keymap.set({ "n", "t" }, "<A-k>", "<CMD>NavigatorUp<CR>", { desc = "Navigate Up", silent = true })
			keymap.set({ "n", "t" }, "<A-j>", "<CMD>NavigatorDown<CR>", { desc = "Navigate Down", silent = true })
		end,
	},
	{
		"chrisgrieser/nvim-spider",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local spider = require("spider")

			spider.setup({
				skipInsignificantPunctuation = false,
			})

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
		"echasnovski/mini.jump2d",
		version = "*",
		config = function()
			local jump2d = require("mini.jump2d")
			jump2d.setup({
				silent = false,
				mappings = {
					start_jumping = "",
				},
			})

			-- keymap
			vim.keymap.set({ "n", "x" }, "z<cr>", function()
				jump2d.start(jump2d.builtin_opts.word_start)
			end, { desc = "Start word jump" })
		end,
	},
}

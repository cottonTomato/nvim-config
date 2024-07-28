return {
	{
		"romgrk/barbar.nvim",
		version = "^1.0.0",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		config = function()
			require("barbar").setup({
				auto_hide = 0,
				clickable = false,
				tabpages = false,
				icons = {
					button = false,
					diagnostics = {
						[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "E:" },
						[vim.diagnostic.severity.WARN] = { enabled = true, icon = "W:" },
					},
					modified = { button = "[+]" },
				},
				no_name_title = "[No Name]",
				letters = "fjdksla;cmrueiwoqp",
				semantic_letters = false,
			})

			-- keymap
			local keymap = vim.keymap

			keymap.set("n", "gp", ":BufferPrevious<CR>", { desc = "Go to previous buffer", silent = true })
			keymap.set("n", "gn", ":BufferNext<CR>", { desc = "Go to next buffer", silent = true })
			keymap.set("n", "gj", ":BufferPick<CR>", { desc = "Jump to buffer", silent = true })
			keymap.set("n", "<leader>bc", ":BufferClose<CR>", { desc = "Close current buffer", silent = true })
			keymap.set("n", "<leader>bd", ":BufferPickDelete<CR>", { desc = "Pick & close buffers", silent = true })
			keymap.set("n", "<leader>br", ":BufferRestore<CR>", { desc = "Restore last closed buffer", silent = true })
			keymap.set("n", "<leader>bp", ":BufferPin<CR>", { desc = "Pin current buffer", silent = true })
			keymap.set(
				"n",
				"<leader>ba",
				":BufferCloseAllButCurrentOrPinned<CR>",
				{ desc = "Close all buffer but current & pinned", silent = true }
			)
			keymap.set(
				"n",
				"<leader>bh",
				":BufferMovePrevious<CR>",
				{ desc = "Exchange with previous buffer", silent = true }
			)
			keymap.set("n", "<leader>bl", ":BufferMoveNext<CR>", { desc = "Exchange with next buffer", silent = true })
			keymap.set(
				"n",
				"<leader>bb",
				":BufferOrderByDirectory<CR>",
				{ desc = "Order buffers by folder/directory", silent = true }
			)
		end,
	},
}

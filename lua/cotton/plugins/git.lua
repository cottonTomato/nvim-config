return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"kdheepak/lazygit.nvim",
				dependencies = {
					"nvim-lua/plenary.nvim",
				},
				init = function()
					vim.g.lazygit_floating_window_border_chars =
						{ "┌", "─", "┐", "│", "┘", "─", "└", "│" }
				end,
			},
		},
		opts = {
			trouble = false,
			attach_to_untracked = true,
			on_attach = function(bufnr)
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
				end
				local gs = require("gitsigns")

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next hunk")
				map("n", "[h", gs.prev_hunk, "Prev hunk")

				-- Actions
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

				map("n", "<leader>hb", "<cmd>Gitsings blame_line<cr>", "Blame line")
				map("n", "<leader>hB", "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle line blame")

				map("n", "<leader>hd", "<cmd>Gitsigns diffthis<cr>", "Diff buffer against HEAD")
				map("n", "<leader>hD", "<cmd>Gitsings diffthis ~1<cr>", "Diff buffer against last commit")

				-- LazyGit
				map("n", "<leader><leader>g", "<cmd>LazyGit<cr>", "Open LazyGit")
			end,
		},
	},
}

return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			trouble = false,
			on_attach = function(bufnr)
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
				end
				local gs = require("gitsigns")

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")

				map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

				map("n", "<leader>hd", gs.diffthis, "Diff buffer against HEAD")
				map("n", "<leader>hD", function()
					gs.diffthis("~1")
				end, "Diff buffer against last commit")

				-- Text object
				map({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
			end,
		},
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.lazygit_floating_window_border_chars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }

			local path = vim.uv.cwd() .. "/.git"
			local ok, err = vim.uv.fs_stat(path)
			if ok then
				vim.keymap.set("n", "<leader>g", "<cmd>LazyGit<CR>", { desc = "Open LazyGit", silent = true })
			end
		end,
	},
}

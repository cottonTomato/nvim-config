return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			attach_to_untracked = true,
			on_attach = function(bufnr)
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
				end
				local gs = require("gitsigns")

				-- Navigation
				map("n", "]h", function()
					gs.nav_hunk("next")
				end, "Next hunk")
				map("n", "[h", function()
					gs.nav_hunk("prev")
				end, "Prev hunk")

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")

				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Show line blame")

				map("n", "<leader>hd", gs.diffthis, "Diff buffer against HEAD")
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, "Diff buffer against last commit")

				map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle line blame")
				map("n", "<leader>tw", gs.toggle_word_diff, "Toggle word diff")

				map("n", "<leader>hQ", function()
					gs.setqflist("all", { open = false })
				end, "Add hunks to qflist")
				map("n", "<leader>hq", function()
					gs.setqflist(nil, { open = false })
				end, "Add buffer hunks to qflist")

				map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
			end,
		},
	},
}

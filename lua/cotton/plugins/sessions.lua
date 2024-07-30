return {
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				auto_restore_enabled = false,
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "~/Library", "!~/" },
				auto_session_create_enabled = function()
					local cmd = "git rev-parse --is-inside-work-tree"
					return vim.fn.system(cmd) == "true\n"
				end,
				pre_save_cmds = {
					function()
						vim.api.nvim_exec_autocmds("User", { pattern = "SessionPreSave" })
					end,
				},
			})

			-- keymap
			local keymap = vim.keymap

			keymap.set(
				"n",
				"<leader>ss",
				":SessionSave<CR>",
				{ desc = "Save session for auto session root dir", silent = true }
			)
			keymap.set("n", "<leader>sr", ":SessionRestore<CR>", { desc = "Restore session for cwd", silent = true })
		end,
	},
}

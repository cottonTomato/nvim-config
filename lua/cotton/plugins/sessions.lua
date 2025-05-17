return {
	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
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
			session_lens = {
				load_on_setup = false,
			},
		},
		keys = {
			{
				"<leader>ss",
				"<cmd>SessionSave<cr>",
				mode = "n",
				desc = "Save session",
				silent = true,
			},
			{
				"<leader>sr",
				"<cmd>SessionRestore<cr>",
				mode = "n",
				desc = "Restore session",
				silent = true,
			},
			{
				"<leader>sf",
				"<cmd>Autosession search<cr>",
				mode = "n",
				desc = "Search session to restore",
				silent = true,
			},
			{
				"<leader>sd",
				"<cmd>Autosession delete<cr>",
				mode = "n",
				desc = "Delete a session",
				silent = true,
			},
			{
				"<leader>sp",
				"<cmd>SessionPurgeOrphaned<cr>",
				mode = "n",
				desc = "Purge Orphaned Sessions",
				silent = true,
			},
		},
	},
}

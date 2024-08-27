return {
	{
		"stevearc/overseer.nvim",
		dependencies = {
			"echasnovski/mini.notify",
			"stevearc/dressing.nvim",
		},
		opts = {
			task_list = {
				min_height = 15,
				bindings = {
					["g?"] = false,
					["l"] = false,
					["h"] = false,
					["<C-l>"] = false,
					["<C-h>"] = false,
					["j"] = "PrevTask",
					["k"] = "NextTask",
					["L"] = "IncreaseWidth",
					["H"] = "DecreaseWidth",
					["["] = "IncreaseAllDetail",
					["]"] = "DecreaseAllDetail",
					["{"] = "IncreaseDetail",
					["}"] = "DecreaseDetail",
					["<C-k>"] = false,
					["<C-j>"] = false,
					["<C-u>"] = "ScrollOutputUp",
					["<C-d>"] = "ScrollOutputDown",
				},
			},
			form = {
				border = "single",
			},
			task_launcher = {
				bindings = {
					i = {
						["<C-s>"] = false,
						["<CR>"] = "NextOrSubmit",
					},
					n = {
						["<C-s>"] = false,
					},
				},
			},
			task_editor = {
				bindings = {
					i = {
						["<C-s>"] = false,
						["<C-n>"] = "Next",
						["<C-p>"] = "Prev",
					},
					n = {
						["<C-s>"] = false,
						["<C-n>"] = "Next",
						["<C-p>"] = "Prev",
					},
				},
			},
			confirm = {
				border = "single",
			},
			task_win = {
				border = "single",
			},
			help_win = {
				border = "single",
			},
		},
		keys = {
			{
				"<leader>aa",
				"<cmd>OverseerToggle<cr>",
				mode = "n",
				desc = "Task run list",
				silent = true,
			},
			{
				"<leader>ar",
				"<cmd>OverseerRun<cr>",
				mode = "n",
				desc = "Run task",
				silent = true,
			},
			{
				"<leader>ac",
				"<cmd>OverseerClearCache<cr>",
				mode = "n",
				desc = "Clear task history",
				silent = true,
			},
			{
				"<leader>an",
				"<cmd>OverseerBuild<cr>",
				mode = "n",
				desc = "New tasks",
				silent = true,
			},
			{
				"<leader>aq",
				"<cmd>OverseerQuickAction<cr>",
				mode = "n",
				desc = "Quick Action tasks",
				silent = true,
			},
		},
	},
}

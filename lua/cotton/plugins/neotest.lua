return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"alfaix/neotest-gtest",
			"fredrikaverpil/neotest-golang",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-python",
			"marilari88/neotest-vitest",
			"rouge8/neotest-rust",
			"lawrence-laz/neotest-zig",
		},
		ft = {
			"cpp",
			"go",
			"lua",
			"javascript",
			"javascriptreact",
			"python",
			"typescript",
			"typescriptreact",
			"rust",
			"zig",
		},
		config = function()
			local neotest = require("neotest")

			---@diagnostic disable: missing-fields
			neotest.setup({
				adapters = {
					require("neotest-gtest").setup({}),
					require("neotest-golang"),
					require("neotest-plenary"),
					require("neotest-python"),
					require("neotest-vitest"),
					require("neotest-rust"),
					require("neotest-zig").setup({}),
				},
				quickfix = {
					open = function()
						vim.cmd("<cmd>lua require('quicker').toggle()<cr>")
					end,
				},
			})

			-- keymap
			local keymap = vim.keymap
			local opts = { silent = true }

			opts.desc = "Run last test"
			keymap.set("n", "<leader>tt", function()
				neotest.run.run_last()
			end, opts)

			opts.desc = "Run test"
			keymap.set("n", "<leader>tT", function()
				neotest.run.run({ suite = true })
			end, opts)

			opts.desc = "Stop running test"
			keymap.set("n", "<leader>tq", function()
				neotest.run.stop({ interactive = true })
			end, opts)

			opts.desc = "Attach to running test"
			keymap.set("n", "<leader>ta", function()
				neotest.run.attach({ interactive = true })
			end, opts)

			opts.desc = "Display test results"
			keymap.set("n", "<leader>tr", function()
				neotest.output.open({ enter = true, short = true, last_run = true, auto_close = true })
			end, opts)

			opts.desc = "Display test history"
			keymap.set("n", "<leader>th", function()
				neotest.output_panel.toggle()
			end, opts)

			opts.desc = "Display test summary"
			keymap.set("n", "<leader>ts", function()
				neotest.summary.toggle()
			end, opts)

			opts.desc = "Jump to next test"
			keymap.set("n", "]T", function()
				neotest.jump.next()
			end, opts)

			opts.desc = "Jump to previous test"
			keymap.set("n", "[T", function()
				neotest.jump.prev()
			end, opts)
		end,
	},
	{
		"andythigpen/nvim-coverage",
		requires = "nvim-lua/plenary.nvim",
		ft = {
			"cpp",
			"go",
			"lua",
			"javascript",
			"typescript",
			"python",
			"javascriptreact",
			"typescriptreact",
			"rust",
			"zig",
		},
		opts = {
			auto_reload = true,
			summary = {
				borders = "single",
			},
		},
		keys = {
			{
				"<leader>tcl",
				"<cmd>CoverageLoad<cr>",
				mode = "n",
				desc = "Load coverage data",
				silent = true,
			},
			{
				"<leader>tcc",
				"<cmd>CoverageClear<cr>",
				mode = "n",
				desc = "Clear cached coverage data",
				silent = true,
			},
			{
				"<leader>tcs",
				"<cmd>CoverageToggle<cr>",
				mode = "n",
				desc = "Toggle coverage signs",
				silent = true,
			},
			{
				"<leader>tcr",
				"<cmd>CoverageSummary<cr>",
				mode = "n",
				desc = "Display coverage summary",
				silent = true,
			},
		},
	},
}

-- FIX: annoying diagnostics
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				indent = { enable = true },
				ensure_installed = {
					"bash",
					"c",
					"cmake",
					"cpp",
					"dockerfile",
					"fish",
					"gitignore",
					"go",
					"json",
					"just",
					"lua",
					"python",
					"rust",
					"toml",
					"vim",
					"vimdoc",
					"yaml",
					"zig",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "grr",
						node_incremental = "gri",
						scope_incremental = "grs",
						node_decremental = "grd",
					},
				},
			})

			-- TODO: Folding
			-- folding using treesitter
			-- vim.wo.foldmethod = "expr"
			-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	},
	-- TODO: Grammar based text objects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {},
					},
				},
			})
		end,
	},
}

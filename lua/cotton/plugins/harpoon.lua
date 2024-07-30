return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			local telescope_config = require("telescope.config").values
			local function harpoon_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end
				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						preview = telescope_config.file_preview({}),
						sorter = telescope_config.generic_sorter({}),
					})
					:find()
			end

			-- keymap
			local keymap = vim.keymap

			keymap.set("n", "<M-k>", function()
				harpoon:list():add()
			end, { desc = "Harpoon add mark" })
			keymap.set("n", "<M-m>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon quick menu" })
			keymap.set("n", "<M-l>", function()
				harpoon_telescope(harpoon:list())
			end, { desc = "Harpoon telescope menu" })

			keymap.set("n", "<M-j>", function()
				harpoon:list():select(1)
			end, { desc = "1st mark (Harpoon)" })
			keymap.set("n", "<M-i>", function()
				harpoon:list():select(2)
			end, { desc = "2nd mark (Harpoon)" })
			keymap.set("n", "<M-o>", function()
				harpoon:list():select(3)
			end, { desc = "3rd mark (Harpoon)" })
			keymap.set("n", "<M-u>", function()
				harpoon:list():select(4)
			end, { desc = "4th mark (Harpoon)" })

			keymap.set("n", "<M-p>", function()
				harpoon:list():prev()
			end, { desc = "Previous mark (Harpoon)" })
			keymap.set("n", "<M-n>", function()
				harpoon:list():next()
			end, { desc = "Next mark (Harpoon)" })
		end,
	},
}

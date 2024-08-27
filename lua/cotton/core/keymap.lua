-- ergonomics
local keymap = vim.keymap

-- leader
vim.g.mapleader = " "

-- undo redo
keymap.set("n", "U", "<C-r>", { desc = "Redo" })
keymap.set("n", "<C-r>", "U", { desc = "Restore last line" })

-- highlights
keymap.set("n", "<C-S>", "<cmd>nohls<CR>", { desc = "Clear highlights", silent = true })

-- mark
keymap.set({ "n", "x" }, "`", "'", { desc = "Mark", noremap = true })
keymap.set({ "n", "x" }, "'", "`", { desc = "Mark", noremap = true })

-- tabs
keymap.set("n", "gP", "<cmd>tabprevious<CR>", { desc = "Previous tab", silent = true })
keymap.set("n", "gN", "<cmd>tabnext<CR>", { desc = "Next tab", silent = true })
keymap.set("n", "zt", "<cmd>tabclose<CR>", { desc = "Close current tab", silent = true })

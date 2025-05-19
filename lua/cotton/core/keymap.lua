-- ergonomics
local keymap = vim.keymap

-- leader
vim.g.mapleader = " "

-- undo redo
keymap.set("n", "U", "<C-r>", { desc = "Redo" })
keymap.set("n", "<C-r>", "U", { desc = "Restore last line" })

-- highlights
keymap.set("n", "z<cr>", "<cmd>nohls<CR>", { desc = "Clear highlights", silent = true })

-- mark
keymap.set({ "n", "x" }, "`", "'", { desc = "Mark", noremap = true })
keymap.set({ "n", "x" }, "'", "`", { desc = "Mark", noremap = true })

-- lsp
keymap.del("n", "gO")
keymap.del({ "n", "v" }, "gra")
keymap.del("n", "gri")
keymap.del("n", "grn")
keymap.del("n", "grr")
keymap.del({ "i", "s" }, "<C-s>")

-- navigation
keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
keymap.set("n", "[b", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })
keymap.set("n", "]B", "<cmd>bfirst<cr>", { desc = "First buffer", silent = true })
keymap.set("n", "[B", "<cmd>blast<cr>", { desc = "Last buffer", silent = true })
keymap.set("n", "]T", "<cmd>tabnext<cr>", { desc = "Next tab", silent = true })
keymap.set("n", "[T", "<cmd>tabprevious<cr>", { desc = "Previous tab", silent = true })

keymap.del("n", "]D")
keymap.del("n", "[D")
keymap.del("n", "]a")
keymap.del("n", "[a")
keymap.del("n", "]A")
keymap.del("n", "[A")
keymap.del("n", "]l")
keymap.del("n", "[l")
keymap.del("n", "]L")
keymap.del("n", "[L")
keymap.del("n", "]q")
keymap.del("n", "[q")
keymap.del("n", "]Q")
keymap.del("n", "[Q")
keymap.del("n", "]<C-t>")
keymap.del("n", "[<C-t>")
keymap.del("n", "]<C-q>")
keymap.del("n", "[<C-q>")
keymap.del("n", "]<C-l>")
keymap.del("n", "[<C-l>")

-- misc
keymap.set("n", "gW", "<cmd>tabclose<cr>", { desc = "Tab close", silent = true })

-- textobjects
keymap.set({ "x", "o" }, "aP", "ap", { desc = "outer paragraph", noremap = true })
keymap.set({ "x", "o" }, "iP", "ip", { desc = "inner paragraph", noremap = true })
keymap.set({ "x", "o" }, "iB", "iB", { desc = "inner block", noremap = true })

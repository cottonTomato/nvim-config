local opt = vim.opt

-- linenumber
opt.relativenumber = true
opt.number = true

-- tab & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- folding
vim.wo.foldlevel = 7

-- line wrapping
opt.wrap = false

-- cursorline
opt.cursorline = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- window
opt.splitright = true
opt.splitbelow = true

-- swapfile
opt.swapfile = false

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

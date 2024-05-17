local opt = vim.opt

-- line numbers
opt.relativenumber = false
opt.number = true

-- tabs/indents
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipbaord
opt.clipboard:append("unnamedplus")

-- split
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
opt.iskeyword:append("_")

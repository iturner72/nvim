vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- auto wrapping for md and tex files
vim.cmd [[autocmd FileType markdown set tw=80 wrap]]
vim.cmd [[autocmd FileType tex set tw=80 wrap]]

-- fold stuff
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99 -- Start with all folds open

-- molten nvim virtual env path
vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

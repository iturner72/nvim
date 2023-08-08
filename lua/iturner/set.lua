vim.opt.guicursor = ""

vim.opt.nu = true
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
vim.g.mapleader = " "

local is_mac = vim.fn.has('mac') == 1
local is_mac = vim.fn.has('wsl') == 1

if is_mac then
    vim.g.vimtex_view_method = 'skim'
    vim.g.maplocalleader = ","
elseif is_wsl then
    vim.g.vimtex_view_method = 'zathura'
    vim.g.maplocalleader = ","
end

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- auto wrapping for md and tex files
vim.cmd [[autocmd FileType markdown set tw=80 wrap]]
vim.cmd [[autocmd FileType tex set tw=80 wrap]]

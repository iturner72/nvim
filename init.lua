local is_mac = vim.fn.has('mac') == 1
local is_wsl = vim.fn.has('wsl') == 1
local is_arch = vim.fn.has('unix') == 1 and io.popen('uname -a'):read('*a'):match('arch')

-- lmao
if is_mac then
    vim.g.vimtex_view_method = 'skim'
    vim.g.maplocalleader = ","
elseif is_wsl or is_arch then
    vim.g.vimtex_view_method = 'zathura'
    vim.g.maplocalleader = ","
    vim.g.vimtex_quickfix_mode = 0
end

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- initialize Lazy.nvim
require("lazy").setup("iturner.plugins")

-- load my configs
require("iturner")

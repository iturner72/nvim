local is_mac = vim.fn.has('mac') == 1
local is_wsl = vim.fn.has('wsl') == 1

if is_mac then
    vim.g.vimtex_view_method = 'skim' -- Choose which program to use to view PDF file
    vim.g.vimtex_view_skim_sync = 1 -- Value allows forward search after every successful compilation
    vim.g.vimtex_view_skim_activate = 1 -- Value 1 allows change focus to skim after command `:VimtexView` is given
elseif is_wsl then
    vim.g.vimtex_view_method = 'zathura' -- Choose which program to use to view PDF file
end


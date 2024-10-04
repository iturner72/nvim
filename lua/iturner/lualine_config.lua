return function()
  local function filepath()
    local path = vim.fn.expand("%:~:.:h")
    if path == "" or path == "." then return "" end
    return path .. "/"
  end

  require("lualine").setup({
    options = {
      icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {
        { filepath, color = { fg= '#8FBCBB', gui = 'italic' } },
        { 'filename', path = 0 }
      },
      lualine_x = {
        {'encoding', fmt = string.upper},
        {'fileformat', icons_enabled = true},
        {'filetype', icons_enabled = true}
      },
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        { filepath, color = { fg = '#4C566A', gui = 'italic' } },
        { 'filename', path = 0 }
      },
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  })
end

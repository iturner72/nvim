local function set_line_number_colors()
  -- Set the color for current line
  vim.api.nvim_set_hl(0, 'LineNr', { fg = '#6a9c8d', bold = true })

  -- Set the color for relative line numbers
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#474d4b', bold = true })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#474d4b', bold = true })
end

-- Call this function after your colorscheme is set
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_line_number_colors
})

-- Ensure the function is called on startup as well
set_line_number_colors()

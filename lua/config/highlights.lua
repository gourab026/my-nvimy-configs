-- Add this after your color scheme setup
local highlights = {
  AlphaHeader = { fg = "#98c379", bold = true },    -- Green
  AlphaButtons = { fg = "#61afef", bold = false },  -- Blue
  AlphaShortcut = { fg = "#e06c75", bold = true },  -- Red
  AlphaFooter = { fg = "#928374", italic = true },  -- Gray
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

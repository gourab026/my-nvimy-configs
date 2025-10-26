local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Read ASCII art using Neovim's built-in readfile
local ascii_file = vim.fn.stdpath("config") .. "/lua/assets/ascii.txt"
local header = vim.fn.readfile(ascii_file)

-- Fallback if file doesn't exist
if #header == 0 then
    header = { "Neovim Dashboard" }
end

dashboard.section.header.val = header

dashboard.section.buttons.val = {
  dashboard.button("b", " > Browse files", "<cmd>Telescope find_files<CR>"),
  dashboard.button("z", " > Browse Directories", "<cmd>Telescope file_browser<CR>"),
  dashboard.button("f", " > Find file", "<cmd>Telescope find_files<CR>"),
  dashboard.button("r", " > Recent", "<cmd>Telescope oldfiles<CR>"),
}

dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.opts.layout[1].val = 8

return dashboard.opts

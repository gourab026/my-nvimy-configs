-- Using Lazy.nvim

return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VimEnter',
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    
    -- Load custom config
    local custom_config = require("config.alpha-config")
    alpha.setup(custom_config)
  end,
}


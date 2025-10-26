--[[
Lazy.nvim is a modern plugin manager with automatic lazy-loading, fast startup times and a powerful UI for managing plugins

# Bemefits :

- Automatiic caching and bytecode compilation
- Lazy-loading on events, commands, filetypes and key mappings
- Auto install missing plugins on startup
- Built-in UI for managing plugins

]]


-- UI settings
ui = {
  border = "rounded",
  size = {
    width = 0.8,
    height = 0.8,
  },
}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Autoinstall lazy.nvim if not present
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

  -- Performance settings
performance = {
  cache = {
    enabled = true,
  },
  reset_packpath = true,
  rtp = {
    reset = true,
    paths = {},
    disabled_plugins = {},
  },
}


-- Add lazy.nvim to runtimepath
vim.opt.rtp:prepend(lazypath)

-- Set leader key BEFORE lazy setup
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set up lazy.nvim
require("lazy").setup({
  spec = { { import = "plugins" } },  -- Import all plugins from /lua/plugins/
  install = { colorscheme = { "vague" } },  -- Use Vague as fallback colorscheme during install
  checker = {
    enabled = true,                    -- Check for plugin updates
    notify = false,                    -- Don't notify about updates (optional)
  },
})


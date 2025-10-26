--[[
Lazy.nvim is a modern plugin manager with automatic lazy-loading, fast startup times and a powerful UI for managing plugins

# Bemefits :

- Automatiic caching and bytecode compilation
- Lazy-loading on events, commands, filetypes and key mappings
- Auto install missing plugins on startup
- Built-in UI for managing plugins

]]

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- Auto install lazy.nvim if not present


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

-- Add lazy.nvim to runtimepath
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim
require("lazy").setup({
  -- Import all the plugins from /lua/plugins/
  { import = "plugins" },
}, {
  -- Lazy.nvim configuration
  checker = {
    enable = true,           -- Automatically check for plugin updates
    notify = false,          -- Don't notify about updates
  },
})


















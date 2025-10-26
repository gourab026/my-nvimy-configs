-- A good colorscheme improves readability. Treesitter- compatible colorschemes provide better systext highlight


return {

  -- Catppuccin colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,                         -- Load before other plugins
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",                   -- latte, frappe, macchiato, mocha
        transparent_background == false,
        term_color = true,
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
          },
          cmp = true,
          telescope = true,
        },
      })

      -- Apply the colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Alternative: Gruvbox
  --{
  --  "ellisonleao/gruvbox.nvim",
  --  priority = 1000,
  --  config = function()
  --    require("gruvbox").setup({
  --      contrast = "hard",
  --    })
  --    vim.cmd.colorscheme("gruvbox")
  --  end,
  --},

}



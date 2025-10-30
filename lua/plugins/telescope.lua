-- providing fuzzy finding, better statusline, and file navigation
-- Best fuzzy finder for Neovim, integrates with LSP
-- :Telescope <picker_name>, :Telescope find_files


--[[

# Normal Mode
:Telescope find_files        " Find files in current directory
:Telescope live_grep         " Search text in all files
:Telescope buffers           " List and switch between open buffers
:Telescope help_tags         " Search Neovim help documentation
:Telescope oldfiles          " Recently opened files
:Telescope git_files         " Git tracked files only
:Telescope colorscheme       " Preview and switch colorschemes
:Telescope keymaps           " List all keymaps
:Telescope commands          " List all available commands

# Common LSP cmds
:Telescope lsp_references           " Find all references to symbol
:Telescope lsp_definitions          " Find definitions
:Telescope lsp_implementations      " Find implementations
:Telescope lsp_document_symbols     " Symbols in current file
:Telescope lsp_workspace_symbols    " Symbols in workspace
:Telescope diagnostics              " Show all diagnostics

# keymaps
Key         |  Command                    |  Action
------------+-----------------------------+--------------
<leader>ff  |  :Telescope find_files<CR>  |  Find files
<leader>fg  |  :Telescope live_grep<CR>   |  Search text
<leader>fb  |  :Telescope buffers<CR>     |  List buffers
<leader>fh  |  :Telescope help_tags<CR>   |  Search help
<leader>fr  |  :Telescope oldfiles<CR>    |  Recent files

(Remember: <leader> is usually Space if you set vim.g.mapleader = " ")

# Navigation in telescope
Key           |  Action
--------------+--------------------------
Ctrl+norDown  |  Next item
Ctrl+porUp    |  Previous item
Enter         |  Open selected file
Ctrl+x        |  Open in horizontal split
Ctrl+v        |  Open in vertical split
Ctrl+t        |  Open in new tab
EscorCtrl+c   |  Close Telescope
Ctrl+u        |  Scroll preview up
Ctrl+d        |  Scroll preview down



]]

return {
    -- Plugin: Telescope - A fuzzy finder for Neovim
    "nvim-telescope/telescope.nvim",

    -- Pin to the 0.1.x release branch for stability
    branch = "0.1.x",

    -- Dependencies required by Telescope
    dependencies = {
        -- Plenary: A common utility library for Neovim plugins
        "nvim-lua/plenary.nvim",

        -- FZF-Native: Compiles a C extension for FZF to improve performance
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            -- 'make' is run to compile the C code when installing or updating
            build = "make",
        },
    },

    -- Lazy load the plugin. It will only be loaded when the :Telescope command is run.
    -- cmd = "Telescope",



    -- Configuration function, runs after the plugin is loaded
    config = function()
        -- Import the main telescope module
        local telescope = require("telescope")
        -- Import the actions module to customize keybindings
        local actions = require("telescope.actions")

        -- Main setup function
        telescope.setup({
            -- Default settings for all Telescope pickers
            defaults = {
                -- Custom keymappings for Telescope's insert mode
                mappings = {
                    i = {
                        -- Navigate results down
                        ["<C-j>"] = actions.move_selection_next,
                        -- Navigate results up
                        ["<C-k>"] = actions.move_selection_previous,
                        -- Send selected items to the quickfix list and open it
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                },
                -- Patterns to ignore when searching for files
                file_ignore_patterns = { "node_modules", ".git/" },
            },
        })

        -- Load the fzf-native extension for faster sorting
        telescope.load_extension("fzf")
    end,
}

-- Treesitter provides better syntax highlighting and code understanding by parsing your code into an AST (Abstract Syntax Tree).
-- More accurate then regex based hightlighting
-- Context-aware indentation
-- Code folding based on syntext


-- Using incremental selection:

-- Place cursor on hello
-- Press Ctrl+Space → Selects hello
-- Press Ctrl+Space again → Selects hello(name)
-- Press Ctrl+Space again → Selects entire function def hello(name): print(...)
-- Press Backspace → Go back one level


-- Checking Treesitter Status
-- :checkhealth treesitter
-- :TSInstallInfo


return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",                                   -- Update parsers after install
    event = { "BufReadPost", "BufNewFile" },               -- Lazy load on file open
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",     -- Additional text objects
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- List of parser names or "all"
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "python",
                "javascript",
                "typescript",
                "rust",
                "go",
                "html",
                "css",
                "json",
                "yaml",
                "markdown",
                "bash",
            },
            -- Install parsers synchronously
            sync_install = false,
            -- Automatically install missing parsers when entering buffer
            auto_install = true,
            -- Enable syntax highlighting
            highlight = {
                enable = true,
                -- Disable for large files (optional)
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },
            -- Enable indentation
            indent = {
                enable = true,
            },
            -- Enable incremental selection
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",         -- Start selection
                    node_incremental = "<C-space>",       -- Expand selection
                    scope_incremental = false,            -- Disabled
                    node_decremental = "<bs>",            -- Shrink selection
                },
            },
        })
    end,
}


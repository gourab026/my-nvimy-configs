-- nvim-cmp provides intelligent autocompletion from LSP, buffers, paths, and snippets. It's the most popular completion plugin for Neovim


--[[

# Explanation

Dependencies: Each completion source is a separate plugin
Must install all sources you want to use

Snippet engine: Required for nvim-cmp
LuaSnip is modern and fast
friendly-snippets provides pre-made snippets

mapping: Keybindings for completion
Tab/Shift-Tab navigate items
Enter confirms selection
Ctrl-Space manually triggers completion

sources: Where completions come from
Order determines priority
LSP first, then snippets, then buffer text

formatting: Customizes how items display
Shows source in brackets

Command line setup: Completion in command mode
Path completion for :e, :w, etc.
Command completion for Neovim commands

Why nvim-cmp: Most feature-rich and actively maintained

]]


return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Lazy load in insert mode
    dependencies = {
        "hrsh7th/cmp-buffer", -- Buffer completions
        "hrsh7th/cmp-path", -- Path completions
        "hrsh7th/cmp-cmdline", -- Command line completions
        "hrsh7th/cmp-nvim-lsp", -- LSP completions
        "L3MON4D3/LuaSnip", -- Snippet engine
        "saadparwaiz1/cmp_luasnip", -- Snippet completions
        "rafamadriz/friendly-snippets", -- Collection of snippets
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- Load friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Helper function to check if we can jump
        local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        cmp.setup({
            -- Snippet configuration
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            -- Completion window appearance
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            -- Key mappings
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),

                -- Tab completion
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                -- Shift-Tab for previous item
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            -- Completion sources (order matters!)
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- LSP completions (highest priority)
                { name = "luasnip" }, -- Snippet completions
                { name = "buffer" }, -- Buffer text completions
                { name = "path" }, -- File path completions
            }),

            -- Formatting
            formatting = {
                format = function(entry, vim_item)
                    -- Source name
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
        })

        -- Command line completion
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmdline" },
            }),
        })

        -- Search completion
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
    end,
}





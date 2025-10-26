-- LSP (Language Server Protocol) provides IDE-like features : autocompletion, go-to-defination, diagnostics, hover documentation, and more.
-- cmds --> :Mason, :LspInfo, :checkhealth lsp


return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            -- Mason setup
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "ts_ls",
                    "rust_analyzer",
                    "gopls",
                    "html",
                    "cssls",
                    "jsonls",
                },
                automatic_installation = true,
            })

            -- Get capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            if has_cmp then
                capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
            end

            -- Global config
            vim.lsp.config['*'] = {
                capabilities = capabilities,
            }

            -- Lua
            vim.lsp.config.lua_ls = {
                cmd = { "lua-language-server" },
                filetypes = { "lua" },
                root_markers = { ".luarc.json", ".git" },
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            }

            -- Python
            vim.lsp.config.pyright = {
                cmd = { "pyright-langserver", "--stdio" },
                filetypes = { "python" },
                root_markers = { "pyproject.toml", "setup.py", ".git" },
            }

            -- TypeScript
            vim.lsp.config.ts_ls = {
                cmd = { "typescript-language-server", "--stdio" },
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                root_markers = { "package.json", "tsconfig.json", ".git" },
            }

            -- Rust
            vim.lsp.config.rust_analyzer = {
                cmd = { "rust-analyzer" },
                filetypes = { "rust" },
                root_markers = { "Cargo.toml" },
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = { command = "clippy" },
                    },
                },
            }

            -- Go
            vim.lsp.config.gopls = {
                cmd = { "gopls" },
                filetypes = { "go", "gomod" },
                root_markers = { "go.mod", ".git" },
            }

            -- HTML
            vim.lsp.config.html = {
                cmd = { "vscode-html-language-server", "--stdio" },
                filetypes = { "html" },
            }

            -- CSS
            vim.lsp.config.cssls = {
                cmd = { "vscode-css-language-server", "--stdio" },
                filetypes = { "css", "scss", "less" },
            }

            -- JSON
            vim.lsp.config.jsonls = {
                cmd = { "vscode-json-language-server", "--stdio" },
                filetypes = { "json", "jsonc" },
            }

            -- Enable servers
            vim.lsp.enable({
                "lua_ls",
                "pyright",
                "ts_ls",
                "rust_analyzer",
                "gopls",
                "html",
                "cssls",
                "jsonls",
            })

            -- LSP keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf, silent = true }

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
                end,
            })

            -- Diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                },
            })

            -- Signs
            local signs = {
                { name = "DiagnosticSignError", text = "✘" },
                { name = "DiagnosticSignWarn", text = "▲" },
                { name = "DiagnosticSignHint", text = "⚑" },
                { name = "DiagnosticSignInfo", text = "»" },
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
            end
        end,
    },
}



-- Autocommands automatically execute actions when specific events occure. They are usefull for file-type specific and UI enhancements


-- Create autocommand group (for organization)
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General Settings Group
local general = augroup("GeneralSettings", { clear = true })


-- Highlight on yank
autocmd("TextYankPost", {
    group = general,
    desc = "Highlight when tanking (copying) text",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})
-- Why ? Visual feedback when copying text


-- Remove trailing whitespace on save
autocmd("BufWritePre", {
    group = general,
    desc = "Remove trailing whitespace on save",
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
-- Why ? Keeps files clean automatically


-- Don't auto comment new lines
autocmd("BufEnter", {
    group = general,
    desc = "Disable auto-commenting new lines",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})
-- Why ? Prevent annoying auto-comments


-- File Type Setting Group
local filetype = augroup("FileTypeSettings", { clear = true })

-- Set indentation for specific file types
autocmd("FileType", {
    group = general,
    desc = "Set 2-space indent for we files",
    pattern = {
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "lua"
    },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end,
})
-- Why ? WHb files typically use 2-space indentatiion


-- AUto-resize splits when window is resiized
autocmd("VimResized", {
    group = general,
    desc = "Auto-resize splits on window resize",
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})
-- Why ? keep split balanced when resizing terminal


















--[[

-- BASIC KEYMAP SYNTAX
-- vim.keymap.set({mode(s)}, {lhs}, {rhs}, {options})

-- mode(s): "n" (normal), "i" (insert), "v" (visual), "x" (visual block), "t" (terminal), "c" (command-line), or a table of modes
-- lhs: Left-hand side (keys you type)
-- rhs: Right-hand side (command, function, or plugin action)
-- options: Optional table of settings (e.g., { desc = "Description", silent = true })

-------------------------------
-- EXAMPLES
-------------------------------

-- 1. Normal Mode – Remap 'jk' to escape insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Quick exit insert mode" })

-- 2. Window Navigation (Normal mode)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right split" })

-- 3. Buffer Navigation
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })

-- 4. Move selected lines up/down (Visual mode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- 5. Keep selection after indenting (Visual mode)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left + keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right + keep selection" })

-- 6. Paste without overwriting clipboard (Visual block)
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste over selection (no yank)" })

-- 7. Save file with Ctrl+S (Normal and Insert Mode)
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file", silent = true })

-- 8. Clear search highlight (Normal Mode)
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- 9. Map <leader>ff to Telescope file search
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope Find Files" })

-- 10. Custom Command or Function as Keymap

vim.keymap.set("n", "<leader>g", function()
  print("You pressed <leader>g!")
end, { desc = "Echo message" })

-------------------------------
-- ADVANCED USAGE
-------------------------------

-- Multiple modes at once (e.g., {'n', 'x'})

vim.keymap.set({ "n", "x" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })

-- Option summary:
-- desc:    Description for which-key or docs
-- silent:  Do not show command in command-line (default true)
-- noremap: Non-recursive mapping (default true)
-- expr:    Evaluate rhs as expression (often used with functions)
-- buffer:  Keymap applies only to given buffer (buffer-local)

-- Buffer-local mapping

vim.keymap.set("n", "<leader>q", ":q<CR>", { buffer = 0, desc = "Quit buffer-local" })

-------------------------------
-- DISABLING EXISTING KEYMAPS
-------------------------------
-- To remove a keymap, use nil as the rhs:

vim.keymap.set("n", "<F1>", nil) -- Disables F1 help in normal mode

-------------------------------
-- TABLE OF MODES
-------------------------------
-- "n" = normal
-- "i" = insert
-- "v" = visual
-- "x" = visual block
-- "t" = terminal
-- "c" = command-line
-- {"n", "v"} = both normal and visual

-------------------------------
-- TIP: Use <leader> as a prefix
-------------------------------
-- Set your leader key early (in options.lua):

--- vim.g.mapleader = " "      -- Space is leader
--- vim.g.maplocalleader = " " -- Space is local leader

-------------------------------
-- WHERE TO DEFINE KEYMAPS
-------------------------------
-- Place your custom mappings in ~/.config/nvim/lua/config/keymaps.lua
-- and load via require("config.keymaps") in your init.lua

]]


--[[

Key Legend :

Ctrl = Control key
Shift = Shift key
<leader> = Your leader key (usually Space, set in options.lua)
<C-X> = Ctrl + X
<S-X> = Shift + X
<CR> = Carriage Return (Enter key)
"n" = Normal mode
"v" = Visual mode
"x" = Visual block mode


Quick Reference Table

Key Combination    |  Mode          |  Action                                        |  Why
-------------------+----------------+------------------------------------------------+--------------------------------------------
Ctrl+H/J/K/L       |  Normal        |  Move to adjacent window (left/down/up/right)  |  Faster than Ctrl+W + direction
Ctrl+Arrow Keys    |  Normal        |  Resize window (up/down/left/right)            |  Easy resizing without memorizing
Shift+H / Shift+L  |  Normal        |  Previous/Next buffer                          |  Mirrors vim movement keys
< / >              |  Visual        |  Indent left/right                             |  Keep selection active for multiple indents
J / K              |  Visual        |  Move selection down/up                        |  Move code blocks without cut-paste
<leader>p          |  Visual Block  |  Paste without yanking                         |  Preserve clipboard content
Escape             |  Normal        |  Clear search highlights                       |  Remove visual search remnants
Ctrl+S             |  Normal        |  Save file                                     |  Standard save shortcut


]]


-- Main Key bindings/mappings

--[[
WINDOW NAVIGATION & MANAGEMENT
Navigate between splits and resize windows efficiently
]]

-- Set up key mapping function
-- This creates a shorter alias for vim.keymap.set for easier use
local keymap = vim.keymap.set

--[[
WINDOW NAVIGATION
Move between split windows using Ctrl + hjkl
Why: Much faster than Ctrl+w followed by hjkl
]]

-- Key: Ctrl+H | Command: Move to left window
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })

-- Key: Ctrl+J | Command: Move to bottom window
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })

-- Key: Ctrl+K | Command: Move to top window
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })

-- Key: Ctrl+L | Command: Move to right window
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

--[[
WINDOW RESIZING
Resize windows with arrow keys
Why: Easy window resizing without memorizing complex commands
]]

-- Key: Ctrl+Up Arrow | Command: Increase window height by 2 lines
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })

-- Key: Ctrl+Down Arrow | Command: Decrease window height by 2 lines
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })

-- Key: Ctrl+Left Arrow | Command: Decrease window width by 2 columns
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })

-- Key: Ctrl+Right Arrow | Command: Increase window width by 2 columns
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

--[[
BUFFER NAVIGATION
Switch between open buffers (files)
Why: Quick buffer switching with Shift + h/l (mirrors vim movement keys)
]]

-- Key: Shift+L | Command: Go to next buffer
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })

-- Key: Shift+H | Command: Go to previous buffer
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

--[[
VISUAL MODE - INDENTATION
Keep selection active after indenting
Why: Keeps selection after indenting in visual mode (you can indent multiple times)
]]

-- Key: < (less than) in Visual Mode | Command: Indent selected text left
keymap("v", "<", "<gv", { desc = "Indent left" })

-- Key: > (greater than) in Visual Mode | Command: Indent selected text right
keymap("v", ">", ">gv", { desc = "Indent right" })

--[[
VISUAL MODE - MOVE TEXT
Move selected lines up and down
Why: Visually move blocks of code without cut-paste
]]

-- Key: J in Visual Mode | Command: Move selected lines down by 1 line
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Key: K in Visual Mode | Command: Move selected lines up by 1 line
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

--[[
VISUAL BLOCK MODE - PASTE
Paste without overwriting clipboard
Why: Prevents overwriting clipboard when pasting over selection
(When you paste over text, the selected text goes to clipboard by default - this prevents that)
]]

-- Key: <leader>p in Visual Block Mode | Command: Paste from clipboard without yanking selection
keymap("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

--[[
NORMAL MODE - UTILITIES
Useful general commands
]]

-- Key: Escape | Command: Clear search highlights
keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlights" })
-- Why: Quickly remove those annoying yellow/red highlights from previous searches

-- Key: Ctrl+S | Command: Save file (write to disk)
keymap("n", "<C-s>", ":w<CR>", { desc = "Save file" })
-- Why: Familiar Ctrl+S from other editors like VSCode (standard save shortcut)


-- Telescope keybindings
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })

-- -- Telescope file browser with Ctrl+E
-- vim.keymap.set("n", "<C-e>", function()  -- for normal mode
--     require("telescope").extensions.file_browser.file_browser()
-- end, { desc = "File browser" })
--
-- vim.keymap.set("i", "<C-e>", function()  -- for insert mode
--     require("telescope").extensions.file_browser.file_browser()
-- end, { desc = "File browser" })
--

---- Comments key binding

vim.keymap.set("x", "<leader>cc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment visual lines" })
vim.keymap.set("n", "<leader>cc", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment current line" })


---- blink.cmp ctrl+k for signature (show function details)
vim.keymap.set('n', '<leader>kk', function()
  require('blink.cmp').toggle_signature_help()
end, { silent = true, desc = "Toggle signature help" })

---- file-tree keybind ctrl+k
vim.keymap.set("n", "<C-k>", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })








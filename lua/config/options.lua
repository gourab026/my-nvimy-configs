-- Options (This file) control how neovim behaves and looks.
-- Loading / Setting this up early ensures consistent behavior


-- Set leader key first (used in keymaps)
vim.g.mapleader = " "       -- Space as leader key : A prefix for custom keymaps (we'll use this in keymaps)
vim.g.maplocalleader = " "  -- Space as local leader


-- Create shorter aliases for vim.opt
local opt = vim.opt


-- Line numbers
opt.number = true           -- Show absolute line numbers
opt.relativenumber = false   -- Show relative line numbers
-- Why ? Helps with motion commands (5j moves down 5 lines)


-- Indentation
opt.tabstop = 4             -- Number of spaces a tab represents
opt.shiftwidth = 4          -- Number of spaces for each indentation level
opt.expandtab = true        -- Convert tabs to spaces
opt.smartindent = true      -- Auto-indent new lines intelligently


-- Search settings
opt.ignorecase = true       -- Ignore case in search, search for a specific pattern the editor will treat uppercase and lowercase letters as equivalent
opt.smartcase = true        -- Override ignore if search has uppercase
opt.hlsearch = true         -- Highlight search results
opt.incsearch = true        -- Show match as you type

-- UI enhancements
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.cursorline = true       -- Hightlight current line
opt.signcolumn = "yes"      -- ALways show sign column (prevent text shifting). The signcolumn option manages the column on the left side of the editor window where signs are displayed. Signs are visual markers that convey information about specific lines in a file.
opt.wrap = false            -- Don't wrap lines
opt.cmdheight = 1           -- Height of the command bar
vim.opt.mouse = "a"         -- Enable mouse support


-- Splits
opt.splitright = true       -- Vertical splits go to the right
opt.splitbelow = true       -- Horizontal splots go below


-- Clipboard
opt.clipboard = "unnamedplus"  -- Use system clipboard : Easy copy/paste between newvim and other applications

--"" (empty string):This is the default behavior. Neovim uses its internal registers for yanking and deleting, and these operations do not directly interact with the system clipboard. To use the system clipboard, you would explicitly specify the "+ or "* registers (e.g., "+yy to yank a line to the system clipboard).
--"unnamed":This option makes the default yank and paste operations (y, p) use the system clipboard (specifically, the * register on X11, which is the primary selection, and the standard clipboard on macOS/Windows).
--"unnamedplus":This option makes the default yank and paste operations (y, p) use the system clipboard (specifically, the + register on X11, which is the standard clipboard, and the standard clipboard on macOS/Windows). This is generally the most common and recommended setting for seamless integration with the system clipboard across different operating systems.


-- Backup and undo : all false because 1. Declutter, 2. Security concerns, 3. etc like undo ...
opt.swapfile = false        -- Don't create swap files
opt.backup = false          -- Don't create backup files
opt.undofile = true         -- Enable persistent undo
-- Why ? Persistent undo is more useful than swap/backup files

-- Performance
opt.scrolloff = 8           -- Minimum number of screen lines to keep above and below the cursor
opt.updatetime = 250        -- Faster completion (default is 4000ms)
opt.timeoutlen = 300        -- Faster key sequence completion
opt.undofile = true         -- Persistent undo history
-- Why ? Improves responsiveness


-- Disable netrw and use yazi
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1













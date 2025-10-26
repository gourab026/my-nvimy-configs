-- Bootstrap configuration
-- Load core settings first

-- 1. Order matters : Options should load first to setup the environment
-- 2. require()     : Loads Lua modules from the lua/ directory

require("config.options")    -- Editor options
require("config.keymaps")    -- Key mappings
require("config.autocmds")   -- Autocommands
require("config.highlights") -- alpha-nvim highlight groups


-- Setup up plugin manager and load plugins

require("config.lazy")     -- This will load all the plugins



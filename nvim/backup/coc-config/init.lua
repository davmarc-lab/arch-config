-- Definee leader key
vim.g.mapleader = " "

-- Load all plugins and..
require("core.plugins")

-- ...all plugin config files:
require("core.plugin_config.coc")
require("core.plugin_config.nvim-comment")
require("core.plugin_config.lualine")
require("core.plugin_config.neo-tree")
require("core.plugin_config.treesitter")
require("core.plugin_config.undotree")
require("core.plugin_config.telescope")
require("core.plugin_config.colorizer")
require("core.plugin_config.toggleterm")
require("core.plugin_config.peek")

-- Set nvim keybindings and apppereance
require("core.keymaps")
require("core.nvimconfig")

-- Just an example, supposed to be placed in /lua/custom/

local M = {}

local pluginConfs = require "custom.plugins.configs"

M.plugins = {
  override = {
    ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
    ["williamboman/mason.nvim"] = pluginConfs.mason,
    ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope,
    ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
	[ "NvChad/nvterm"] = pluginConfs.nvterrm,
  },
  user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "onedark",
  transparency = false,
}

return M

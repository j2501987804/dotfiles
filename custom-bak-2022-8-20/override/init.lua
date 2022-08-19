return {
   ["hrsh7th/nvim-cmp"] = require "custom.override.cmp",
   ["kyazdani42/nvim-tree.lua"] = require "custom.override.nvim-tree",

   ["nvim-telescope/telescope.nvim"] = require "custom.override.telescope",

   ["nvim-treesitter/nvim-treesitter"] = {
      highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
      },

      incremental_selection = {
         enable = true,
         keymaps = {
            init_selection = "<cr>",
            node_incremental = "<cr>",
            node_decremental = "<bs>",
            scope_incremental = "<tab>",
         },
      },
   },
}

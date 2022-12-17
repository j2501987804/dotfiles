local overrides = require "custom.plugins.overrides"
local conf = require 'custom.plugins.configs'

return {
  ["goolord/alpha-nvim"] = {
    disable = false,
  }, -- enables dashboard

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- vim and tmux statusline merge
	["vimpostor/vim-tpipeline"]={},

  -- Override plugin definition options
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["NvChad/nvterm"] = {
    override_options = overrides.nvterm,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
    requires = {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    }
  },

  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },
  ["hrsh7th/cmp-cmdline"] = { after = "cmp-buffer" },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  ["folke/trouble.nvim"] = {
    cmd = { "TroubleToggle" },
    config = [[require("trouble").setup()]],
  },

  -----------------------------------------------------------
  -- git stuff
  -----------------------------------------------------------
  ["sindrets/diffview.nvim"] = { cmd = { "DiffviewOpen", "DiffviewFileHistory" } },

  ["f-person/git-blame.nvim"] = {
    event = { "BufRead", "BufNewFile" },
  },

  -----------------------------------------------------------
  -- others
  -----------------------------------------------------------
  ["Pocco81/AutoSave.nvim"] = {
    event = { "TextChanged", "TextChangedI" },
    config = function()
      require("auto-save").setup({})
    end,
  },

  -- last read
  ["ethanholz/nvim-lastplace"] = {
    event = { "BufRead", "BufNewFile" },
    config = conf.lastplace,
  },

  ["karb94/neoscroll.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = [[require 'neoscroll'.setup()]],
  },

  ["brglng/vim-im-select"] = {
    event = { "InsertEnter" },
  },

  ['fgheng/winbar.nvim'] = {
    config = conf.winbar,
  },

  ['ggandor/leap.nvim'] = {},

  ["folke/todo-comments.nvim"] = {
    config = [[require('todo-comments').setup()]],
  },

  -----------------------------------------------------------
  -- lang
  -----------------------------------------------------------
  ["ray-x/go.nvim"] = {
    ft = "go",
    config = function()
      require("go").setup()
    end,
  },
}

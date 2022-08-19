return {
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["hrsh7th/cmp-cmdline"] = {
    -- after = "nvim-cmp",
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
  },

  -- last read
  ["ethanholz/nvim-lastplace"] = {
    event = { "BufRead", "BufNewFile" },
    config = [[require("custom.plugins.others").lastplace()]],
  },

  ["karb94/neoscroll.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = [[require 'neoscroll'.setup()]],
  },

  ["phaazon/hop.nvim"] = {
    cmd = "HopWord",
    config = "require 'hop'.setup{}",
  },

  ["brglng/vim-im-select"] = {
    event = { "InsertEnter" },
    cond = [[vim.fn.has("mac") == 1]],
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

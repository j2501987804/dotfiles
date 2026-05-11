require "options"
require "keymaps"
require "autocmds"

vim.pack.add({
  -- ui
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  { src = "https://github.com/nvchad/ui",        name = "nvchad" },
  "https://github.com/nvchad/base46",
  "https://github.com/nvchad/volt",

  -- treesitter
  "https://github.com/nvim-treesitter/nvim-treesitter",

  -- search
  "https://github.com/folke/snacks.nvim",
  "https://github.com/folke/trouble.nvim",
  "https://github.com/folke/todo-comments.nvim",

  -- editor
  "https://github.com/folke/which-key.nvim",
  "https://github.com/MagicDuck/grug-far.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/tiagovla/scope.nvim",

  -- LSP
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/nvimtools/none-ls.nvim",

  -- coding
  { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range '1.*' },
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/nvim-mini/mini.pairs",

})

require "plugins.ui"
require "plugins.snacks"
require "plugins.treesitter"
require "plugins.lsp"
require "plugins.coding"
require "plugins.editor"

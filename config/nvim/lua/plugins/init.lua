return {
  -- tab单独buff
  { "tiagovla/scope.nvim", config = true },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<c-k>", mode = "i", false }
    end,
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>/", false },
      { "<leader>,", false },
      { "<leader>:", false },
      { "<leader>sp", false },
      { "<leader>sa", false },
      { "<leader>sc", false },
      { "<leader>sC", false },
      { "<leader>sh", false },
      { "<leader>sH", false },
      { "<leader>sB", false },
      { "<leader>sM", false },
      { "<leader>sq", false },
      { "<leader>ft", false },
      { "<leader>fT", false },
    },
  },
  {
    "keaising/im-select.nvim",
    opts = {},
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<tab>", -- handled by nvim-cmp / blink.cmp
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
     },
    },
  },
}

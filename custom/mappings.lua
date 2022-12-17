local M = {}

M.general = {
  i = {},

  n = {
    -- git
    ["<leader>gd"] = {
      "<cmd>DiffviewOpen<cr>",
      "Diffview",
    },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- Telescope
    ["<leader>b"] = { "<cmd>Telescope buffers previewer=false theme=dropdown<cr>", "Buffers" },
    ["<leader>f"] = {
      "<cmd>Telescope find_files previewer=false theme=dropdown<cr>",
      "Find files",
    },
    ["<leader>F"] = {
      "<cmd>Telescope live_grep theme=ivy<cr>",
      "Find Text",
    },

    -- nvimtree
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- lsp
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },

    -- others
    ["H"] = { "^", "^" },
    ["L"] = { "$", "$" },
    ["<leader>q"] = { ":q<cr>", "quit" },
    [";t"] = { "<cmd>TodoTrouble<cr>", "Todo" },
    [";r"] = { "<cmd>lua _QUICK_RUN()<CR>", "quick run" },
    [";g"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "lazygit" },
  },

  v = {
    ["H"] = { "^", "^" },
    ["L"] = { "$", "$" },
  },
}

M.lspconfig = {
  n = {
    ["gr"] = {
      "<cmd>TroubleToggle lsp_references<cr>",
      "lsp references",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<C-]>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<C-]>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    -- new

    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}

M.remap = {
  n = {
    ["<S-Up>"] = {"<cmd>resize +2<CR>",""},
    ["<S-Down>"] = {"<cmd>resize -2<CR>",""},
    ["<S-Left>"] = {"<cmd>vertical resize +2<CR>",""},
    ["<S-Right>"] = {"<cmd>vertical resize -2<CR>",""},
  },

  t = {
    ["<S-Up>"] = {"<cmd>resize +2<CR>",""},
    ["<S-Down>"] = {"<cmd>resize -2<CR>",""},
    ["<S-Left>"] = {"<cmd>vertical resize +2<CR>",""},
    ["<S-Right>"] = {"<cmd>vertical resize -2<CR>",""},
  },

  v = {
    ["<"] = {"<gv",""},
    [">"] = {">gv",""},
    ["p"] = {"_dP",""},
  },
}

M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>q"] = "",
    ["<leader>e"] = "",
    ["<leader>f"] = "",
    ["<leader>fa"] = "",
    ["<leader>fw"] = "",
    ["<leader>fb"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>ff"] = "",
    ["<leader>fm"] = "",
    ["<C-s>"] = "",
    ["<C-n>"] = "",
  },
}

return M

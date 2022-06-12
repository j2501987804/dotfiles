local M = {}

M.disabled = {
   -- ["<leader>q"] = "",
   ["gi"] = "",
}

M.general = {

   i = {

      -- go to  beginning and end
      ["<C-b>"] = { "<ESC>^i", "論 beginning of line" },
      ["<C-e>"] = { "<End>", "壟 end of line" },
   },

   n = {
      ["<leader>q"] = { ":q<cr>", "quit" },

      ["H"] = { "^", "^" },
      ["L"] = { "$", "$" },
      ["<C-d>"] = { "15j", "" },
      ["<C-u>"] = { "15k", "" },

      ["<leader>gg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "laygit" },
      ["<leader>2"] = { ":UndotreeToggle<cr>", "Undo" },
      ["<leader>3"] = { "<cmd>AerialToggle<cr>", "aerial" },
      ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },

      -- search
      ["<leader>sf"] = {
         "viw:lua require('spectre').open_file_search({select_word=true})<cr>",
         "file search",
      },
      ["<leader>sp"] = {
         "<cmd>lua require('spectre').open({select_word=true})<CR>",
         "project search",
      },
      ["f"] = { ":HopWord<cr>", "hop" },

      -- tab
      ["<leader>tc"] = {
         "<cmd>tabclose<cr>",
         "tabclose",
      },
   },

   v = {
      ["H"] = { "^", "^" },
      ["L"] = { "$", "$" },
      ["<"] = { "<gv", "left indent" },
      [">"] = { ">gv", "right indent" },
   },
}

-- dap
M.dap = {
   n = {
      ["<leader>d"] = {
         name = "Debug",
         b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "toggle breakpoint" },
         B = {
            "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
            "set breakpoint",
         },
         l = {
            "<cmd>lua require'dap'.attach()<cr>",
            "attach",
         },
         g = {
            "<cmd>lua require'dap'.goto_()<cr>",
            "goto",
         },
         r = {
            "<cmd>lua require'dap'.continue()<cr>",
            "continue",
         },
         i = {
            "<cmd>lua require'dap'.step_into()<cr>",
            "step into",
         },
         c = {

            "<cmd>lua require'dap'.terminate()<cr>",
            "dap close",
         },
      },
      ["<F7>"] = { "<cmd>lua require'dap'.step_over()<cr>", "step_over" },
      ["<F8>"] = { "<cmd>lua require'dap'.step_out()<cr>", "step_out" },
      ["<F6>"] = { "<cmd>lua require'dapui'.eval()<cr>", "eval" },
   },
}

M.comment = {

   -- toggle comment in both modes
   n = {
      ["<C-_>"] = {
         function()
            require("Comment.api").toggle_current_linewise()
         end,

         "蘒  toggle comment",
      },
   },

   v = {
      ["<C-_>"] = {
         "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
         "蘒  toggle comment",
      },
   },
}

M.lspconfig = {
   -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

   n = {
      ["<leader>lr"] = {
         function()
            vim.lsp.buf.rename.float()
         end,
         "   lsp rename",
      },

      ["gr"] = { "<cmd>TroubleToggle lsp_references<cr>", "   lsp references" },

      ["[d"] = {
         function()
            vim.diagnostic.goto_prev()
         end,
         "   goto prev",
      },

      ["]d"] = {
         function()
            vim.diagnostic.goto_next()
         end,
         "   goto_next",
      },

      ["<leader>lf"] = {
         function()
            vim.lsp.buf.formatting()
         end,
         "   lsp formatting",
      },

      ["<leader>ls"] = {
         "<cmd>LspRestart<cr>",
         "LspRestart",
      },

      ["<leader>lq"] = {
         "<cmd>TroubleToggle quickfix<cr>",
         "quickfix",
      },

      ["<leader>wq"] = {
         "<cmd>TroubleToggle workspace_diagnostics<cr>",
         "   diagnostic setloclist",
      },
   },
}

M.telescope = {
   n = {
      -- find
      ["<leader>ff"] = { "<cmd> Telescope find_files previewer=false theme=dropdown<CR>", "  find files" },
      ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
      ["<leader>fw"] = { "<cmd> Telescope live_grep theme=ivy<CR>", "   live grep" },
      ["<leader>fb"] = { "<cmd> Telescope buffers  previewer=false theme=dropdown<CR>", "  find buffers" },
      ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
      ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
      ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

      -- git
      ["<leader>cm"] = { "<cmd> Telescope git_commits  previewer=false theme=dropdown<CR>", "   git commits" },
      ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },

      -- pick a hidden term
      ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },

      -- theme switcher
      ["<leader>th"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },
   },
}

M.whichkey = {
   n = {
      ["<leader>wK"] = {
         function()
            vim.cmd "WhichKey"
         end,
         "   which-key all keymaps",
      },
      ["<leader>wk"] = {
         function()
            local input = vim.fn.input "WhichKey: "
            vim.cmd("WhichKey " .. input)
         end,
         "   which-key query lookup",
      },
   },
}

M.git = {
   n = {
      name = "git",
      ["<leader>g"] = {
         ["d"] = {
            "<cmd>DiffviewOpen<cr>",
            "DiffviewOpen",
         },

         ["h"] = {
            "<cmd>DiffviewFileHistory<cr>",
            "DiffviewFileHistory",
         },

         ["b"] = {
            "<cmd>Telescope git_branches<cr>",
            "Checkout branch",
         },
      },
   },
}

return M

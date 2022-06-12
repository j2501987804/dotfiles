return {
   defaults = {
      mappings = {
         i = {
            ["<C-n>"] = require("telescope.actions").cycle_history_next,
            ["<C-p>"] = require("telescope.actions").cycle_history_prev,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
         },
      },
   },

   extensions = {
      ["ui-select"] = {
         require("telescope.themes").get_dropdown {},
      },
      fzf = {
         fuzzy = true, -- false will only do exact matching
         override_generic_sorter = true, -- override the generic sorter
         override_file_sorter = true, -- override the file sorter
         case_mode = "smart_case", -- or "ignore_case" or "respect_case"
         -- the default case_mode is "smart_case"
      },
   },
   extensions_list = { "fzf", "themes", "terms", "ui-select", "dap" },
}

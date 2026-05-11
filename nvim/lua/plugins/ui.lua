vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

require "nvchad"
require("base46").load_all_highlights()

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "blink")
dofile(vim.g.base46_cache .. "treesitter")
dofile(vim.g.base46_cache .. "git")
dofile(vim.g.base46_cache .. "whichkey")

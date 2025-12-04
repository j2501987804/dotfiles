vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

require("options")
require("keymaps")
require("autocmds")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        "nvim-lua/plenary.nvim",
        { "nvim-tree/nvim-web-devicons", lazy = true },

        {
            "nvchad/ui",
            config = function()
                require "nvchad"
            end
        },

        {
            "nvchad/base46",
            lazy = true,
            build = function()
                require("base46").load_all_highlights()
            end,
        },

        "nvchad/volt", -- optional, needed for theme switcher
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})


-- blankline
-- blink
-- cmp
-- colors
-- defaults
-- devicons
-- git
-- lsp
-- mason
-- nvcheatsheet
-- nvimtree
-- statusline
-- syntax
-- tbline
-- telescope
-- term
-- treesitter
-- whichkey
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "blink")
dofile(vim.g.base46_cache .. "colors")
dofile(vim.g.base46_cache .. "devicons")
dofile(vim.g.base46_cache .. "git")
dofile(vim.g.base46_cache .. "tbline")
dofile(vim.g.base46_cache .. "treesitter")
dofile(vim.g.base46_cache .. "whichkey")
dofile(vim.g.base46_cache .. "blankline")
dofile(vim.g.base46_cache .. "syntax")
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
    print(v)
    -- dofile(vim.g.base46_cache .. v)
end

local M = {}

M.theme = function()
    require("catppuccin").setup({
        integrations = {
            telescope = { enabled = true, style = "nvchad" },
            illuminate = true,
            which_key = true,
        },
        transparent_background = false,
    })
    vim.cmd.colorscheme 'catppuccin'
end

M.treesitter = function()
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = { 'lua', 'bash', 'go', 'python', 'markdown', 'markdown_inline' },
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    }
end

M.telescope = function()
    require('telescope').setup({
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            mappings = {
                i = {
                    ["<C-n>"] = require "telescope.actions".cycle_history_next,
                    ["<C-p>"] = require "telescope.actions".cycle_history_prev,
                    ["<C-j>"] = require "telescope.actions".move_selection_next,
                    ["<C-k>"] = require "telescope.actions".move_selection_previous,
                }
            },
            layout_config = {
                horizontal = {
                    preview_width = 0.6,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
            },
        },
    })

    -- projects
    require("project_nvim").setup()
    require("telescope").load_extension("projects")
    require('telescope').load_extension('fzy_native')
end

M.illuminate = function()
    require("illuminate").configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = { "lsp" },
        },
    })

    local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
            require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]]", "next")
    map("[[", "prev")

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd("FileType", {
        callback = function()
            local buffer = vim.api.nvim_get_current_buf()
            map("]]", "next", buffer)
            map("[[", "prev", buffer)
        end,
    })
end

return M

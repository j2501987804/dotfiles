return {
    lastplace = function()
        require("nvim-lastplace").setup {
            lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
            lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
            lastplace_open_folds = true,
        }
    end,

    toggleterm = function()
        local status_ok, toggleterm = pcall(require, "toggleterm")
        if not status_ok then
            return
        end

        toggleterm.setup {
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        }

        function _G.set_terminal_keymaps()
            local opts = { noremap = true }
            -- vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
        end

        vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float" }

        function _LAZYGIT_TOGGLE()
            lazygit:toggle()
        end
    end,

    undotree = function()
        vim.cmd [[
          if has("persistent_undo")
             let target_path = expand(undotree_dir)
             if !isdirectory(target_path)
                call mkdir(target_path, "p", 0700)
             endif
             let &undodir = target_path
             set undofile
        ]]
    end,
}

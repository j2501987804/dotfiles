local which_key = require "which-key"

local setup = {
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = " ",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
    ["b"] = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Buffers",
    },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["x"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    -- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["f"] = {
        "<cmd>Telescope find_files previewer=false theme=dropdown<cr>",
        "Find files",
    },
    ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    ["2"] = { ":UndotreeToggle<cr>", "Undo" },
    ["3"] = { "<cmd>AerialToggle<cr>", "aerial" },

    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    g = {
        name = "Git",
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = {
            "<cmd>DiffviewOpen<cr>",
            "Diff",
        },
    },

    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            "Document Diagnostics",
        },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        s = { "<cmd>LspRestart<cr>", "LspRestart" },
        j = {
            "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
            "Next Diagnostic",
        },
        k = {
            "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
            "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        S = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        -- s = {
        --     "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        --     "Workspace Symbols",
        -- },
    },
    s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        f = {
            "viw:lua require('spectre').open_file_search({select_word=true})<cr>",
            "file search",
        },
        p = {
            "<cmd>lua require('spectre').open({select_word=true})<CR>",
            "project search",
        },
    },

    -- t = {
    --     name = "Terminal",
    --     n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    --     u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    --     t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    --     p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    --     f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    --     h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    --     v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    -- },
    -- d = {
    --     name = "Debug",
    --     b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "toggle breakpoint" },
    --     B = {
    --         "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
    --         "set breakpoint",
    --     },
    --     l = {
    --         "<cmd>lua require'dap'.attach()<cr>",
    --         "attach",
    --     },
    --     g = {
    --         "<cmd>lua require'dap'.goto_()<cr>",
    --         "goto",
    --     },
    --     r = {
    --         "<cmd>lua require'dap'.continue()<cr>",
    --         "continue",
    --     },
    --     i = {
    --         "<cmd>lua require'dap'.step_into()<cr>",
    --         "step into",
    --     },
    --     c = {
    --         "<cmd>lua require'dap'.terminate()<cr>",
    --         "dap close",
    --     },
    --     u = {
    --         "<cmd>lua require'dapui'.toggle()<cr>",
    --         "dapui open",
    --
    --     }
    -- },
}

which_key.setup(setup)
which_key.register(mappings, opts)

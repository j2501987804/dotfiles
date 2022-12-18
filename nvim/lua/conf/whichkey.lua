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
	prefix = "",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}


local mappings = {
    ["<leader>"] = {
        ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
        ["b"] = {
            "<cmd>Telescope buffers previewer=false theme=dropdown<cr>",
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
        ["P"] = { "<cmd>Telescope projects previewer=false theme=dropdown<cr>", "Projects" },
        ["2"] = { ":UndotreeToggle<cr>", "Undo" },
        ["3"] = { "<cmd>Lspsaga outline<cr>", "outline" },

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
            -- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
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
            a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
            --     d = {
            --         "<cmd>Telescope lsp_document_diagnostics<cr>",
            --         "Document Diagnostics",
            --     },
            --     w = {
            --         "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            --         "Workspace Diagnostics",
            --     },
            f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
            --     i = { "<cmd>LspInfo<cr>", "Info" },
            --     I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
            s = { "<cmd>LspRestart<cr>", "LspRestart" },
            --     j = {
            --         "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
            --         "Next Diagnostic",
            --     },
            --     k = {
            --         "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
            --         "Prev Diagnostic",
            --     },
            --     l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
            q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
            r = { "<cmd>Lspsaga rename<CR>", "Rename" },
        },
        s = {
            name = "Search",
            b = { "<cmd>Telescope git_branches previewer=false theme=dropdown<cr>", "Checkout branch" },
            t = { "<cmd>TodoTrouble<cr>", "Todo" },
            c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
            h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
            M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
            r = { "<cmd>Telescope oldfiles previewer=false theme=dropdown<cr>", "Open Recent File" },
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
    },
    [";"] = {
        ['b'] = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>",'toggle breakpoint'},
        ['B'] = {"<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",'set breakpoint'},
        ['u'] = {"<cmd>lua require'dapui'.toggle()<cr>",'dapui open'},
        ['k'] = {"<Cmd>lua require('dapui').eval()<CR>",'dapui eval'},
        ['g'] = {"<cmd>lua _LAZYGIT_TOGGLE()<CR>",'Lazygit'},
        ['r'] = {"<cmd>lua _QUICK_RUN()<CR>",'quick run'},
    },

	['gd'] = {"<cmd>Lspsaga peek_definition<CR>", '[G]oto [D]efinition'},
    ['gr'] = {"<cmd>TroubleToggle lsp_references<cr>", '[G]oto [R]eferences'},
    ["gh"]= {"<cmd>Lspsaga lsp_finder<CR>", 'lsp_finder'},
    ['gI'] = {[[vim.lsp.buf.implementation]], '[G]oto [I]mplementation'},
    ['<leader>D'] = {[[vim.lsp.buf.type_definition]], 'Type [D]efinition'},
    -- ['<leader>ds'] = {require('telescope.builtin'},.lsp_document_symbols, '[D]ocument [S]ymbols'},
    -- ['<leader>ws'] = {require('telescope.builtin'},.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols'},

    -- See `:help K` for why this keymap
    ['K'] = {"<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation'},
    -- ['<C-k>] = {vim.lsp.buf.signature_help, 'Signature Documentation'},

    -- Lesser used LSP functionality
    ['gD'] = {[[vim.lsp.buf.declaration]], '[G]oto [D]eclaration'},
    ['<leader>wa'] = {[[vim.lsp.buf.add_workspace_folder]], '[W]orkspace [A]dd Folder'},
    ['<leader>wr'] = {[[vim.lsp.buf.remove_workspace_folder]], '[W]orkspace [R]emove Folder'},
    ['<leader>wl'] = {function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders'},
    ["]d"]={'<cmd>Lspsaga diagnostic_jump_next<CR>', 'diagnostic_jump_next'},
    ["[d"]= {'<cmd>Lspsaga diagnostic_jump_prev<CR>', 'diagnostic_jump_prev'},
}

which_key.setup(setup)
which_key.register(mappings, opts)

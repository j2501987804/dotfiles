return {
    autopairs = function()
        require("nvim-autopairs").setup({
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        })

        local cmp_autopairs = require "nvim-autopairs.completion.cmp"

        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,

    luasnip = function()
        require("luasnip").config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
        })

        require("luasnip.loaders.from_vscode").lazy_load()
    end,

    signature = function()
        require("lsp_signature").setup({
            bind = true,
            doc_lines = 0,
            floating_window = true,
            fix_pos = true,
            hint_enable = true,
            hint_prefix = " ",
            hint_scheme = "String",
            hi_parameter = "Search",
            max_height = 22,
            max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
            handler_opts = {
                border = "rounded", -- double, single, shadow, none
            },
            zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
            padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
        })
    end,

    colorizer = function()
        require("colorizer").setup({
            filetypes = {
                "*",
            },
            user_default_options = {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = false, -- "Name" codes like Blue
                RRGGBBAA = false, -- #RRGGBBAA hex codes
                rgb_fn = false, -- CSS rgb() and rgba() functions
                hsl_fn = false, -- CSS hsl() and hsla() functions
                css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn

                -- Available modes: foreground, background
                mode = "background", -- Set the display mode.
            },
        })
        vim.cmd "ColorizerReloadAllBuffers"
    end,

    lastplace = function()
        require 'nvim-lastplace'.setup {
            lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
            lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
            lastplace_open_folds = true
        }
    end,

    lspsaga = function()
        require("lspsaga").setup { -- defaults ...
            border_style = "round", -- single
        }
    end,

    comment = function()
        local present, nvim_comment = pcall(require, "Comment")

        if not present then
            return
        end

        local options = {}
        nvim_comment.setup(options)
    end,

    blankline = function()
        require("indent_blankline").setup({
            show_current_context = true,
        })
    end,
}

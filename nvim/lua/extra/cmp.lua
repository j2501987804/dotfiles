local M = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        "rafamadriz/friendly-snippets",
        'saadparwaiz1/cmp_luasnip',
        { 'echasnovski/mini.pairs', opts = {} },
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
}

M.config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    local cmp = require 'cmp'
    local function border(hl_name)
        return {
            { "╭", hl_name },
            { "─", hl_name },
            { "╮", hl_name },
            { "│", hl_name },
            { "╯", hl_name },
            { "─", hl_name },
            { "╰", hl_name },
            { "│", hl_name },
        }
    end

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        window = {
            completion = {
                border = border "CmpBorder",
                winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            },
            documentation = {
                border = border "CmpDocBorder",
                winhighlight = "Normal:CmpDoc",
            },
        },
        preselect = cmp.PreselectMode.None,
        formatting = {
            format = function(_, vim_item)
                local icons = require("icons").lspkind
                vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
                return vim_item
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            -- luasnip
            ["<Tab>"] = cmp.mapping(function(fallback)
                if require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
            { name = 'path' },
        })
    })

    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
    -- Customization for Pmenu
    vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#4e5882" })
    vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#4e5882" })

    local selectColor = { bg = "#a6e3a1", fg = "#1c1018" }
    vim.api.nvim_set_hl(0, "TelescopeSelection", selectColor)
    vim.api.nvim_set_hl(0, "PmenuSel", selectColor)
    vim.api.nvim_set_hl(0, "Pmenu", selectColor)
end

return M

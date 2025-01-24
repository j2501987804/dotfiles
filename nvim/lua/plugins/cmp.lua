return {
    {
        "windwp/nvim-autopairs",
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
            require("nvim-autopairs").setup(opts)

            -- setup cmp for autopairs
            -- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            -- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        'saghen/blink.cmp',
        -- event = "InsertEnter",
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts_extend = { "sources.default" },
        opts = {
            keymap = {
                preset = 'enter',
                ['<c-k>'] = { 'select_prev', 'fallback' },
                ['<c-j>'] = { 'select_next', 'fallback' },
            },
            snippets = {
                -- preset = 'default',
                expand = function(snippet) vim.snippet.expand(snippet) end,
                active = function(filter) return vim.snippet.active(filter) end,
                -- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
                jump = function(direction) vim.snippet.jump(direction) end,
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { 'lsp', 'snippets', 'buffer', 'path' },
                cmdline = function()
                    local type = vim.fn.getcmdtype()
                    -- Search forward and backward
                    if type == '/' or type == '?' then return { 'buffer' } end
                    -- Commands
                    if type == ':' or type == '@' then return { 'cmdline' } end
                    return {}
                end,
            },
            completion = {
                list = { selection = { preselect = true, auto_insert = true } },
                menu = {
                    enabled = true,
                    min_width = 30,
                    max_height = 10,
                    border = 'rounded',
                    winblend = 10,
                    winhighlight =
                    'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
                    auto_show = true,

                    -- Screen coordinates of the command line
                    cmdline_position = function()
                        if vim.g.ui_cmdline_pos ~= nil then
                            local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
                            return { pos[1] - 1, pos[2] }
                        end
                        local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
                        return { vim.o.lines - height, 0 }
                    end,
                },
                documentation = {
                    -- Controls whether the documentation window will automatically show when selecting a completion item
                    auto_show = true,
                    -- Delay before showing the documentation window
                    auto_show_delay_ms = 500,
                    -- Delay before updating the documentation window when selecting a new item,
                    -- while an existing item is still visible
                    update_delay_ms = 50,
                    -- Whether to use treesitter highlighting, disable if you run into performance issues
                    treesitter_highlighting = true,
                    window = {
                        min_width = 10,
                        max_width = 80,
                        max_height = 20,
                        border = 'rounded',
                        winblend = 10,
                        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                        scrollbar = true,
                        direction_priority = {
                            menu_north = { 'e', 'w', 'n', 's' },
                            menu_south = { 'e', 'w', 's', 'n' },
                        },
                    },
                }
            },
        },
    },
}

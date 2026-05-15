return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    build = ':TSUpdate',
    config = function()
        pcall(function()
            dofile(vim.g.base46_cache .. "syntax")
            dofile(vim.g.base46_cache .. "treesitter")
        end)
        require('nvim-treesitter').install({
            'go', 'gomod', 'gosum', 'gowork', 'lua', 'vim', 'markdown',
            'rust',
            'javascript',
            'typescript',
            'tsx',
            'zig',
            'lua',
            'vim',
            'vimdoc',
        })
    end,
}

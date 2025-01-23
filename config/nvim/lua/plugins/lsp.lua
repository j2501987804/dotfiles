return {
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                "gopls",
                "gofumpt", "goimports", -- format
                "gomodifytags", "impl", -- code action
            },
        },
        config = function(_, opts)
            -- 创建自定义命令 :MasonInstallAll
            vim.api.nvim_create_user_command('MasonInstallAll', function()
                -- 拼接工具列表并执行 MasonInstall 命令
                vim.cmd('MasonInstall ' .. table.concat(opts.ensure_installed, ' '))
            end, {})
            require("mason").setup()
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            opts.sources = vim.list_extend(opts.sources or {}, {
                nls.builtins.code_actions.gomodifytags,
                nls.builtins.code_actions.impl,
                nls.builtins.formatting.goimports,
                nls.builtins.formatting.gofumpt,
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
        init = function()
            -- 配置 LSP
            local lspconfig = require('lspconfig')

            local on_attach = function(client, bufnr)
                -- 设置 LSP 相关快捷键
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                local opts = { noremap = true, silent = true }

                -- 跳转到定义
                buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                -- 显示悬浮文档
                buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
                -- 查看引用
                -- buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
                -- 查看实现
                -- buf_set_keymap('n', 'gI', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                -- 重命名
                buf_set_keymap('n', '<leader>cr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
                -- 代码操作
                buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)

                -- 启用自动格式化（在保存时触发）
                if client.server_capabilities.documentFormattingProvider then
                    -- 设置自动格式化触发时机
                    vim.api.nvim_exec([[
                        augroup LspFormatting
                            autocmd! * <buffer>
                            autocmd BufWritePre <buffer> lua vim.lsp.buf.format{focus=true}
                        augroup END
                    ]], true)
                end
            end

            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }, -- 允许全局变量 vim
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true), -- 自动检测 Neovim 运行时库
                            },
                            telemetry = {
                                enable = false, -- 禁用遥测信息
                            },
                        },
                    },
                },
                gopls = {
                    cmd = { "gopls" },                                        -- 使用 gopls 作为 Go LSP
                    filetypes = { "go", "gomod" },                            -- 支持 Go 文件和 Go 模块
                    root_dir = lspconfig.util.root_pattern("go.mod", ".git"), -- 自动识别项目根目录
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true, -- 启用未使用参数检查
                                shadow = true,       -- 启用变量名冲突检查
                            },
                            staticcheck = true,      -- 启用 Go 静态检查
                        },
                    },
                },
            }
            for server, config in pairs(servers) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                config.on_attach = on_attach
                lspconfig[server].setup(config)
            end
        end,
    },
}

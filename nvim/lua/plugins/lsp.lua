return {
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                "gopls",
                "gofumpt", "goimports", -- format
                "gomodifytags", "impl", -- code action
                "gotests", "iferr", "json-to-struct",
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
            local nls = require("null-ls").builtins
            opts.sources = {
                -- go
                nls.code_actions.gomodifytags,
                nls.code_actions.impl,
                -- nls.code_actions.gotests,
                -- nls.code_actions.iferr,
                -- nls.code_actions.json_to_struct,
                nls.formatting.goimports,
                nls.formatting.gofumpt,
            }
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
                buf_set_keymap('v', '<leader>cr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
                -- 代码操作
                buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                buf_set_keymap('v', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)

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
                    settings = {
                        gopls = {
                            gofumpt = true,
                            codelenses = {
                                gc_details = false,
                                generate = true,
                                regenerate_cgo = true,
                                run_govulncheck = true,
                                test = true,
                                tidy = true,
                                upgrade_dependency = true,
                                vendor = true,
                            },
                            -- analyses = {
                            --     fieldalignment = true,
                            --     nilness = true,
                            --     unusedparams = true,
                            --     unusedwrite = true,
                            --     useany = true,
                            -- },
                            usePlaceholders = true,
                            completeUnimported = true,
                            staticcheck = true,
                            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                            semanticTokens = true,
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

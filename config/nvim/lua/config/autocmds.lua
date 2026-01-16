vim.diagnostic.config {
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    },
    virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
            local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
        end,
    },
}

if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] =
            'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] =
            'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end

-- 记录光标上次浏览位置
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- 禁止自动注释新行
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "set formatoptions-=cro",
})

-- 自动保存
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    callback = function(args)
        -- 获取当前缓冲区信息
        local bufnr = args.buf
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        -- 排除特殊缓冲区（无文件名/终端等）
        if
            vim.api.nvim_buf_get_option(bufnr, "modified")          -- 检查是否被修改
            and vim.api.nvim_buf_get_option(bufnr, "modifiable")    -- 检查可修改性
            and not vim.api.nvim_buf_get_option(bufnr, "readonly")  -- 检查只读状态
            and bufname ~= ""                                       -- 排除无名缓冲区
            and vim.api.nvim_buf_get_option(bufnr, "buftype") == "" -- 排除特殊类型（终端等）
        then
            vim.cmd("silent! update")                               -- 静默保存（仅在修改时写入）
        end
    end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    -- stylua: ignore
    pattern = {
        "PlenaryTestPopup", "checkhealth", "dbout", "gitsigns-blame",
        "grug-far", "help", "lspinfo", "neotest-output", "neotest-output-panel",
        "neotest-summary", "notify", "qf", "spectre_panel", "startuptime", "tsplayground",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            vim.keymap.set("n", "q", function()
                vim.cmd("close")
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
                buffer = event.buf,
                silent = true,
                desc = "Quit buffer",
            })
        end)
    end,
})

-- 保存文件自动创建路径
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- go文件自动插入包名
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.go",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

        -- 如果文件不为空，直接返回
        local non_empty = false
        for _, line in ipairs(lines) do
            if line:match("%S") then
                non_empty = true
                break
            end
        end
        if non_empty then return end

        -- 获取当前目录
        local dir = vim.fn.expand("%:p:h")

        -- 尝试找到已有包名
        local pkg_name = nil
        local go_files = vim.fn.globpath(dir, "*.go", false, true) -- 获取所有 Go 文件
        for _, f in ipairs(go_files) do
            if f ~= vim.fn.expand("%:p") then                      -- 排除当前文件
                for line in io.lines(f) do
                    local m = line:match("^%s*package%s+(%S+)")
                    if m then
                        pkg_name = m
                        break
                    end
                end
                if pkg_name then break end
            end
        end

        -- 如果没有找到现有包名，使用目录名
        if not pkg_name then
            pkg_name = vim.fn.fnamemodify(dir, ":t")
            if pkg_name == "cmd" or pkg_name == "main" then
                pkg_name = "main"
            end
        end

        -- 插入 package 行
        vim.api.nvim_buf_set_lines(buf, 0, 0, false, { "package " .. pkg_name })
        vim.api.nvim_win_set_cursor(0, { 2, 0 })
    end,
})

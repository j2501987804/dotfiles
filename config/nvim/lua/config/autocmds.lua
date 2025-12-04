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
            vim.api.nvim_buf_get_option(bufnr, "modified") -- 检查是否被修改
            and vim.api.nvim_buf_get_option(bufnr, "modifiable") -- 检查可修改性
            and not vim.api.nvim_buf_get_option(bufnr, "readonly") -- 检查只读状态
            and bufname ~= ""                              -- 排除无名缓冲区
            and vim.api.nvim_buf_get_option(bufnr, "buftype") == "" -- 排除特殊类型（终端等）
        then
            vim.cmd("silent! update")                      -- 静默保存（仅在修改时写入）
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

local dap, dapui = require "dap", require "dapui"
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "TodoFgFIX", linehl = "", numhl = "" })
dapui.setup {
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has "nvim-0.7",
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "rounded", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

local configs = {
    go = {
        adapters = function(callback, _)
            local stdout = vim.loop.new_pipe(false)
            local handle
            local pid_or_err
            local port = 38697
            local opts = {
                stdio = { nil, stdout },
                args = { "dap", "-l", "127.0.0.1:" .. port },
                detached = true,
            }
            handle, pid_or_err = vim.loop.spawn("dlv", function(code)
                stdout:close()
                handle:close()
                if code ~= 0 then
                    print("dlv exited with code", code)
                end
            end, opts)
            assert(handle, "Error running dlv: " .. tostring(pid_or_err))
            stdout:read_start(function(err, chunk)
                assert(not err, err)
                if chunk then
                    vim.schedule(function()
                        require("dap.repl").append(chunk)
                    end)
                end
            end)
            -- Wait for delve to start
            vim.defer_fn(function()
                callback { type = "server", host = "127.0.0.1", port = port }
            end, 100)
        end,

        configurations = {
            {
                type = "go",
                name = "Debug Project",
                request = "launch",
                program = "${workspaceFolder}",
            },
            {
                type = "go",
                name = "Debug File",
                request = "launch",
                program = "${file}",
            },
            {
                type = "go",
                name = "Debug test", -- configuration for debugging test files
                request = "launch",
                mode = "test",
                program = "${file}",
            },
            -- works with go.mod packages and sub packages
            {
                type = "go",
                name = "Debug test (go.mod)",
                request = "launch",
                mode = "test",
                program = "./${relativeFileDirname}",
            },
        },
    },
}

for name, config in pairs(configs) do
    dap.adapters[name] = config.adapters
    dap.configurations.go = config.configurations
end

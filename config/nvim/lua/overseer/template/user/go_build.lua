return {
    name = "go build",
    builder = function()
        return {
            cmd = { "go", "build", "-o", "/tmp/golang", vim.fn.expand("%:p:h") },
            components = {
                {
                    "on_output_quickfix",
                    open = true,
                    close = true,
                    items_only = true,
                },
                "default",
            },
        }
    end,
    condition = { filetype = { "go" } },
}

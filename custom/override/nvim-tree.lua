local tree_cb = require("nvim-tree.config").nvim_tree_callback

local list = {
    { key = { "<CR>", "o", "l" }, action = "edit", mode = "n" },
    { key = "s", cb = tree_cb "split" }, --tree_cb and the cb property are deprecated
    { key = "v", cb = tree_cb "vsplit" }, --tree_cb and the cb property are deprecated
    { key = "h", cb = tree_cb "close_node" }, --tree_cb and the cb property are deprecated
    { key = "<2-RightMouse>", action = "" }, -- will remove default cd action
}
return {
    view = {
        side = "left",
        hide_root_folder = true,
        mappings = {
            custom_only = false,
            list = list,
        },
    },

    -- 支持git
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },

    renderer = {
        highlight_git = true,
        highlight_opened_files = "none",

        indent_markers = {
            enable = false,
        },
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
}

return {
    setup = function()
        local fn = vim.fn

        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
        -- Automatically install packer
        local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                install_path }
            print "Installing packer close and reopen Neovim..."
            vim.cmd [[packadd packer.nvim]]
            require "plugins"
            vim.cmd "PackerSync"
        end

    end,

    run = function(plugins)
        local packer = require("packer")
        -- Have packer use a popup window
        packer.init {
            display = {
                open_fn = function()
                    return require("packer.util").float { border = "rounded" }
                end,
            },
        }

        packer.startup(function(use)
            for key, value in pairs(plugins) do
                value[1] = key
                use(value)
            end
        end)
    end,

    packer_lazy_load = function(plugin)
        vim.defer_fn(function()
            require("packer").loader(plugin)
        end, 0)
    end
}

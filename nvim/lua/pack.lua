return {
    setup = function()
        local fn = vim.fn

        -- Automatically install packer
        local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            PACKER_BOOTSTRAP = fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                install_path }
            print "Installing packer close and reopen Neovim..."
            vim.cmd [[packadd packer.nvim]]
        end

        -- Have packer use a popup window
        require("packer").init {
            display = {
                open_fn = function()
                    return require("packer.util").float { border = "rounded" }
                end,
            },
        }
    end,

    run = function(plugins)
        return require("packer").startup(function(use)
            for key, value in pairs(plugins) do
                value[1] = key
                use(value)
            end
            if PACKER_BOOTSTRAP then
                require("packer").sync()
            end
        end)
    end,

    packer_lazy_load = function(plugin)
        vim.defer_fn(function()
            require("packer").loader(plugin)
        end, 0)
    end
}

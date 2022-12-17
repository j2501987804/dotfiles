return {
	setup = function()
		local fn = vim.fn
		-- Automatically install packer
		local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			PACKER_BOOTSTRAP = fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
				install_path, }
			print "Installing packer close and reopen Neovim..."
			vim.cmd [[packadd packer.nvim]]
		end
	end,

	run = function(plugins)
		-- Have packer use a popup window
		local packer = require("packer")
		packer.init {
			display = {
				open_fn = function()
					return require("packer.util").float { border = "rounded" }
				end,
			},
			git = {
				clone_timeout = 300, -- Timeout, in seconds, for git clones
			},
		}

		packer.startup(function(use)
			for _, value in pairs(plugins) do
				use(value)
			end

			-- Automatically set up your configuration after cloning packer.nvim
			-- Put this at the end after all plugins
			if PACKER_BOOTSTRAP then
				require("packer").sync()
			end
		end)
	end,

	is_linux = function()
		return vim.fn.has("linux") == 1
	end,

	-- mac
	is_mac = function()
		return vim.fn.has("mac") == 1
	end,
}

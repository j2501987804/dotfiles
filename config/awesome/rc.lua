pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")
-- Theme --
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/catppuccin/theme.lua")

-- Main/Configuration --
require "main"

-- Libraries/Modules --
require "lib"

-- Signals/Monitoring --
require "signals"

-- Ui/Panels --
require "ui"

-- Autostart --
awful.spawn.with_shell("input-remapper-control --command autoload")
awful.spawn.with_shell("utools")
awful.spawn.with_shell("flameshot")
awful.spawn.with_shell("copyq")
-- awful.spawn.with_shell("picom")
awful.spawn.with_shell("blueberry")
awful.spawn.with_shell("nm-applet")
awful.spawn.with_shell("fcitx5 -d")
awful.spawn.with_shell("clash")
awful.spawn.with_shell("start-stop-daemon mpDris2 -q") -- OpenRC mpDris2 since no service file -- 

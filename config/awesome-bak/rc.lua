pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local run = require("helpers.run")
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
run.run_once_grep("utools")
run.run_once_grep("flameshot")
run.run_once_grep("copyq")
run.run_once_grep("picom")
run.run_once_grep("blueberry")
run.run_once_grep("nm-applet")
run.run_once_grep("fcitx5")
run.run_once_grep("clash")
-- awful.spawn.with_shell("start-stop-daemon mpDris2 -q") -- OpenRC mpDris2 since no service file --
local awful = require("awful")
local l = awful.layout.suit
local names = { "", "", "", "", "", "" }
local layouts = { l.tile, l.tile, l.tile, l.floating, l.floating, l.floating }

screen.connect_signal("request::desktop_decoration", function(s)
	awful.tag(names, s, layouts)
end)

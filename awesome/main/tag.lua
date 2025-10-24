local awful = require("awful")
require("awful.autofocus")

local tag = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }

awful.screen.connect_for_each_screen(function(s)
	awful.tag(tag, s, awful.layout.layouts[1])
end)

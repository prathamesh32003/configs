local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local traywidgets = {}

function traywidgets.mytextclock(s)
	local mytextclock = wibox.widget({
		screen = s,
		widget = wibox.widget.textclock(),
	})
	return mytextclock
end

function traywidgets.mysystray(s)
	local mysystray = wibox.widget({
		screen = s,
		widget = wibox.widget.systray(),
	})
	return mysystray
end

return traywidgets

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local appearance = {
	mytaglist = require("appearance.taglist"),
	mytasklist = require("appearance.tasklist"),
	setwallpaper = require("appearance.wallpaper"),
	mytraywidgets = require("appearance.tray"),
}

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	appearance.setwallpaper(s)

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			appearance.mytaglist(s),
			s.mypromptbox,
		},
		appearance.mytasklist(s),
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			appearance.mytraywidgets.mysystray(s),
			appearance.mytraywidgets.mytextclock(s),
			s.mylayoutbox,
		},
	})
end)

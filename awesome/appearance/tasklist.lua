local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local theme = beautiful.get()

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

-- Create a tasklist widget
local function mytasklist(s)
	return awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,

		style = {
			font = theme.font,
			bg_normal = theme.colors.base,
			bg_focus = theme.colors.base,
			bg_urgent = theme.colors.red,
			fg_normal = theme.colors.white,
			fg_focus = theme.colors.white,
		},
		widget_template = {
			{ -- Main container
				{ -- This container will center its content
					{ -- The actual content (icon + text)
						{
							id = "icon_role",
							widget = wibox.widget.imagebox,
							valign = "center",
						},
						{
							id = "text_role",
							widget = wibox.widget.textbox,
							align = "center",
							valign = "center",
						},
						layout = wibox.layout.fixed.horizontal,
						spacing = 8,
					},
					widget = wibox.container.place, -- Centers the content
				},
				left = 12,
				right = 12,
				top = 6,
				bottom = 6,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
			bg = theme.colors.surface0,
		},
	})
end

return mytasklist

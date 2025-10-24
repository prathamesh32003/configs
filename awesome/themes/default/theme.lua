---------------------------
-- Catppuccin Mocha theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

-- Catppuccin Mocha color palette
local colors = {
	rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
}

theme.font = "IntoneMono Nerd Font Propo 9"

-- Background colors
theme.bg_normal = colors.base
theme.bg_focus = colors.surface0
theme.bg_urgent = colors.red
theme.bg_minimize = colors.surface1
theme.bg_systray = colors.mantle

-- Foreground colors
theme.fg_normal = colors.text
theme.fg_focus = colors.text
theme.fg_urgent = colors.crust
theme.fg_minimize = colors.overlay0

-- Borders and gaps
theme.useless_gap = dpi(4)
theme.border_width = dpi(2)
theme.border_normal = colors.mantle
theme.border_focus = colors.lavender
theme.border_marked = colors.peach

-- Taglist colors
theme.taglist_bg_focus = colors.lavender
theme.taglist_fg_focus = colors.crust
theme.taglist_bg_urgent = colors.red
theme.taglist_fg_urgent = colors.crust
theme.taglist_bg_occupied = colors.surface0
theme.taglist_fg_occupied = colors.text
theme.taglist_bg_empty = colors.base
theme.taglist_fg_empty = colors.overlay0
theme.taglist_bg_volatile = colors.peach
theme.taglist_fg_volatile = colors.crust

-- Tasklist colors
theme.tasklist_bg_focus = colors.surface0
theme.tasklist_fg_focus = colors.text
theme.tasklist_bg_urgent = colors.red
theme.tasklist_fg_urgent = colors.crust
theme.tasklist_bg_normal = colors.base
theme.tasklist_fg_normal = colors.overlay0

-- Titlebar colors
theme.titlebar_bg_normal = colors.base
theme.titlebar_fg_normal = colors.text
theme.titlebar_bg_focus = colors.surface0
theme.titlebar_fg_focus = colors.text

-- Tooltip styling
theme.tooltip_bg = colors.mantle
theme.tooltip_fg = colors.text
theme.tooltip_border_color = colors.surface0
theme.tooltip_border_width = dpi(1)
theme.tooltip_opacity = 0.8
theme.tooltip_font = "IntoneMono Nerd Font Propo 9"

-- Hotkeys popup
theme.hotkeys_bg = colors.mantle
theme.hotkeys_fg = colors.text
theme.hotkeys_border_color = colors.lavender
theme.hotkeys_border_width = dpi(2)
theme.hotkeys_font = "IntoneMono Nerd Font Propo 9"
theme.hotkeys_description_font = "IntoneMono Nerd Font Propo 8"
theme.hotkeys_group_margin = dpi(10)

-- Notifications
theme.notification_font = "IntoneMono Nerd Font Propo 9"
theme.notification_bg = colors.mantle
theme.notification_fg = colors.text
theme.notification_border_color = colors.surface0
theme.notification_border_width = dpi(1)
theme.notification_width = dpi(300)
theme.notification_height = dpi(80)
theme.notification_margin = dpi(10)
theme.notification_opacity = 0.8
theme.notification_shape = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, dpi(6))
end

-- Generate taglist squares with Catppuccin colors
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, colors.lavender)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, colors.overlay0)

-- Menu styling
theme.menu_bg_normal = colors.mantle
theme.menu_bg_focus = colors.lavender
theme.menu_fg_normal = colors.text
theme.menu_fg_focus = colors.crust
theme.menu_border_color = colors.surface0
theme.menu_border_width = dpi(1)
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(20)
theme.menu_width = dpi(160)

-- Titlebar buttons (using default but you could replace with colored versions)
theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "default/titlebar/maximized_focus_active.png"

-- Wallpaper (you might want to set your own Catppuccin-themed wallpaper)
theme.wallpaper = themes_path .. "default/background.png"

-- Layout icons (using default, but you could create Catppuccin-colored ones)
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon with Catppuccin colors
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, colors.lavender, colors.crust)

-- Define the icon theme for application icons
theme.icon_theme = "Papirus-Dark"

-- Additional Catppuccin-themed variables
theme.colors = colors -- Make colors available for other configs

-- Prompt colors
theme.prompt_bg = colors.mantle
theme.prompt_fg = colors.text

-- Mouse finder
theme.mouse_finder_color = colors.peach
theme.mouse_finder_timeout = 0.5
theme.mouse_finder_animate_timeout = 0.5

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

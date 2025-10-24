local gears = require("gears")
local terminal = "kitty"
local editor = "nvim"
local _M = {
	terminal = "kitty",
	editor = "nvim",
	editor_cmd = terminal .. " -e " .. editor,
	modkey = "Mod4",
	configpath = gears.filesystem.get_xdg_config_home(),
}

return _M

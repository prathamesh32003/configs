-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local beautiful = require("beautiful")

local vars = require("main.user_variables")
configpath = vars.configpath

require("main.error")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(configpath .. "awesome/themes/default/theme.lua")
beautiful.useless_gap = 5

local mylayouts = require("main.layouts")
awful.layout.layouts = mylayouts

require("main.tag")
require("appearance.wibar")

local globalbuttons = require("keys.globalbuttons")
root.buttons(globalbuttons)

local globalkeys = require("keys.globalkey")
root.keys(globalkeys)

local myrules = require("main.rules")
awful.rules.rules = myrules

require("main.signals")

require("modules.autostart")

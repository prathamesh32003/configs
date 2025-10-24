local awful = require("awful")

awful.spawn.with_shell("pidof Discord || flatpak run com.discordapp.Discord", {})
awful.spawn.with_shell("pidof steam || GTK_THEME=Adwaita-Dark steam -silent", {})

client.connect_signal("property::urgent", function(c)
	local tag6 = awful.tag.find_by_name(awful.screen.focused(), "6")

	if tag6 and c.first_tag == tag6 then
		c.urgent = false
	end
end)

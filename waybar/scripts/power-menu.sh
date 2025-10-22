#!/bin/bash

selected=$(echo -e "Shutdown\nReboot\nLogout\nSuspend" | wofi --dmenu --prompt="Power Menu" --height=80 --width=60 --location=top_right --xoffset=-130)

case "$selected" in
    "Shutdown")
        systemctl poweroff ;;
    "Reboot")
        systemctl reboot ;;
    "Logout")
        riverctl exit ;;
    "Suspend")
        systemctl suspend ;;
esac

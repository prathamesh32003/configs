#!/bin/bash

# Get current brightness percentage
brightness=$(brightnessctl | awk -F'[()]' '/Current brightness/{print $2}' | tr -d '%')

# Determine class based on brightness level
if [ "$brightness" -ge 70 ]; then
    class="high"
elif [ "$brightness" -ge 30 ]; then
    class="medium"
else
    class="low"
fi

# Output JSON for Waybar (now with class)
printf '{"percentage": %d, "class": "%s"}\n' "$brightness" "$class"

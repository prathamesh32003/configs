#!/bin/bash

# Get volume status
volume=$(pamixer --get-volume)
muted=$(pamixer --get-mute)

# Determine icon and class
if [ "$muted" = "true" ]; then
    icon="󰝟"
    class="muted"
elif [ "$volume" -eq 0 ]; then
    icon="󰕿"
    class="low"
elif [ "$volume" -lt 30 ]; then
    icon="󰕿"
    class="low"
elif [ "$volume" -lt 70 ]; then
    icon="󰖀"
    class="medium"
else
    icon="󰕾"
    class="high"
fi

# Output JSON
printf '{"text":"%s %d%%","class":"%s"}\n' "$icon" "$volume" "$class"

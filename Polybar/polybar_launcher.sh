#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch
sleep 5;
polybar --reload -c ~/Dotfiles/Polybar/polybar_config main &

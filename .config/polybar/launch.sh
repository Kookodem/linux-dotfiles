#!/usr/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch top and bottom with custom theme
if [[ $# -ne 1 ]]; then
	polybar top &
	polybar bottom &
	polybar ext &
	echo "WARNING: No theme applied to polybar"
else
	polybar -c $HOME/.config/polybar/themes/$THEME top &
	polybar -c $HOME/.config/polybar/themes/$THEME bottom &
	polybar -c $HOME/.config/polybar/themes/$THEME right &
	polybar -c $HOME/.config/polybar/themes/$THEME left &
fi 

echo "Bars launched..."

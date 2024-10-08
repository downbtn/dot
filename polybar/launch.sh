#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

source ~/.profile

# Launch bar1 and bar2
polybar top &
polybar bottom &

echo "polybars launched..."

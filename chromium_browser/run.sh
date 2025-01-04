#!/usr/bin/env bash
set -e

# Start X Start your X server, window manager, etc.
Xvfb :0 -screen 0 1280x800x24 &
sleep 2

# Start Xfce
startxfce4 &

# Start x11vnc
x11vnc -display :0 -nopw -forever -bg

# Start noVNC on port 8099 (example)
websockify --web=/usr/share/novnc/ 8099 localhost:5900 &

# Launch Google Chrome in that environment
DISPLAY=:0 google-chrome --no-sandbox --disable-dev-shm-usage &

# Keep container alive
tail -f /dev/null


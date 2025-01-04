#!/usr/bin/env bash
set -e

DISPLAY=:0
Xvfb $DISPLAY -screen 0 1280x800x24 &
sleep 2
startxfce4 &

# x11vnc (no password by default, could add pass)
x11vnc -display $DISPLAY -nopw -forever -bg

# noVNC on port 8080 (container-side)
websockify --web=/usr/share/novnc/ 8080 localhost:5900 &

# Start Chromium
DISPLAY=$DISPLAY chromium-browser --no-sandbox --disable-dev-shm-usage "$start_url" &

# Keep container alive
while true; do
  sleep 3600
done

#!/usr/bin/env bash
set -e

# Start X server
Xvfb :0 -screen 0 1280x800x24 &
sleep 2

# Start Xfce
startxfce4 &

# x11vnc
x11vnc -display :0 -nopw -forever -bg

# Make sure noVNC is on the SAME port as ingress_port
websockify --web=/usr/share/novnc/ 8099 localhost:5900 &

# Launch Chromium
DISPLAY=:0 chromium-browser --no-sandbox --disable-dev-shm-usage &

# Keep container alive
while true; do
  sleep 3600
done

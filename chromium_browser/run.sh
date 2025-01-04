#!/usr/bin/env bash
set -e

# Start your X server, window manager, etc.
Xvfb :0 -screen 0 1280x800x24 &
sleep 2
startxfce4 &

# Start x11vnc
x11vnc -display :0 -nopw -forever -bg

# Ensure noVNC has a default index:
ln -sf /usr/share/novnc/vnc_auto.html /usr/share/novnc/index.html

# Run noVNC on 8099 (must match your add-on config if using Ingress)
websockify --web=/usr/share/novnc/ 8099 localhost:5900 &

# Start Chromium
DISPLAY=:0 chromium-browser --no-sandbox --disable-dev-shm-usage "https://google.com" &

# Keep container alive
while true; do
  sleep 3600
done

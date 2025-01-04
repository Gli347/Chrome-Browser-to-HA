#!/usr/bin/env bash
set -e

# Variables
DISPLAY_NUM=:0

# Start virtual X server in the background
Xvfb $DISPLAY_NUM -screen 0 1280x800x24 &

# Wait a bit for Xvfb to start
sleep 2

# Start the desktop environment (Xfce)
startxfce4 &

# Start x11vnc (no password by default)
# To set a password, create it with:
#   x11vnc -storepasswd yourpassword /root/.vnc/passwd
# then run:
#   x11vnc -display $DISPLAY_NUM -rfbauth /root/.vnc/passwd -forever -bg
x11vnc -display $DISPLAY_NUM -nopw -forever -bg

# Start noVNC on port 8080
websockify --web=/usr/share/novnc/ 8080 localhost:5900 &
echo "noVNC is running on port 8080"

# Start Chromium browser (adjust options as needed)
DISPLAY=$DISPLAY_NUM chromium-browser --no-sandbox --disable-dev-shm-usage &

# Keep container alive
while true; do
  sleep 3600
done

#!/usr/bin/env bash
set -e

# Lockfile, Delete previous startup lock files 
rm -f /tmp/.X0-lock

#Add Dbus files
mkdir -p /run/dbus

#Optionally launch dbus if you really want the system bus:
dbus-daemon --system --fork

# Start a virtual X server (headless)
Xvfb :0 -screen 0 1280x800x24 &
sleep 2
#Alternatively use "startxfc4 &"
###Don't "use Xvfb" and "startxfce4 &"###
#startxfce4 &

# Start Xfce (this calls /usr/bin/X via xinit under the hood)
xfce4-session &

# Start x11vnc
x11vnc -display :0 -nopw -forever -bg

# Start noVNC on port 8099 (example)
websockify --web=/usr/share/novnc/ 8099 localhost:5900 &

# Launch Google Chrome or Firefox
#DISPLAY=:0 firefox & 
# Launch Chrome with GPU disabled
DISPLAY=:0 google-chrome \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu \
  --disable-software-rasterizer \
  "https://google.com" &
  
# Keep container alive
tail -f /dev/null


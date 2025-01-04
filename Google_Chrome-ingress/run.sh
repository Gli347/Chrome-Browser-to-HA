#!/usr/bin/env bash
set -e

# Fjern gammel låsefil og sett DISPLAY
rm -f /tmp/.X0-lock
export DISPLAY=:0

# Opprett nødvendige mapper og start D-Bus
mkdir -p /run/dbus
dbus-daemon --system --fork

# Generer machine-id hvis mangler
if [ ! -s /etc/machine-id ]; then
    dbus-uuidgen > /etc/machine-id
fi

# Sett XDG_RUNTIME_DIR
export XDG_RUNTIME_DIR=/tmp/xdg
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR

# Start Xvfb
Xvfb :0 -screen 0 1280x800x24 &
sleep 2

# Start xfce4-session
xfce4-session &

# Start x11vnc
x11vnc -display :0 -nopw -forever -bg

# Start noVNC
websockify --web=/usr/share/novnc/ 8099 localhost:5900 &

# Start Google Chrome
google-chrome \
    --no-sandbox \
    --disable-gpu \
    --disable-software-rasterizer \
    --disable-dev-shm-usage \
    --start-maximized \
    "$START_URL" &

# Hold containeren i live
tail -f /dev/null

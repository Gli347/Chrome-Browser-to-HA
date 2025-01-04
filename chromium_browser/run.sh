#!/usr/bin/env bash
set -e

# Les verdier fra Home Assistant:
RESOLUTION="${resolution:-1280x800}"
KIOSK_MODE="${kiosk:-false}"
START_URL="${start_url:-https://google.com}"
VNC_PASSWD="${vnc_password:-}"

DISPLAY_NUM=:0

# Start virtuell skjerm
Xvfb $DISPLAY_NUM -screen 0 ${RESOLUTION}x24 &

sleep 2

# Start Xfce
startxfce4 &

# Sett opp x11vnc:
if [ -n "$VNC_PASSWD" ]; then
  # Bruk passord om definert
  x11vnc -display $DISPLAY_NUM -rfbauth /root/.vnc/passwd -forever -bg
else
  # Ikke bruk passord
  x11vnc -display $DISPLAY_NUM -nopw -forever -bg
fi

# Start noVNC
websockify --web=/usr/share/novnc/ 8080 localhost:5900 &

# Bygg argumenter for kiosk
CHROMIUM_ARGS="--no-sandbox --disable-dev-shm-usage"
if [ "$KIOSK_MODE" = "true" ]; then
  CHROMIUM_ARGS="$CHROMIUM_ARGS --kiosk"
fi

# Start Chromium:
DISPLAY=$DISPLAY_NUM chromium-browser $CHROMIUM_ARGS "$START_URL" &

# Hold containeren i gang
while true; do
  sleep 3600
done

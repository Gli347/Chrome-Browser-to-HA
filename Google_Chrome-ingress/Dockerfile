FROM ubuntu:22.04

# 1. Install base packages for Xfce, X server, VNC, noVNC, etc.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \
    gnupg2 \
    ca-certificates \
    curl \
    supervisor \
    xfce4 \
    xfce4-terminal \
    x11vnc \
    xvfb \
    wmctrl \
    xinit \
    novnc \
    websockify \
    # Additional X server + D-Bus packages:
    xserver-xorg-core \
    xserver-xorg-input-all \
    xserver-xorg-video-all \
    x11-xserver-utils \
    dbus-x11 \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Add Google’s official Linux signing key and repo, then install Google Chrome (non-Snap)
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" \
         >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    google-chrome-stable && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 3. Create directories (if needed for supervisor or VNC configs)
RUN mkdir -p /etc/supervisor/conf.d
RUN mkdir -p /root/.vnc

# 4. Copy your startup script (run.sh) into the container
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# 5. Default command to run your script
CMD [ "/usr/local/bin/run.sh" ]

FROM ubuntu:22.04

# 1. Install base packages needed for Xfce, VNC, noVNC, etc.
#    Also install wget, gnupg2, and ca-certificates (needed to add Google keys/repo).
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \
    gnupg2 \
    ca-certificates \
    xfce4 \
    xfce4-terminal \
    novnc \
    websockify \
    supervisor \
    x11vnc \
    xvfb \
    wmctrl \
    curl \
    xinit \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Add Google’s official Linux signing key and repo, then install Google Chrome
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

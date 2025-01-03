FROM ubuntu:22.04

# Install required packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 \
    xfce4-terminal \
    chromium-browser \
    novnc \
    websockify \
    supervisor \
    x11vnc \
    xvfb \
    wmctrl \
    curl \
    ca-certificates \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create directories for noVNC and Supervisor
RUN mkdir -p /etc/supervisor/conf.d
RUN mkdir -p /root/.vnc

# Copy startup script into container
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Run the startup script when container starts
CMD [ "/usr/local/bin/run.sh" ]

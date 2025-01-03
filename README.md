# Chromium-Browser-to-HA

[![Add Repository to HA](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/Gli347/addon-Chromium-Browser-to-HA)

This Home Assistant add-on provides a minimal Xfce desktop environment and runs the Chromium browser, accessible through noVNC in your browser. This allows you to have a “full” graphical browser window directly inside Home Assistant.

## Features

- Virtual X server (Xvfb) running an Xfce desktop
- x11vnc for VNC access
- noVNC for browser-based VNC
- Chromium web browser

## Installation

1. **Clone or download** this repository.  
2. **Add it** to Home Assistant as a “Local Add-on”:  
   - Go to **Supervisor** -> **Add-on Store** -> click the **...** menu -> **Repositories**.  
   - Add the local path or GitHub URL to your cloned repo.  
3. Look for **Chromium-Browser-to-HA** in the add-on list.  
4. **Install** (and/or build) the add-on.  
5. **Start** the add-on.  
6. Navigate to `http://<HOME_ASSISTANT_IP>:8080` to access the remote desktop environment and Chromium via noVNC.

## Configuration

- By default, the virtual screen size is set to `1280x800` in `run.sh`.  
  - Adjust `-screen 0 1280x800x24` to your preferred resolution.  
- If you want a VNC password, see the comments in `run.sh` (you can set up x11vnc with a password).  
- For kiosk mode or auto-launching a specific URL, modify the Chromium command in `run.sh`.

## Security

- If you expose this add-on outside your local network, we strongly recommend enabling passwords on x11vnc and using secure connections.

---

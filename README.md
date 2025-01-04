# Google_Chrome-Browser-to-HA

[![Add Repository to HA](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/Gli347/Chrome-Browser-to-HA)

This Home Assistant add-on provides a minimal Xfce desktop environment and runs the Google Chrome browser (non-Snap), accessible through noVNC. With it, you can have a “full” graphical browser window directly inside Home Assistant—useful for viewing local servers, dashboards, or other web resources without leaving the HA interface.

## Features

- Virtual X server (Xvfb) with an Xfce desktop
- x11vnc for VNC access
- noVNC for web-based VNC
- Google Chrome browser (installed as a .deb, not Snap)

## Installation

1. Clone or download this repository (for example, using "git clone" or as a ZIP).
2. Add it to Home Assistant as a Local Add-on:
   - Go to **Settings** → **Add-ons** (or **Supervisor** → **Add-on Store** in older HA versions).
   - Click the three dots in the top-right → **Repositories**.
   - Paste in the GitHub URL:
     ```
     https://github.com/Gli347/Chrome-Browser-to-HA
     ```
3. Look for **Google_Chrome-Browser-to-HA** in your Add-on list.
4. **Install** (and build) the add-on.
5. **Start** the add-on once installation is complete.
6. In your browser, open `http://<HA_IP>:8080` (or whichever port you configured) to access the Xfce desktop and Google Chrome via noVNC.

## Configuration

- By default, the virtual screen resolution is set to `1280x800` in `run.sh`.  
  Look for and change `1280x800` to the resolution you prefer (for example, `1920x1080`).
   - **VNC Password**: You can enable a password for x11vnc. See comments in `run.sh` (or x11vnc docs) for details.
   - **Kiosk Mode**: Add `--kiosk` to the Google Chrome line in `run.sh` if you want a full-screen, menu-less experience.
   - **Startup URL**: Modify the Google Chrome command in `run.sh` to open a specific site upon launch, for example:

## Security

- If you plan to expose this add-on outside your local network (via port forwarding, Nabu Casa, etc.), please enable a VNC password (x11vnc) and ideally connect over a secure channel (HTTPS, VPN, etc.).
- Because this add-on runs a fully interactive desktop and browser, make sure you control who can open it.

Enjoy your lightweight Xfce environment with Google Chrome, accessible through Home Assistant via noVNC!
END README


#!/bin/bash
set -e

PAL_DIR="/home/steam/palworld"

echo "=== Updating SteamCMD ==="
/usr/games/steamcmd +quit

echo "=== Updating Palworld Dedicated Server ==="
/usr/games/steamcmd \
  +login anonymous \
  +force_install_dir "$PAL_DIR" \
  +app_update 2394010 validate \
  +quit

echo "=== Restarting Palworld server ==="
sudo systemctl restart palworld.service
sudo systemctl status palworld.service

echo "=== Update complete ==="

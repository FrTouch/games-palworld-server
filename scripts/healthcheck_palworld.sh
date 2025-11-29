#!/bin/bash

SERVICE="palworld.service"
PORT=8211

echo "=== Palworld Health Check ==="

# 1. Vérifier le service systemd
if ! systemctl is-active --quiet $SERVICE; then
    echo "[ERROR] $SERVICE is not active. Restarting..."
    sudo systemctl restart $SERVICE
    exit 1
fi

# 2. Vérifier le port (UDP)
if ! ss -u -l | grep -q ":$PORT"; then
    echo "[ERROR] UDP port $PORT not open. Restarting..."
    sudo systemctl restart $SERVICE
    exit 1
fi

# 3. Vérifier le process
if ! pgrep -f "PalServer" >/dev/null; then
    echo "[ERROR] PalServer process not found. Restarting..."
    sudo systemctl restart $SERVICE
    exit 1
fi

echo "OK: Palworld server is healthy."
exit 0

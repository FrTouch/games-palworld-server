#!/bin/bash
set -e

PAL_DIR="/home/steam/palworld"
BACKUP_DIR="/home/steam/palworld_backups"
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

mkdir -p "$BACKUP_DIR"

echo "=== Creating backup ==="
tar -czf "$BACKUP_DIR/palworld-$TIMESTAMP.tar.gz" -C "$PAL_DIR" .

echo "=== Cleaning old backups (keep last 7) ==="
ls -1t "$BACKUP_DIR"/palworld-*.tar.gz | tail -n +8 | xargs -r rm --

echo "=== Backup complete: $BACKUP_DIR/palworld-$TIMESTAMP.tar.gz ==="

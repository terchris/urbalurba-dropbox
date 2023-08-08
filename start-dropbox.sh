#!/bin/bash

# Prepare Dropbox directory
mkdir -p $DROPBOX_DIR

# Start Dropbox as root
dropbox start

# Enable LAN sync
sleep 10
dropbox lansync y

# Keep the container running
tail -f /dev/null

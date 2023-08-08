#!/bin/bash

# Prepare Dropbox directory
mkdir -p $DROPBOX_DIR

# Start Dropbox as root to install the daemon
dropbox start -i

# Enable LAN sync
sleep 10
dropbox lansync y

# Keep the container running
tail -f /dev/null

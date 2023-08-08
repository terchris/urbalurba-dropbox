#!/bin/bash

# Create Dropbox user and group
groupadd -g $DROPBOX_GID dropbox
useradd -m -u $DROPBOX_UID -g $DROPBOX_GID dropbox

# Prepare Dropbox directory
mkdir -p $DROPBOX_DIR
chown -R $DROPBOX_UID:$DROPBOX_GID $DROPBOX_DIR

# Start Dropbox as the created user
sudo -u dropbox HOME=$DROPBOX_DIR dropbox start -i

# Enable LAN sync
sleep 10
sudo -u dropbox HOME=$DROPBOX_DIR dropbox lansync y

# Keep the container running
tail -f /dev/null

# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set the sync directory environment variable
ENV DROPBOX_DIR /sync

# Update the package lists and install required dependencies
RUN apt-get update \
    && apt-get install -y wget python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download the Dropbox CLI script
RUN wget -O /usr/bin/dropbox "https://www.dropbox.com/download?dl=packages/dropbox.py" \
    && chmod +x /usr/bin/dropbox

# Copy the startup script into the container
COPY start-dropbox.sh /start-dropbox.sh

# Make the startup script executable
RUN chmod +x /start-dropbox.sh

# Set the entry point to the startup script
ENTRYPOINT ["/start-dropbox.sh"]

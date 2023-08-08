FROM debian:bullseye-slim

# Environment variables
ENV DROPBOX_DIR /sync # Updated this line to /sync
ENV DROPBOX_UID 1000
ENV DROPBOX_GID 1000

# Install dependencies
RUN apt-get update \
    && apt-get install -y wget curl gnupg procps sudo

# Install Dropbox
RUN echo "deb [arch=amd64,arm64] http://linux.dropbox.com/debian buster main" > /etc/apt/sources.list.d/dropbox.list \
    && wget -O - https://linux.dropbox.com/fedora/rpm-public-key.asc | apt-key add - \
    && apt-get update \
    && apt-get install -y dropbox

# Add startup script
COPY start-dropbox.sh /start-dropbox.sh
RUN chmod +x /start-dropbox.sh

ENTRYPOINT ["/start-dropbox.sh"]

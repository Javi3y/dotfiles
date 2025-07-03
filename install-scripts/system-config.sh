#!/bin/bash

copy_configs() {
    local config_src="system-configs"

    # Check if the source directory exists
    if [ ! -d "$config_src" ]; then
        echo "--> WARNING: Config directory '$config_src' not found. Skipping."
        return 0 # Not an error, just nothing to do
    fi

    echo "--- Copying all configuration files from '$config_src/' to '/' ---"
    
    # Use rsync to copy files. The -a flag preserves permissions and
    # ownership, and the trailing slash on the source is important.
    # It requires root privileges to write to /etc.
    sudo rsync -av "$config_src/" /

    # Check the exit code of rsync to ensure it was successful
    if [ $? -eq 0 ]; then
        echo "Configuration files copied successfully."
        return 0
    else
        echo "ERROR: rsync failed to copy configuration files."
        return 1
    fi
}

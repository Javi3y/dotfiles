#!/bin/bash

add_users_to_groups() {
    # This function adds the user to a list of essential groups,
    # but only if the groups already exist.

    local current_user="${SUDO_USER:-$USER}"
    local groups_to_ensure=(
        "docker"
    )

    echo "--- Checking user group memberships for '$current_user'... ---"

    for group in "${groups_to_ensure[@]}"; do
        # Check if the group actually exists
        if getent group "$group" &>/dev/null; then
            # If it exists, add the user
            echo "Adding user '$current_user' to existing group '$group'..."
            sudo usermod -aG "$group" "$current_user"
            if [ $? -ne 0 ]; then
                echo "ERROR: Failed to add user to group '$group'."
                return 1 # Signal failure
            fi
        else
            # If it does not exist, print a warning and skip
            echo "--> WARNING: Group '$group' does not exist. Skipping."
        fi
    done

    echo "--- User group memberships updated successfully. ---"
    echo "IMPORTANT: You must log out and log back in for group changes to take full effect."
    return 0 # Success
}

#!/bin/bash

set_zsh_default() {
    # Find the path to the Zsh executable
    local zsh_path
    zsh_path=$(which zsh)

    if [ -z "$zsh_path" ]; then
        echo "--> ERROR: zsh is not installed or not in PATH. Please add 'zsh' to pkglist.txt."
        return 1
    fi

    # Get the user who is running the script
    local current_user="${SUDO_USER:-$USER}"
    
    # Get the user's current default shell from /etc/passwd
    local current_shell
    current_shell=$(getent passwd "$current_user" | cut -d: -f7)

    # Check if Zsh is already the default
    if [ "$current_shell" = "$zsh_path" ]; then
        echo "--- Zsh is already the default shell for '$current_user'. Skipping. ---"
        return 0
    fi
    
    echo "--- Setting '$zsh_path' as the default shell for user '$current_user'... ---"
    
    # Use 'chsh' with sudo to change the shell non-interactively
    sudo chsh -s "$zsh_path" "$current_user"

    if [ $? -eq 0 ]; then
        echo "Default shell changed successfully."
        echo "NOTE: Changes will take effect on the next login."
        return 0
    else
        echo "--> ERROR: Failed to change the default shell."
        return 1
    fi
}

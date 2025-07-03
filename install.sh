#!/bin/bash

# Main installation script that sources and runs individual task scripts.

# --- Setup ---

# Define the directory where the script functions are located
SCRIPT_DIR="install-scripts"

# Check if the script directory exists
if [ ! -d "$SCRIPT_DIR" ]; then
    echo "ERROR: The script directory '$SCRIPT_DIR' was not found."
    echo "Please create it and place the function scripts inside."
    exit 1
fi

# Source all function scripts from the SCRIPT_DIR.
# This makes the functions (e.g., install_yay) available to this script.
for script in "$SCRIPT_DIR"/*.sh; do
    if [ -f "$script" ]; then
        # shellcheck source=/dev/null
        source "$script"
    fi
done


# --- Error Handling and Execution Flow ---

# This wrapper function remains in the main script as it controls the flow.
run_step() {
    local func_name="$1"
    local description="$2"
    
    echo
    echo "##################################################"
    echo "--- Starting Step: $description"
    echo "##################################################"

    while true; do
        # Check if the function is defined before trying to run it
        if ! declare -f "$func_name" > /dev/null; then
             echo "--- ERROR: Function '$func_name' is not defined. Check your files in '$SCRIPT_DIR'. ---"
             return 127 # Command not found
        fi

        # Execute the function passed as an argument
        "$func_name"
        local exit_code=$?

        if [ $exit_code -eq 0 ]; then
            echo "--- SUCCESS: Step '$description' completed. ---"
            return 0 # Success
        fi

        echo
        echo "--- ERROR: Step '$description' failed with exit code $exit_code. ---"
        
        while true; do
            read -p "Do you want to (r)etry this step or (s)kip to the next one? [r/s] " choice
            case "$choice" in
                r|R ) echo "--> Retrying..."; break;;
                s|S ) echo "--> Skipping step."; return 1;;
                * ) echo "Invalid option. Please enter 'r' or 's'.";;
            esac
        done
    done
}


# --- Main Execution Block ---

main() {
    echo "Starting the setup process..."
    run_step install_dependencies "Install base dependencies"
    run_step install_yay "Install yay AUR Helper"
    run_step install_packages_from_list "Install packages from pkglist.txt"
    run_step add_users_to_groups "Add user to essential groups"
    run_step copy_configs "Copy system configurations"
    run_step manage_services "Enable and start system services"
    run_step set_zsh_default "Set Zsh as default shell"
    echo
    echo "##################################################"
    echo "--- All tasks complete! ---"
    echo "--- You better reboot!  ---"
    echo "##################################################"
}

# --- Start the Script ---
main

#!/bin/bash

manage_services() {
    # Define the list of services you want to enable and start
    local services_to_manage=(
        "docker"
        "ly"
        "keyd"
    )

    echo "--- Enabling and starting system services... ---"

    for service in "${services_to_manage[@]}"; do
        echo "Managing service: $service"
        # Use 'enable --now' to both enable on boot and start immediately.
        # This requires root privileges.
        sudo systemctl enable "$service"
        
        # Check if the command was successful
        if [ $? -ne 0 ]; then
            echo "--> ERROR: Failed to manage '$service'. The service might not exist or failed to start."
            return 1 # Signal failure to the run_step wrapper
        fi
    done

    echo "Services enabled and started successfully."
    return 0 # Success
}

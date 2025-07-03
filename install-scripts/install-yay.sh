#!/bin/bash

install_yay() {
    # Check if yay is already installed before proceeding
    if command -v yay &>/dev/null; then
        echo "--- yay is already installed. Skipping installation. ---"
        return 0 # Exit with a success code
    fi

    echo "Cloning and installing yay-bin from the AUR..."
    cd /tmp
    # Clean up any previous yay-bin folder to ensure a fresh clone
    rm -rf yay-bin
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    # Build and install. makepkg will use sudo to install the package.
    makepkg -si --noconfirm
    cd
}

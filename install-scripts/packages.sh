#!/bin/bash

install_packages_from_list() {
    local pkg_file="pkglist.txt"

    if [ ! -f "$pkg_file" ]; then
        echo "--- WARNING: Package list file not found at ./${pkg_file}. Skipping this step. ---"
        return 0 # Return success as there's nothing to do
    fi

    echo "--- Installing all packages from ${pkg_file} ---"
    yay -S --needed --noconfirm --mflags --skipinteg dropbox - < "$pkg_file"
}

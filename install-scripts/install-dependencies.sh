#!/bin/bash

install_dependencies() {
    echo "Updating package database and installing dependencies..."
    sudo pacman -Syyu --needed --noconfirm base-devel git rsync
}

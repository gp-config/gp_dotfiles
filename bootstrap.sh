#!/bin/bash

# avoid re-typing common arguments to rsync
function run_sync() {
    rsync \
        -ah \
        --no-perms \
        --exclude ".DS_Store" \
        $@
}

# sync platform agnostic dotfiles
function copy_common() {
    echo ""; echo "Copying dotfiles"
    run_sync --exclude "platform_specific/" "$dir_in/" $dir_out
    echo "Dotfiles sync complete"
}

# sync mac-specific files
function copy_mac() {
    echo ""; echo "Detected macOS, Copying .macos init file to ~."
    echo "Execute it manually to set preferred macOS options."
    run_sync "$dir_in/platform_specific/mac/" $dir_out
    echo "macOS files sync complete"
}

# sync linux-specific files
function copy_linux() {
    echo ""; echo "Detected linux, Copying linux specific files to ~."
    run_sync "$dir_in/platform_specific/linux/" $dir_out
    echo "Linux files sync complete"
}

# run
function begin() {
    read -p "This script may overwrite files. Continue? (y/n) " -n 1; echo ""

    # exit early if user says no
    if [[ $REPLY =~ ^[nN]$ ]]; then
        echo "Aborting"
        return
    fi

    dir_in="./home_files"
    dir_out="$HOME/"
    platform=$(uname -s)

    # sync platform agnostic dotfiles
    copy_common

    # sync platform-specific files
    if [[ $platform == "Darwin" ]]; then
        copy_mac
    elif [[ $platform == "Linux" ]]; then
        copy_linux
    fi

    echo ""; echo "============= Done ============="
}

begin

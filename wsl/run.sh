#!/usr/bin/env bash
NO_TOUCH=false

usage() {
    echo "Usage: $0 [--no-touch]"
    exit 1
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --no-touch) NO_TOUCH=true ;;
        -h|--help) usage ;;
        *) echo "Unknown parameter passed: $1"; usage ;;
    esac
    shift
done

if $NO_TOUCH; then
    echo "Running hands off install of everything..."
    $HOME/installs_bs/wsl/scripts/install_dependencies.sh
    $HOME/installs_bs/wsl/scripts/install_dotfiles.sh
    exit 0
fi

read -p "
-- Install Scripts for WSL --

[0] Install Everything
[1] Install Dependencies Only
[2] Install Dotfiles Only

Please Provide a Number: " -n 1 -r WSLREPLY
echo
if [[ $WSLREPLY -eq 0 ]]; then
    echo "installing everything..."
    $HOME/installs_bs/wsl/scripts/install_dependencies.sh
    $HOME/installs_bs/wsl/scripts/install_dotfiles.sh
    exit 0
fi

if [[ $WSLREPLY -eq 1 ]]; then
    echo "installing dependencies only..."
    $HOME/installs_bs/wsl/scripts/install_dependencies.sh
    exit 0
fi

if [[ $WSLREPLY -eq 2 ]]; then
    echo "installing dotfiles only..."
    $HOME/installs_bs/wsl/scripts/install_dotfiles.sh
    exit 0
fi
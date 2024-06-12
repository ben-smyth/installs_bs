#!/usr/bin/env bash
# Init script for WSL host without any pre-installed software.
set -euo pipefail

# apt package updates and upgrades
sudo apt-get update -y
sudo apt-get upgrade -y

# install brew
install_homebrew() {
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || return 1
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
}

configure_git() {
    # set basic git settings
    git config --global user.email "ben.df.smyth@gmail.com"
    git config --global user.name "ben-smyth"
}

if ! install_homebrew; then
    echo "Homebrew installation failed, continuing..."
fi

if ! configure_git; then
    echo "Git configuration failed, continuing..."
fi

eval $(cat ~/.bashrc)

# clone the full repo for dotfiles and dependencies
git clone https://github.com/ben-smyth/installs_bs.git ~/installs_bs 

$(cd ~/installs_bs && /run.sh)
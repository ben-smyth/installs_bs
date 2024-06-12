#!/usr/bin/env bash

set -euo pipefail

# apt package updates and upgrades
sudo apt-get update -y
sudo apt-get upgrade -y

# install brew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/bsmyth/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.bashrc

# set basic git settings
git config --global user.email "ben.df.smyth@gmail.com"
git config --global user.name "ben-smyth"

# clone the full repo for dotfiles and dependencies
git clone https://github.com/ben-smyth/installs_bs.git ~/installs_bs
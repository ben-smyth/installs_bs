#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get upgrade -y

# install brew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/bsmyth/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# set basic git settings
git config --global user.email "ben@bensmyth.me"
git config --global user.name "Ben Smyth"

# clone the full repo for dotfiles and dependencies
git clone https://github.com/ben-smyth/installs_bs.git
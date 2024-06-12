#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get upgrade -y

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# set basic git settings
git config --global user.email "ben@bensmyth.me"
git config --global user.name "Ben Smyth"
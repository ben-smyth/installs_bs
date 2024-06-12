#!/usr/bin/env bash
set -euo pipefail

echo "installing dependencies"

sudo apt-get update -y
sudo apt-get upgrade -y

xargs sudo apt-get install -y < $HOME/installs_bs/wsl/dependencies/apt_packages
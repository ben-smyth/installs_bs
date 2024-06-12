#!/usr/bin/env bash
INIT=false

read -p "
-- INSTALLS_BS --

[0] WSL
[1] UBUNTU
[2] MACOS

Please Provide a Number: " -n 1 -r
echo
read -p "Full Initialization [y/N]: " -n 1 -r RESPONSE
echo
if [[ "$RESPONSE" =~ ^[Yy]$ ]]; then
    echo "Running full initialization..."
    INIT=true
fi

if [[ ! $INIT ]]; then
    read -p "Pull Latest Repository Changes [Y/n]: " -n 1 -r PULL
    if [[ "$PULL" =~ ^[Yy]$ ]]; then
        PULL_CHANGES=true
    else
        PULL_CHANGES=false
    fi
fi

if [[ $reply -eq 0 ]]
then
    if $INIT; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ben-smyth/installs_bs/main/wsl/scripts/init.sh)"
        exit
    fi
    $HOME/installs_bs/wsl/run.sh
fi

if [[ $reply -eq 1 ]]
then
    if $INIT; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ben-smyth/installs_bs/main/ubuntu/scripts/init.sh)"
        exit
    fi
    $HOME/installs_bs/ubuntu/run.sh
fi

if [[ $reply -eq 2 ]]
then
    if $INIT; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ben-smyth/installs_bs/main/macos/scripts/init.sh)"
        exit
    fi
    $HOME/installs_bs/macos/run.sh
fi
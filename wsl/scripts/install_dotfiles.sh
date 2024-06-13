#!/usr/bin/env bash
set -euo pipefail

echo "[DOT] Installing dotfiles"

echo "[DOT] Checking for STOW install..."

if !(stow -V); then
    echo "[DOT] STOW not installed, exiting..."
    exit 1
fi

echo "[DOT] STOW install found..."
# DELETE STOW MAPPING: stow --dir dotfiles/ -D .

if stow --dir $HOME/installs_bs/dotfiles --target $HOME/. .; then
    echo "[DOT] STOW links added"
else
    echo "[DOT] STOW links failed"
    exit 1
fi

exec /usr/bin/env zsh
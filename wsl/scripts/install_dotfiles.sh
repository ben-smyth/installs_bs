#!/usr/bin/env bash
set -euo pipefail

echo "[DOT] Installing dotfiles"

echo "[DOT] Checking for STOW install..."

if !(stow -V); then
    echo "[DOT] STOW not installed, exiting..."
    exit 1
fi

echo "[DOT] STOW install found..."
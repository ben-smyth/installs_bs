#!/usr/bin/env bash
set -euo pipefail

# install brew
install_homebrew() {
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || return 1
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    sudo chown -R :sudo $(brew --prefix)/*   
}

install_nerdfont() {
    wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
    && cd ~/.local/share/fonts \
    && unzip -n JetBrainsMono.zip \
    && rm JetBrainsMono.zip \
    && fc-cache -fv
}

install_zoxide() {
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
}

set_zsh_default() {

}

echo "[DEP] Installing apt packages..."

sudo apt-get update -y
sudo apt-get upgrade -y

# Adding apt repositories
xargs sudo add-apt-repository -y < $HOME/installs_bs/wsl/dependencies/apt_repositories

# Adding apt packages
xargs sudo apt-get install -y < $HOME/installs_bs/wsl/dependencies/apt_packages


GOLANG_VER=go1.22.4.linux-amd64
GOLANG_BIN=/usr/local/go/bin/go

if [[ -f $GOLANG_BIN ]]; then
    echo "[DEP] Golang is already installed: $($GOLANG_BIN version)"
else
    echo "[DEP] installing Golang ver=${GOLANG_VER}..."
    wget -O /tmp/${GOLANG_VER}.tar.gz https://go.dev/dl/${GOLANG_VER}.tar.gz &&
    sudo tar -C /usr/local -xvf /tmp/${GOLANG_VER}.tar.gz --quiet &&
    rm /tmp/${GOLANG_VER}.tar.gz
fi

echo "[DEP] Checking for Homebrew install..."
if !(brew -v); then
    echo "[DEP] Installing Homebrew..."
    if ! install_homebrew; then
        echo "[DEP] Homebrew installation failed, continuing..."
    fi
else
    echo "[DEP] Installing Homebrew packages..."
fi


echo "[DEP] Installing NerdFont"
if ! install_nerdfont; then
    echo "[DEP] NerdFont installation failed - manually install from https://www.nerdfonts.com/"
    echo "[DEP] Continuing..."
fi

echo "[DEP] Installing zoxide"
if ! install_zoxide; then
    echo "[DEP] Zoxide installation failed - manually install from https://github.com/ajeetdsouza/zoxide"
    echo "[DEP] Continuing..."
fi

echo "[DEP] Cloning TMUX TPM"
if ! (git clone  https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm); then
    echo "[DEP] TMUX TPM already exists"
else
    echo "[DEP] TMUX TPM Installed to ~/.tmux/plugins/tpm"
fi


echo "[DEP] Setting ZSH as the default terminal for ${USER} if not already..."
sudo usermod --shell $(which zsh) ${USER}
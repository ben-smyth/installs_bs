# Dependency and Dotfile Management
Project to manage dotfiles and dependencies for different environments.

In an effort to speed up setting new machines, and also making universal updates to my dotfiles - I have created this project. The goal is to have all my installations (currently MacOS, Ubuntu and WSL) align where possible (Brew, GNU Stow) so that I can easily manage changes and updates to dotfiles and/or dependencies.

This will have the added benefit of quickly installing new systems too.

An essential element of this project, is that it will be reconcilable in nature. If I run my script on a half-baked system, it will bring it to be fully-baked. If I run it on a fully-baked system, it wont do anything.

## WSL
init (from fresh)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ben-smyth/installs_bs/main/wsl/scripts/install_dependencies.sh)"
```


## SH
Shell is the one common, OS-level, dependency among all.

## GNU STOW
A symlink farm manager. This enables me to keep all files inside this repository. I don't need to go through the hassle of copying and deleting files from this repository.

It is compatible with all services that I use - MacOS, Ubuntu, WSL.

## BREW Package Manager
Brew will hopefully cover most of my needs, especially for MacOS - however I know already that it wont have all packages I need.

Brew has the added benefit of having `--cask`, which allows me to install desktop applications for MacOS.



- [ ] Install BREW
- [ ] Install STOW

- [ ] Install BREW Taps, and BREW Packages

### Testing
How do I test without losing my sanity? 

The most obvious solution is to create a new WSL user, and work from fresh on that. Alongside this, a quick and re-usable way to wipe and start fresh again.
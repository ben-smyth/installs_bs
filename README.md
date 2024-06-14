# Dependency and Dotfile Management
Tired of not having what I need on EVERY device.

## RUN (WSL,MACOS,UBUNTU)
### RUN (ANY UNIX)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ben-smyth/installs_bs/main/run.sh)"
```

### RUN (WINDOWS PACKAGES)
```
powershell -Command "Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ben-smyth/installs_bs/main/windows/run.psm1'))"

```

## GNU STOW
A symlink farm manager. This enables me to keep all files inside this repository. I don't need to go through the hassle of copying and deleting files from this repository.

It is compatible with all services that I use - MacOS, Ubuntu, WSL.

## TODO
- [ ] Auto OS detect
    - Find OS type / arch and act accordingly
- [ ] GIT ssh-key issue for WSL
- [ ] FZF for ZSH (WSL)
- [ ] TMUX for WSL

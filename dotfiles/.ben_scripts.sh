updateDotFiles() {
    # function to update my dotfiles by git pulling and running install
    git -C ${HOME}/installs_bs pull
    source ${HOME}/.zshrc
}

run_script() {
    ${HOME}/installs_bs/run.sh
}

getCheatSheet() {
    # remind me of critical hotkeys

}

alias dfup='updateDotFiles'
alias show='getCheatSheet'
alias binstall='run_script'


## ALIASES
alias vi='vim'

## GIT
alias gcm='git commit -m'
alias gcma='git commit -am'
alias gs='git status'
alias gpo='git push origin'
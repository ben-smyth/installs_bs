multissh() {
    local HOSTS=($@)
    if [ -z "$HOSTS" ]; then
       echo -n "Please provide a list of hosts separated by spaces [ENTER]: "
       read -A HOSTS
    fi

    tmux new-window "ssh ${HOSTS[1]};"
    printf '%s\n' "${HOSTS[@]:1}" | xargs -I {} tmux split-window -h "ssh {};"
    tmux select-layout tiled > /dev/null
    tmux select-pane -t 0
    tmux set-window-option synchronize-panes on > /dev/null
}

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
alias cat='bat'

## GIT
alias gcm='git commit -m'
alias gcma='git commit -am'
alias gs='git status'
alias gpo='git push origin'
alias gp='git pull'

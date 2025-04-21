# === 🛠️ Custom Shell Functions ===

# Make a directory and cd into it
mcd() {
    mkdir -p "$1" && cd "$1"
}

# Reload Bash
reload_bash() {
    source ~/.bashrc && echo "Bash reloaded successfully!"
}

# Reload Zsh
reload_zsh() {
    source ~/.zshrc && echo "Zsh reloaded successfully!"
}


# === 📁 Directory Navigation ===

alias ..="cd .."
alias ....='cd ../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias home="cd $HOME"
alias projects="cd $HOME/Desktop/projects"

alias l='ls -1'
alias la='ls -A'
alias ll='ls -lah'
alias tree="tree -C -L 2"  # Requires 'tree' package


# === 🧼 Terminal Cleanup & Utilities ===

alias c="clear"
alias now="date +%T"
alias path="echo \$PATH | tr ':' '\n'"
alias diskspace="df -h"
alias usage="du -sh * | sort -h"
alias fixperm="sudo chown -R \$USER:admin ."
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder && echo 'DNS cache flushed'"


# === 🧠 Dev Helpers ===

alias serve="python3 -m http.server"
alias ports="lsof -i -P -n | grep LISTEN"
alias vsc="code ."  # Open VS Code in current directory


# === 🔧 Git Aliases ===

alias gs='git status'
alias gb='git branch'
alias gr='git remote -v'
alias gaa='git add .'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcl='git clone'
alias gpo='git push origin'
alias gpu='git pull origin'
alias gdiff='git diff'


# === 📦 Package Management (OS-specific) ===

alias brewup="brew update && brew upgrade && brew cleanup"
alias update_sys="sudo apt update && sudo apt upgrade -y"


# === 🔐 SSH & Networking ===

alias sshconfig="nano ~/.ssh/config"
alias myip="curl ifconfig.me"

### Custom functions and aliases
# Function to create a directory and cd into it
mcd() {
    mkdir -p "$1" && cd "$1"
}

reload_bash() {
    source ~/.bashrc && echo "Bash reloaded successfully!"
}

# Custom Aliases
alias ..="cd .."
alias ....='cd ../..' 
alias ping="ping -c 5"
alias c="clear"
alias now="date +%T"
alias gs='git status'
alias gb='git branch'   
alias gr='git remote -v'
alias home="cd $HOME"
alias projects="cd $HOME/Desktop/projects"


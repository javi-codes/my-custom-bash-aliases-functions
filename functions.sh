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

# === 🔄 Extract various archive types ===
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       unrar x "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *)           echo "Unknown archive format: $1" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# === 🧹 Recursively remove all node_modules folders ===
cleanup_node_modules() {
  find . -type d -name "node_modules" -prune -exec rm -rf '{}' +
  echo "✅ All node_modules folders removed from subdirectories."
}

# === 🔍 Fuzzy find and open a file (requires fzf) ===
f() {
  local file
  file=$(fzf) && open "$file"
}

# === 📂 Show recently modified files ===
recent() {
  find . -type f -exec stat -f "%m %N" {} + 2>/dev/null | sort -rn | head -n 20 | cut -d' ' -f2-
}

# === 🔐 Generate and load a new SSH key ===
gen_ssh_key() {
  read -p "Enter email for SSH key: " email
  ssh-keygen -t ed25519 -C "$email"
  eval "$(ssh-agent -s)"
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
  pbcopy < ~/.ssh/id_ed25519.pub
  echo "✅ SSH key generated and public key copied to clipboard. Add it to GitHub."
}

# === 📁 Make directory and cd into it with argument check ===
mkcd() {
  if [ -z "$1" ]; then
    echo "Usage: mkcd <dirname>"
  else
    mkdir -p "$1" && cd "$1"
  fi
}

# === 🧼 Trim a log file to last N lines ===
trim_log() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: trim_log <file> <number_of_lines>"
    return 1
  fi
  tail -n "$2" "$1" > "$1.trimmed" && mv "$1.trimmed" "$1"
  echo "✅ Trimmed $1 to last $2 lines."
}

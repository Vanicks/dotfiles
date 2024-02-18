log() {
  echo >&2 "[~/.zshrc] $(tput setaf 245)$*$(tput sgr0)"
}

retry() {
  while true; do $@; sleep 1; done
}

# Search in history
function histgrep() {
    history | grep "$1"
}

# Search for files or directories
function ffind() {
    find . -name "*$1*"
}

# Encrypt a file using GPG
function encrypt() {
    gpg -c "$1"
}

# Decrypt a file using GPG
function decrypt() {
    gpg "$1"
}
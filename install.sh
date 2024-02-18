#!/bin/bash

sudo apt update

# Check if ~/.zshrc exists
if [ ! -f ~/.zshrc ]; then
  echo "~/.zshrc file not found!"
  exit 1
fi

# Backup original ~/.zshrc
cp ~/.zshrc ~/.zshrc.backup

# Add lines to ~/.zshrc
echo "test -d ~/.linuxbrew && eval \"\$(~/.linuxbrew/bin/brew shellenv)\"" >> ~/.zshrc
echo "test -d /home/linuxbrew/.linuxbrew && eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"" >> ~/.zshrc
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc


# Install ZSH Plugins
brew install zsh-autosuggestions
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-syntax-highlighting/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-syntax-highlighting.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-syntax-highlighting.gpg > /dev/null
sudo apt install zsh-syntax-highlighting

# Setup ZSH Plugins
echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
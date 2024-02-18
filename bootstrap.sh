#!/bin/bash

# Check if Homebrew is already installed
if ! command -v brew &> /dev/null; then
  # Install Homebrew
  echo "Installing Homebrew..."
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash -s
else
  echo "Homebrew is already installed."
  exit 0
fi

# Install oh-my-zsh
echo "Installing ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configure Homebrew shell integration
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
source "$HOMEBREW_PREFIX/bin/brew shellenv"

# Disable Homebrew analytics (optional)
brew analytics off

# Install Oh-my-posh
echo "Installing Oh-my-posh..."
brew install jandedobbeleer/oh-my-posh/oh-my-posh

# Configure Oh-my-posh theme
theme_path="$(brew --prefix oh-my-posh)/themes/clean-detailed.omp.json"
eval "$(oh-my-posh init zsh --config "$theme_path")"

echo "Bootstrap complete!"

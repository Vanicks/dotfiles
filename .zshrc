SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Homebrew install path customization
if ! command -v brew &>/dev/null; then
    echo >&2 "Skipping homebrew initialization in shell."
else
    # brew shellenv exports HOMEBREW_PREFIX, PATH etc.
    eval $(brew shellenv)
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_INSECURE_REDIRECT=1
fi

# Add zsh completion scripts installed via Homebrew
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)

# ZSH settings
export ZSH=$HOME/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git colored-man-pages zsh-completions)
source "$ZSH/oh-my-zsh.sh"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export UPDATE_ZSH_DAYS=14
export DISABLE_UPDATE_PROMPT=true # accept updates by default

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Load custom functions
if [[ -f "${SELF_DIR}/zsh_functions.inc" ]]; then
	source "${SELF_DIR}/zsh_functions.inc"
else
	echo >&2 "WARNING: can't load shell functions"
fi

# oh-my-posh-prompt
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/clean-detailed.omp.json)"

# python: replace system python
PATH="$HOMEBREW_PREFIX/opt/python/libexec/bin:$PATH"

# z completion
if [ -f "$HOMEBREW_PREFIX/etc/profile.d/z.sh" ]; then
    . "$HOMEBREW_PREFIX/etc/profile.d/z.sh"
fi

# add dotfiles/bin to PATH
if [[ -d "${SELF_DIR}/bin" ]]; then
	PATH="${SELF_DIR}/bin:${PATH}"
fi

# load zsh plugins installed via brew
if [[ -d "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting" ]]; then
	source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
if [[ -d "$HOMEBREW_PREFIX/share/zsh-autosuggestions" ]]; then
	# source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# global ~/go/bin
PATH="${HOME}/go/bin:${PATH}"
# global ~/.cargo/bin
PATH="${HOME}/.cargo/bin:${PATH}"

# This makes homebrew work
export PATH="/usr/local/bin:$PATH"

# Load custom aliases
if [[ -f "${SELF_DIR}/zsh_aliases.inc" ]]; then
	source "${SELF_DIR}/zsh_aliases.inc"
else
	echo >&2 "WARNING: can't load shell aliases"
fi

# Use homebrew shell
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Load copilot CLI aliases
# if [[ -f "${SELF_DIR}/github-copilot-cli-aliases.inc" ]]; then
# 	source "${SELF_DIR}/github-copilot-cli-aliases.inc"
# else
# 	echo >&2 "WARNING: can't load copilot aliases"
# fi

# finally, export the PATH
export PATH
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
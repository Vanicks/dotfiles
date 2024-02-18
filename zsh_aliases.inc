# This script is sourced from .zshrc.

# Add GNU tools not linked by Homebrew.
alias find='gfind'
alias xargs='gxargs'
alias stat='gstat'

# convenience aliases
alias cd..='cd ..'
alias cd...='cd ../..'
alias ls='ls --color'
alias l='ls -lF'
alias dir='ls'
alias la='ls -lah'
alias ll='ls -l'
alias ls-l='ls -l'
alias j='jobs'
alias time='gtime --format "$(tput setab 255)$(tput setaf 160)took %es.$(tput sgr0)"'
alias grep='grep -E --color'
alias t='tee'
alias bd='bg && disown %1'
alias pg='ps ax | grep -v "grep" | grep'
alias o='less'
alias no='yes n'
alias cl='clear;clear'
alias page='less -S'
alias ccat='ccat --bg=dark'
alias c.='code .'
alias code.='code .'

# Git
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline --decorate --graph"
alias gb="git branch"

# github aliases
alias prc='gh pr create --web'
alias prw='gh pr view --web'
alias prco='gh pr checkout'
alias prl='gh pr list -s all'
alias prme='prl --author @me'

# Docker
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dlogs="docker logs"

# Miscellaneous
alias reload="source ~/.zshrc"  # Reload Zsh configuration
alias editrc="sudo nano ~/.zshrc"  # Open Zsh configuration file in nano
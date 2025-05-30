#
# Core ZSH Configuration
#
export ZSH="$HOME/.oh-my-zsh"

# 
# Disable updates
#
zstyle ':omz:update' mode disabled

# Performance optimization
DISABLE_UNTRACKED_FILES_DIRTY="true"

#
# History Configuration
#
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#
# Environment Variables
#
export EDITOR=nvim
NPM_GLOBALS="${HOME}/.npm-globals"
export PATH="$PATH:$NPM_GLOBALS/bin:$PATH"
GOPATH=$HOME/go PATH=$PATH:/usr/local/go/bin:$GOPATH/bin


#
# Completion Settings
#
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

#
# Plugin Configuration
#
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

#
# Key Bindings
#
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^y' autosuggest-accept
bindkey '^[w' kill-region
bindkey -s '^f' '^u~/scripts/fzf-tmux.sh^Mclear^M'

#
#
# Source Oh-My-Zsh
#
source $ZSH/oh-my-zsh.sh

#
# Aliases
#

# Navigation and utilities
alias vim='nvim'
alias nvconf='nvim ~/.config/nvim/init.lua'
alias zshrc='nvim ~/.zshrc'
alias c='clear'
alias h='~'
alias nvim-dev='NVIM_APPNAME="nvim-dev" nvim'

#
# Theme Configuration (load last for better startup time)
#
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

[ -f "/home/boat/.ghcup/env" ] && . "/home/boat/.ghcup/env" # ghcup-env

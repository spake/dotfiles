# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spake"

# Editor
EDITOR="vim"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# Options
unsetopt correct_all

# Aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

# Normal binaries
export PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/games

# Local binaries
export PATH=$PATH:~/bin:~/.tools

# Host-specific script
HOST_SCRIPT=$HOME/bin/`hostname`
if [ -e "$HOST_SCRIPT" ]; then
    $HOST_SCRIPT
fi

# Editor
EDITOR="/usr/bin/vim"

# Antigen
source ~/.antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle git
antigen bundle pip
antigen bundle python
antigen bundle brew

antigen apply

# Options
unsetopt correct_all

# Aliases
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

# Normal binaries
export PATH=/usr/local/bin:/usr/local/sbin
export PATH=$PATH:/usr/bin:/usr/sbin
export PATH=$PATH:/bin:/sbin

# Local binaries
export PATH=$PATH:$HOME/bin

# Theme
function get_branch_text {
    BRANCH_TEXT=""
    if BRANCH=$( git rev-parse --abbrev-ref HEAD 2>/dev/null ); then
        BRANCH_TEXT=" %{$fg[yellow]%}[%{$fg[green]%}${BRANCH}%{$fg[yellow]%}]%{$reset_color%}"
    fi
    echo "$BRANCH_TEXT"
}
function prompt_chr {
    echo "»"
}

# primary prompt
PROMPT='
%{$fg[yellow]%}${PWD/#$HOME/~}$(get_branch_text) %{$fg[magenta]%}$(prompt_chr)%{$reset_color%} '

# Continuation prompt
PROMPT2='%{$fg[magenta]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
RPROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}'

export EDITOR=vim
export LESS=-FXR

# Host-specific script
HOST_SCRIPT="$HOME/bin/$( hostname -s )"
if [ -e "$HOST_SCRIPT" ]; then
    . $HOST_SCRIPT
fi

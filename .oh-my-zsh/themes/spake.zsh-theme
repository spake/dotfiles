# change prompt chr depending where we are
NOGITPROMPT_FILE=~/.nogitprompt

function prompt_chr {
    if [[ ! -f $NOGITPROMPT_FILE ]]; then
        git branch >/dev/null 2>/dev/null && echo '±' && return
    fi
    echo "»"
}

# Git stuff
function git_status {
    if [[ ! -f $NOGITPROMPT_FILE ]]; then
        git branch >/dev/null 2>/dev/null && echo ' '$(git-prompt-status)
    fi
}

# primary prompt
PROMPT='
%{$fg[yellow]%}${PWD/#$HOME/~}$(git_status) %{$fg[magenta]%}$(prompt_chr)%{$reset_color%} '

# Continuation prompt
PROMPT2='%{$fg[magenta]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
RPROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}'

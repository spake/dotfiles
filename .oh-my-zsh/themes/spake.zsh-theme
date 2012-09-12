# change prompt chr depending where we are
function prompt_chr {
        git branch >/dev/null 2>/dev/null && echo '±' && return
            echo "»"
}

# Git stuff
function git_status {
    if [[ `hostname` != 'eternalflame' ]]; then
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

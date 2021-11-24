

source ~/.bash_profile
autoload -U colors && colors

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch')->'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

#PROMPT="%F{red}Code %F{cyan}%1~$ %f"
#PROMPT="%F{red}-> %F{cyan}%1~$ %f"
#PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$cyan%}%% "
#PS1="%{$fg[cyan]%}%t %{$fg[yellow]%}%n %{$fg[red]%}%~ $%{$fg[white]%} "
PS1='%{$fg[cyan]%}%t %{$fg[yellow]%}%n %{$fg[red]%}%~ $%{$fg[green]%}$(git_branch_name)%{$fg[white]%} '
#

echo -ne '\e[5 q'
bindkey "^?" backward-delete-char


#change terminal input cursor shape
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select


# color the man page
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Basic auto/tab complete:
autoload -Uz compinit promptinit
compinit
promptinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist

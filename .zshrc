# Created by kotoji for 5.1.1

## Completion
#
autoload -U compinit
compinit
setopt nolistbeep
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# enable history-search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# incremental search with wild card
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward


## Style and Colour
# colour on 
autoload -Uz colors
colors

# prompt setting
setopt prompt_subst
case ${UID} in
0)
  
  ;;
*)
  PROMPT=''
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{[38;5;39m%}REMOTE "
  PROMPT="${PROMPT}%{[38;5;208m%}[%n@%m %~]
%{[38;5;208m%}(๑˃ᴗ˂)و%(!.#.$) %{[m%}"
  PROMPT2="%{[38;5;208m%}(๑˃ᴗ˂)و> %{[m%}"
  ;;
esac
SPROMPT="%{[38;5;9m%}%r est correct? [n, o, a, m]:%{[m%} "


# ls colors
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=1;94:ln=00;35:ex=00;91:so=32:pi=33:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
zstyle ':completion:*' list-colors "$LS_COLORS"

case ${OSTYPE} in
darwin*)
  # Mac
  export CLICOLOR=1
  alias ls='ls -GF'
  ;;
linux*)
  # Linux
  alias ls='ls -F --color'
  ;;
esac


## Alias
#
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'


## Git
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%{[38;5;134m%}!" # non-commit file exist
zstyle ':vcs_info:git:*' unstagedstr "%{[38;5;134m%}+" # non-add file exist
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
  vcs_info
  RPROMPT="${vcs_info_msg_0_}"
}

## History
#
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
LISTMAX=300
setopt hist_ignore_dups
setopt share_history


## Other options
#
setopt auto_cd
setopt auto_name_dirs
unsetopt auto_remove_slash
setopt auto_list
setopt auto_param_keys
unsetopt ignore_eof
setopt no_beep


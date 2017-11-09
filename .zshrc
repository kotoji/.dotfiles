# Created by newuser for 5.1.1

# Completion
autoload -U compinit
compinit
setopt nolistbeep
setopt correct

# Color settings
autoload -Uz colors
colors

# Prompt setting
setopt prompt_subst
case ${UID} in
0)
  
  ;;
*)
  PROMPT=''
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{[38;5;39m%}REMOTE "
  PROMPT="${PROMPT}%{[38;5;208m%}[%n@%m %~]
%{[38;5;208m%}%# %{[m%}"
  PROMPT2="%{[38;5;208m%}> %{[m%}"
  ;;
esac
SPROMPT="%{[38;5;9m%}%r est correct? [n, o, a, m]:%{[m%} "



# ls colors
export LSCOLORS=hxfxxxxxbxxxxxbxbxhxhx
export LS_COLORS='di=01;94:ln=00;35:ex=00;91'
zstyle ':completion:*' list-colors 'di=94' 'ln=35' 'ex=91'

case ${OSTYPE} in
darwin*)
  # Mac
  export CLICOLOR=1
  alias ls='ls -F'
  ;;
linux*)
  # Linux
  alias ls='ls -F --color'
  ;;
esac


# Alias
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'


# Set vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" # non-commit file exist
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" # non-add file exist
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
  vcs_info
  RPROMPT="${vcs_info_msg_0_}"
}

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history

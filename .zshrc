#!/bin/zsh

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

setopt auto_cd
setopt pushd_ignore_dups

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

autoload -U compinit; compinit

# directories
alias md='mkdir -p'
alias rd=rmdir

alias ls='ls -G'

alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# prompt
autoload -U colors; colors
setopt prompt_subst

# up/down search history with prefix
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search

bindkey -M emacs "^[[A" up-line-or-beginning-search
bindkey -M viins "^[[A" up-line-or-beginning-search
bindkey -M vicmd "^[[A" up-line-or-beginning-search
if [[ -n "${terminfo[kcuu1]}" ]]; then
  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# Start typing + [Down-Arrow] - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -M emacs "^[[B" down-line-or-beginning-search
bindkey -M viins "^[[B" down-line-or-beginning-search
bindkey -M vicmd "^[[B" down-line-or-beginning-search
if [[ -n "${terminfo[kcud1]}" ]]; then
  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# edit shell cmd in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# 0: path of current script
# a: absolute path
# h: head of path, i.e. the directory
source ${0:a:h}/git_core.zsh
source ${0:a:h}/git.zsh

# themeing
function _print_current_branch() {
  local branch="$(git_current_branch)"
  if [[ ! -z "$branch" ]]; then
    echo "%{$fg_bold[blue]%}(%{$fg[red]%}$branch%{$fg[blue]%}) "
    return
  fi
}

local ret_status="%(?:%{$fg_bold[cyan]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT=$'%{$reset_color%}%{$fg_bold[cyan]%}➜ %1~ $(_print_current_branch)%{$reset_color%}'
# use new line for commands
# PROMPT+=$'\n${ret_status}%{$reset_color%}'

# less
export LESS='--ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --window=-4'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# ------ External ------
# - kitty
# - fzf
# - zsh-autosuggestions
# - nvim
# - lazygit

# kitty
export KITTY_RC_PASSWORD=foo
alias kt="kitty"
alias ktr="kitty @ set-tab-title"

# fzf
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi

# nvim
if command -v nvim &> /dev/null; then
  alias n='nvim'
  export GIT_EDITOR=nvim
  export EDITOR=nvim
fi

# zsh-autosuggestions
[[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# lazygit
alias lg=lazygit

# ------ PERSONAL ------
# - ohmyzsh
# - fzf
# - zsh-autosuggestions
# - nvim
export FZF_BASE=/opt/homebrew/bin/fzf

plugins=(git
  gitfast # faster git branch autocomplete, but force case-sensitive completion
  fzf
  zsh-autosuggestions
)
 
#zstyle ':autocomplete:*' default-context ''
#zstyle ':autocomplete:*' min-input 1
#zstyle ':autocomplete:*' list-lines 5
#zstyle ':autocomplete:*' recent-dirs yes
#zstyle ':autocomplete:*' widget-style menu-select

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

autoload -U compinit; compinit

# themeing
ZSH_THEME=""
function _print_current_branch() {
  local branch="$(git_current_branch)"
  if [[ ! -z "$branch" ]]; then
    echo "%{$fg_bold[blue]%}(%{$fg[red]%}$branch%{$fg[blue]%}) "
    return
  fi
}

local ret_status="%(?:%{$fg_bold[cyan]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT=$'%{$reset_color%}%{$fg_bold[cyan]%}➜ %2~ $(_print_current_branch)%{$reset_color%}'
PROMPT+=$'\n${ret_status}%{$reset_color%}' # use new line for commands

# kitty
export KITTY_RC_PASSWORD=foo
alias kt="kitty"
alias ktr="kitty @ set-tab-title"
alias vi='nvim'

# less
export LESS='--ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --window=-4'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# ------ END PERSONAL ------


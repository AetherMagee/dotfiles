# Antidote install
if [ ! -d "${ZDOTDIR:-$HOME}/.antidote" ]; then
	echo "[.zshrc] Getting Antidote..."
	git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
fi

# Powerlevel10k 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Antidote init
source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# Colored ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# History
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt NO_BEEP
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# GPG fix
export GPG_TTY=$(tty)

# Zoxide
export PATH=${ZDOTDIR:-$HOME}/.local/bin:$PATH
eval "$(zoxide init zsh --cmd cd)"

# Aliases
alias plugs="nvim ${ZDOTDIR:-$HOME}/.zsh_plugins.txt && source ${ZDOTDIR:-$HOME}/.zshrc"
alias zshrc="nvim ${ZDOTDIR:-$HOME}/.zshrc && source ${ZDOTDIR:-$HOME}/.zshrc"
alias s="sudo"
alias saup="sudo apt update -y"
alias saug="sudo apt update -y && sudo apt upgrade -y"
alias sai="sudo apt install -y"
alias n="nvim"

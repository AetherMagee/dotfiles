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
zstyle ':antidote:bundle' use-friendly-names 'yes'
source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# Colored ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

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

# GPG fix
export GPG_TTY=$(tty)

# Editor
export EDITOR=nvim
export VISUAL="$EDITOR"

# Zoxide
export PATH=${ZDOTDIR:-$HOME}/.local/bin:$PATH
eval "$(zoxide init zsh --cmd cd)"

# Aliases
source ${ZDOTDIR:-$HOME}/.zsh_aliases

# Keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


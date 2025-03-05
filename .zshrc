# ====================================
# ========[INSTALLATION BLOCK]========
# ====================================

# Dependencies install
if [ ! -f "${ZDOTDIR:-$HOME}/.dotfiles-setup-complete" ]; then
 read -r "?[.zshrc] Hi! It appears to be a fresh install. Do you want to let us install the dependencies?
[.zshrc] Note: Only Debian-based distros with APT are supported.
[.zshrc] Y - Yes, N or Enter - Not now, D - Don't ask me again.
[.zshrc] >>> " response
 case "${response}" in
 [yY]*)
   echo "[.zshrc] Installing dependencies..."
   sudo apt install python3 python-is-python3 neovim zoxide
   touch "${ZDOTDIR:-$HOME}/.dotfiles-setup-complete"
  ;;
 [nN]*)
  ;;
 [dD]*)
  touch "${ZDOTDIR:-$HOME}/.dotfiles-setup-complete"
  ;;
 esac
fi

# Antidote install
if [ ! -d "${ZDOTDIR:-$HOME}/.antidote" ]; then
	echo "[.zshrc] Getting Antidote..."
	git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
fi

# =====================================
# ========[CONFIGURATION BLOCK]========
# =====================================

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

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

if [ -f "$HOME/secrets.zsh" ]; then
  source "$HOME/secrets.zsh"
fi

if [ -f "/root/.acme.sh/acme.sh.env" ]; then
  . "/root/.acme.sh/acme.sh.env"
fi


# Aether's minimalistic dotfiles
## Including:
- Powerlevel10k with Pure style
- AstroNvim
- Antidote as ZSH plugin manager
- Some fish-like plugins (see .zsh_plugins.txt)
- Useful aliases (see .zsh_aliases)

## Installation
- Make sure you use a Debian-based distro (Debian/Ubuntu/Mint/etc)
- Make sure the following packages are installed: **zsh, git, stow**
- Make sure you have **ZSH** as your default shell. You can do that with:
```
chsh -s $(which zsh)
```
...and then restarting your terminal and/or relogging.
- Run the following:
```bash
git clone --depth=1 --recurse-submodules https://github.com/AetherMagee/dotfiles ~/dotfiles
cd ~/dotfiles
stow .
cd ~
source .zshrc
```


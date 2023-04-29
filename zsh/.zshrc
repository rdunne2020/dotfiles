# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/fzf"
plug "rdunne2020/zap-exa"

# Theme
plug "zap-zsh/atmachine-prompt"

#TODO:
# Install nerdfont and setup alacritty with it

# Load my aliases
plug "${HOME}/.config/zsh/zsh_aliases"
plug "${HOME}/.config/zsh/zsh_exports"

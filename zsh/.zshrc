# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "marlonrichert/zsh-autocomplete"
plug "zsh-users/zsh-syntax-highlighting"

# Load my aliases before we set ls == exa
plug "${HOME}/.config/zsh/zsh_aliases"
plug "${HOME}/.config/zsh/zsh_exports"

plug "zap-zsh/fzf"
plug "rdunne2020/zap-exa"

# Theme
plug "zap-zsh/atmachine-prompt"

#TODO:
# Install nerdfont and setup alacritty with it

# Let C-arrow keys move words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Enable delete key, if this doesn't work run cat and press your delete key and see what code is printed to stdout
bindkey "^[[3~" delete-char

# bun config
# completions
BUN_LOCATION="${HOME}/.bun/_bun"
[ -s ${BUN_LOCATION} ] && source ${BUN_LOCATION}

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

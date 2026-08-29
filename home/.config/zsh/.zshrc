# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Aliases
. ~/.dotfiles/home/.config/shell/alias

# Plugin options
zstyle ':zephyr:plugin:editor' key-bindings vi
export KEYTIMEOUT=1 # Make mode switch fast

# Load plugins
source $HOME/.local/antidote/antidote.zsh
antidote load $ZDOTDIR/.zsh_plugins.txt

# Keybinds
bindkey "^y" autosuggest-accept

# Manually activate ssh-agent for Ubuntu
# https://wiki.archlinux.org/title/SSH_keys#ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 12h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Starship
eval "$(starship init zsh)"

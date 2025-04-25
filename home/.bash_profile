# add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# XDG Base Directory Specification
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
        
# Use neovim as manpager
export MANPAGER='nvim +Man!'

# ssh-agent setup with systemd user unit
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# texlive
export PATH="$PATH:$HOME/.local/share/texlive/2024/bin/x86_64-linux"
export MANPATH="$MANPATH:$HOME/.local/share/texlive/2024/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:$HOME/.local/share/texlive/2024/texmf-dist/doc/info"

# julia
export PATH="$HOME/.juliaup/bin:$PATH"

# Default programs
# https://wiki.archlinux.org/title/Environment_variables#Default_programs
export BROWSER="firefox"
export VISUAL="nvim"
export EDITOR=$VISUAL
export READER="zathura"

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/config.toml"

[[ -f ~/.bashrc ]] && . ~/.bashrc

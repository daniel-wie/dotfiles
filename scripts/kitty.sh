# Installation according to
# https://sw.kovidgoyal.net/kitty/binary/

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# create symlinks
cd $HOME/.local/kitty.app/
stow -v .

# make kitty the standard terminal for gnome
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $HOME/.local/bin/kitty 50

# set theme
# kitten themes --reload-in=all Catppuccin-Mocha

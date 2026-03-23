# Installation according to
# https://sw.kovidgoyal.net/kitty/binary/

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# create symlinks
cd $HOME/.local/kitty.app/
stow -v .

# set theme
# kitten themes --reload-in=all Catppuccin-Mocha

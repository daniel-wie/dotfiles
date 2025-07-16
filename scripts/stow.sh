# Manual (tedious) installtion of stow
# https://github.com/aspiers/stow/blob/master/INSTALL.md

curl -O https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
tar -xvzf stow-latest.tar.gz
rm stow-latest.tar.gz

cd stow-*

./configure --prefix=$HOME/.local && make install

rm -r stow-*

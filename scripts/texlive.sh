#!/bin/bash

# https://www.tug.org/texlive/quickinstall.html

curl -LO https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
rm install-tl-unx.tar.gz
cd install-tl-*
sudo perl ./install-tl
cd ..
rm -r install-tl-*

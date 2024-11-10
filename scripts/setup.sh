#!/bin/bash

# texlive
curl -LO https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
rm install-tl-unx.tar.gz
cd install-tl-*
perl ./install-tl
cd ..
rm -r install-tl-*

# julia
curl -fsSL https://install.julialang.org | sh 

# installs nvm (Node Version Manager)
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
# nvm install node
# npm install yarn

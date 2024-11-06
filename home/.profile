if [ -f ~/.bashrc ];
then 
    .  ~/.bashrc; 
fi 

# add ~/.local/bin to PATH
export PATH=$HOME/.local/bin:$PATH

# texlive
export PATH="$PATH:$HOME/.local/share/texlive/2024/bin/x86_64-linux"
export MANPATH="$MANPATH:$HOME/.local/share/texlive/2024/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:$HOME/.local/share/texlive/2024/texmf-dist/doc/info"

# julia
export PATH=$HOME/.juliaup/bin:$PATH

# default programs
export BROWSER="firefox"
export VISUAL="nvim"
export EDITOR=$VISUAL
export READER="zathura"

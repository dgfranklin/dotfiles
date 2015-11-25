#!/bin/bash
if [[ ! -f $HOME/.homesick/repos/homeshick/homeshick.sh ]]; then
  git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
fi
source $HOME/.homesick/repos/homeshick/homeshick.sh
homeshick clone dgfranklin/dotfiles

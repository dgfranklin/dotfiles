PS1="\W $ "

# alias ls='ls -GF'
# alias tmux='TERMINFO=/usr/share/terminfo/x/xterm-16color TERM=xterm-16color tmux -2'
if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi

eval `dircolors $HOME/.dircolors`
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


export TERM=xterm-256color
# alias ls='ls -GF'
# alias tmux='TERMINFO=/usr/share/terminfo/x/xterm-16color TERM=xterm-16color tmux -2'
[ -f ~/.bashrc_local ] && source ~/.bashrc_local

eval `dircolors $HOME/.dircolors`
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export TERM=xterm-256color

if [ -f $HOME/.bashrc ]; then
   source $HOME/.bashrc
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


fish_vi_mode
set fish_bind_mode insert
set fish_key_bindings fish_user_key_bindings

set -x FZF_DEFAULT_COMMAND /google/data/ro/users/lu/lutzky/fzf
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x EDITOR vim
set -x P4DIFF "vimdiff -R"
set -x P4MERGE vimdiff
set -x PATH \
    $HOME/.linuxbrew/bin \
    $HOME/bin \
    $PATH
set -x MANPATH $HOME/.linuxbrew/share/man $MANPATH
set -x INFOPATH $HOME/.linuxbrew/share/info $INFOPATH

# Load fishmarks (http://github.com/techwizrd/fishmarks)
. ~/.fishmarks/marks.fish
source "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"

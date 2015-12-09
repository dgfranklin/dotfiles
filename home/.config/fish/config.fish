fish_vi_mode
set fish_bind_mode insert
set fish_key_bindings fish_user_key_bindings

set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x EDITOR vim
set -x P4DIFF "vimdiff -R"
set -x P4MERGE vimdiff

# Load fishmarks (http://github.com/techwizrd/fishmarks)
# if test -e $HOME/.fishmarks/marks.fish
#    source $HOME/.fishmarks/marks.fish
# end

if test -e "$HOME/.homesick/repos/homeshick/homeshick.fish"
    source "$HOME/.homesick/repos/homeshick/homeshick.fish"
end

if test -e $HOME/.config/fish/config_local.fish
  source $HOME/.config/fish/config_local.fish
end

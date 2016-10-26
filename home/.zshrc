# load zgen
source "${HOME}/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen prezto
    zgen prezto prompt theme 'sorin'
    zgen prezto environment
    zgen prezto terminal
    zgen prezto editor
    zgen prezto history
    zgen prezto spectrum
    zgen prezto completion
    zgen prezto prompt
    zgen prezto utility

    #bulk load
    zgen loadall <<EOPLUGINS
    joel-porquet/zsh-dircolors-solarized
    Tarrasch/zsh-bd
EOPLUGINS
    # save all to init script
    zgen save
fi

zstyle ':prezto:module:prompt' theme 'sorin'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Speed up FZF
#
export FZF_DEFAULT_COMMAND=$HOME/.fzf_default_command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export VISUAL='vim'
export EDITOR='$VISUAL'
export P4DIFF='vimdiff -R'
export P4MERGE='vimdiff'
bindkey -v

autoload run-help
HELPDIR=/usr/local/google/home/dgfranklin/.linuxbrew/share/zsh/help

# Pass non-matching regexes on instead of producing an error. Useful for git revisions.
unsetopt nomatch

envfile="$HOME/.zshrc.`uname`"
[ -f $envfile ] && source $envfile

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.zshrc_local ]; then
         source ~/.zshrc_local
fi


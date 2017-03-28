# load zplug
source "${HOME}/.zplug/init.zsh"

zplug "Tarrasch/zsh-bd"
zplug "themes/sorin", as:theme, from:oh-my-zsh

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load

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
bindkey '^?' backward-delete-char

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

homeshick --quiet refresh

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
export FZF_DEFAULT_COMMAND='ag -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore review
      \ --g ""'

export VISUAL='vim'
export EDITOR='$VISUAL'
export P4DIFF='vimdiff -R'
export P4MERGE='vimdiff'
bindkey -v

envfile="$HOME/.zshrc.`uname`"
[ -f $envfile ] && source $envfile

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.zshrc_local ]; then
         source ~/.zshrc_local
fi


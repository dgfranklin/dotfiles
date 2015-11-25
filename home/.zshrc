# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

zstyle ':completion:*' hosts off
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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

if [ -f ~/.zshrc_local ]; then
        source ~/.zshrc_local
    fi

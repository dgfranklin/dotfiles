# load zplug
source "${HOME}/.zplug/init.zsh"

zplug "Tarrasch/zsh-bd"
zplug "lib/history", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "modules/utility", from:prezto


# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load

autoload -U +X compinit && compinit
autoload -U bashcompinit && bashcompinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Prompt - use starship if available, otherwise fall back to simple prompt
[[ -f ~/.starship.zsh ]] && source ~/.starship.zsh
if [[ -z "$STARSHIP_SHELL" ]]; then
  autoload colors; colors;
  setopt prompt_subst
  PROMPT='%{$fg[cyan]%}%c %(!.%{$fg_bold[red]%}#.%{$fg_bold[green]%}❯)%{$reset_color%} '
fi

# Speed up FZF
#
# export FZF_DEFAULT_COMMAND=$HOME/.fzf_default_command
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export P4MERGE='vimdiff'

bindkey -v
bindkey '^?' backward-delete-char

# Use 'v' to edit commands in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

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

function update-x11-forwarding
{
    if [ -z "$STY" -a -z "$TMUX" ]; then
        echo $DISPLAY > ~/.display.txt
    else
        export DISPLAY=`cat ~/.display.txt`
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Evaluate after sourcing zshrrc_local incase nvim installed 
if (( $+commands[nvim] )); then
  export VISUAL='nvim'
else
  export VISUAL='vim'
fi
export EDITOR="$VISUAL"

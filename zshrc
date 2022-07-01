#ZSH
source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

antigen bundle git
antigen bundle npm
antigen bundle encode64
antigen bundle colorize
antigen bundle github
antigen bundle brew
antigen bundle macos

antigen bundle arialdomartini/oh-my-git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

export HISTSIZE=100000
export ZSH=$HOME/.oh-my-zsh

source $ZSH/oh-my-zsh.sh

# Functions

## Brew serach, filter with fzf, and download
bsi () {
  brew install $(brew search $1 | fzf ) 
}


## Clone repo and remove git folder 
degit () {
  projname=$(basename $1 .git)
  git clone $1 $2

  if test -z $2
  then
      rm -rf ./$projname/.git
  else
      rm -rf ./$2/.git
  fi
}

# Aliases
alias gs='git status'
alias cat='bat'
alias ping='prettyping --nolegend'
alias top='btm'
alias zshconfig="code ~/.zshrc"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias rm="trash"
alias foam="code ~/Documents/Foam"
alias ll="exa -al"
alias ls="exa"
alias slink="xcrun simctl openurl booted"
alias slinkp="pbpaste && pbpaste | xargs xcrun simctl openurl booted"
alias haste="pbpaste | haste | pbcopy"

# Gitgud
# source ~/dotfiles/scripts/gitgud.sh

# Pure prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

zstyle :prompt:pure:git:stash show yes
PURE_GIT_STASH_SYMBOL=🗄
RPROMPT='%{$reset_color%}%T %{$fg_bold[white]%}%{$reset_color%}'

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Openjdk
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PyEnv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Python version manager
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# macOS
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES

# Tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	tmux a || tmux
fi

# SSH
eval "$(ssh-agent -s)"
ssh-add --apple-load-keychain
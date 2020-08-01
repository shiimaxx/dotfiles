# Emacs mode
bindkey -e


# Starship
eval "$(starship init zsh)"


# aliases
alias tmuxs='tmux new -s $(basename $(pwd))'
alias ll='ls -l'


# Golang
export PATH=$PATH:/usr/local/go/bin:~/go/bin


# peco
bindkey '^]' peco-src
function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-src


# env
export EDITOR=vim


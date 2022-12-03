autoload -Uz compinit && compinit

eval "$(starship init zsh)"
eval "$(rbenv init - zsh)"

alias awk=gawk
alias date=gdate
alias cut=gcut
alias egrep=gegrep
alias fgrep=gfgrep
alias grep=ggrep
alias head=ghead
alias ls=gls
alias sed=gsed
alias tail=gtail
alias tar=gtar

alias ll='ls -l'

# Go
export PATH=$PATH:~/go/bin

# ghq + peco
bindkey '^]' ghq-peco
function ghq-peco() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-peco

# k8s
alias k=kubectl
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

autoload -Uz compinit && compinit

which gawk > /dev/null && alias awk=gawk
which gdate > /dev/null && alias date=gdate
which gcut > /dev/null && alias cut=gcut
which gegrep > /dev/null && alias egrep=gegrep
which gfgrep > /dev/null && alias fgrep=gfgrep
which ggrep > /dev/null && alias grep=ggrep
which ghead > /dev/null && alias head=ghead
which gls > /dev/null && alias ls=gls
which gsed > /dev/null && alias sed=gsed
which gtail > /dev/null && alias tail=gtail
which gtar > /dev/null && alias tar=gtar

alias ll='ls -l'


eval "$(starship init zsh)"
eval "$(rbenv init - zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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

files=$(test -d ~/.zsh.d && ls ~/.zsh.d/*)
for file in ${files}; do
  source ${file}
done

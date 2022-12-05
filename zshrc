autoload -Uz compinit && compinit

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

# Bash aliases, sourced from ~/.bashrc

# Enable alias expansion for all shells, including non-interactive
shopt -s expand_aliases

# To setup home dir repo:
# git clone --bare <repo>
# git --git-dir=$HOME/.home.git --work-tree=$HOME checkout
alias hgit='git --git-dir=$HOME/.home.git --work-tree=$HOME'

alias ls='ls -F'
alias ll='ls -AlF'
alias la='ls -AF'
alias ds='du -hs * | sort -hr'
alias yank="xclip -selection clipboard"
alias put="xclip -o -selection clipboard"
alias matlab="(matlab -nodesktop -nosplash -nodisplay -nojvm)"
alias pyunit="python -m unittest"
alias cprofile="python -m cProfile"
alias backup="rsync -AaHvXz --delete $BACKUPEXCLUDE --partial-dir=.rsync-tmp --progress ~/* $BACKUPDIR"

open() {
  for arg in "$@"; do
    (xdg-open "$arg" &> /dev/null &)
  done
}

trash() {
  mkdir -p ~/.trash;
  for arg in "$@"; do
    mv "$arg" ~/.trash/
  done
}

hash() {
  h=$(echo "$1" | shasum)
  echo "${h%%  -}"
}

dispmd() {
  for arg in "$@"; do
    tmp_fn=/tmp/$(hash $(readlink -f "$arg")).pdf
    pandoc "$arg" -o "$tmp_fn"
    open "$tmp_fn"
  done
}

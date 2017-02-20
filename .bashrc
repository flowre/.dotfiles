# Bash config file
# To setup home dir repo:
# git clone --bare <repo>
# git --git-dir=$HOME/.home.git --work-tree=$HOME checkout

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't save history
unset HISTFILE
export LESSHISTFILE=/dev/null

# Keep the values of LINES and COLUMNS updated
shopt -s checkwinsize

# Set default editor
export EDITOR=vim

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME"

# Travis
[ -f /home/felix/.travis/travis.sh ] && source /home/felix/.travis/travis.sh

# Tex
export TEXMFHOME="$HOME/.texmf"

# Aliases

alias hgit='git --git-dir=$HOME/.home.git --work-tree=$HOME' # Don't delete

alias ls='ls -F'
alias ll='ls -AlF'
alias la='ls -AF'
alias ds='du -hs * | sort -hr'
alias yank="xclip -selection clipboard"
alias put="xclip -o -selection clipboard"
alias backup="rsync -AaHvXz --delete --exclude=.* --exclude=downloads --partial-dir=.rsync-tmp --progress ~/* backup:$(hostname)/"
#alias restore="rsync -AaHvXz --update --exclude=.* --exclude=downloads --partial-dir=.rsync-tmp --progress backup:$(hostname)/* ~"
alias update="sudo ~/.home/install"
alias startqemu="gui qemu-system-x86_64 --enable-kvm -m 4G"
alias matlab="(matlab -nodesktop -nosplash -nodisplay -nojvm)"
alias pyunit="python -m unittest"
alias cprofile="python -m cProfile"

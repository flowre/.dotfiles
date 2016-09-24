# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Enable aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Don't save history
unset HISTFILE
export LESSHISTFILE=/dev/null

# Keep the values of LINES and COLUMNS updated
shopt -s checkwinsize

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME"

# Travis
[ -f /home/felix/.travis/travis.sh ] && source /home/felix/.travis/travis.sh

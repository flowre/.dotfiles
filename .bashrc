# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Tex
export TEXMFHOME="~/.texmf"

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME"

# Qt
export QTDIR="/usr/lib/x86_64-linux-gnu/qt4"

# 256 colors
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
		export TERM='xterm-256color'
	else
		export TERM='xterm-color'
fi

# History
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Keep the values of LINES and COLUMNS updated
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac


# Colored prompt

#force_color_prompt=yes
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# added by travis gem
[ -f /home/felix/.travis/travis.sh ] && source /home/felix/.travis/travis.sh

# Don't save history
unset HISTFILE
export LESSHISTFILE=/dev/null

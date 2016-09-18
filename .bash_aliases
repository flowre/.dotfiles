# Bash aliases, sourced from ~/.bashrc
# Requires at least Bash 4 (for &> operator), maybe other dependecies

# enable alias expansion for all shells, including non-interactive
shopt -s expand_aliases

alias ll='ls -alF'
alias la='ls -A'
alias ..='cd ..'
alias .='open .'
alias get="2>&1 xclip -selection c" # Pipe to clipboard
alias put="xclip -selection clipboard -o" # Pipe from clipboard
alias sudo='sudo ' # Allows aliases after sudo
function sudofm { nohup sudo -b thunar "$1" &> /dev/null ; }
function open {
	# If no args, open .
	for arg in "$@"; do
		nohup xdg-open "$arg" &> /dev/null &
	done
}
alias hgit='git --git-dir=$HOME/.home.git --work-tree=$HOME'
alias matlab="matlab -nodesktop -nosplash -nodisplay -nojvm"
alias ssh='ssh -X'
alias cims='fmoody@access.cims.nyu.edu'
alias pyunit="python -m unittest"
alias cprofile="python -m cProfile"

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

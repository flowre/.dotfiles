# Bash aliases, sourced from ~/.bashrc

# To setup home dir repo:
# git clone --bare <repo>
# git --git-dir=$HOME/.home.git --work-tree=$HOME checkout
alias hgit='git --git-dir=$HOME/.home.git --work-tree=$HOME'

# enable alias expansion for all shells, including non-interactive
shopt -s expand_aliases

alias ls='ls -F'
alias ll='ls -alF'
alias la='ls -AF'
alias ..='cd ..'
alias .='open .'
alias get="2>&1 xclip -selection c" # Pipe to clipboard
alias put="xclip -selection clipboard -o" # Pipe from clipboard
alias sudo='sudo ' # Allows aliases after sudo
function sudofm { nohup sudo -b thunar "$1" &> /dev/null ; }
function open {
	if [ "$#" -eq  0 ]; then
		open .;
	else
		for arg in "$@"; do
			nohup xdg-open "$arg" &> /dev/null &
		done
	fi
}

function goon {
	echo $#
}
alias matlab="matlab -nodesktop -nosplash -nodisplay -nojvm"
alias pyunit="python -m unittest"
alias cprofile="python -m cProfile"

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
alias ..='cd ..'
alias yank="xclip -selection clipboard"
alias put="xclip -o -selection clipboard"
alias matlab="matlab -nodesktop -nosplash -nodisplay -nojvm"
alias pyunit="python -m unittest"
alias cprofile="python -m cProfile"
alias conup="nmcli con up id"

# Fix how rsync treats args with trailing slash
function rsync {
	acc=""
	for arg in "$@"; do
		if [ $arg != "/" ]; then
			arg="${arg%/}";
		fi
		acc+=" ${arg}";
	done
	command rsync -AaHPvXz ${acc}
}

function open {
	if [ "$#" -eq  0 ]; then
		open .;
	else
		for arg in "$@"; do
			nohup xdg-open "$arg" &> /dev/null &
		done
	fi
}

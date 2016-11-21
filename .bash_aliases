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
alias matlab="(matlab -nodesktop -nosplash -nodisplay -nojvm)"
alias pyunit="python -m unittest"
alias cprofile="python -m cProfile"
alias conup="nmcli con up id"
alias backup="rsync -AaHvXz --partial-dir=.rsync-tmp --progress --exclude=.* "\
"--exclude=private --exclude=downloads ~/* server:~"

function dispmd {
	for arg in "$@"; do
		abs_fn=$(readlink -f "$arg");
		hash=$(echo "$abs_fn" | shasum);
		tmp_fn=/tmp/"${hash%%  -}".pdf;
		pandoc "$arg" -o "$tmp_fn";
		open "$tmp_fn";
	done
}

function open {
	for arg in "$@"; do
		(xdg-open "$arg" &> /dev/null &)
	done
}

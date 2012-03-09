## Reset umask
umask 027

## setup emacs style command line editing, override vi
set -o emacs

## personal aliases here
alias ls='ls -FB'
alias ll='ls -l'
alias la='ls -a'
alias lsf='ls -F'
alias rm='rm -i'
alias ..='cd ..;echo `pwd`'
alias ...='cd ..;cd ..;echo `pwd`'
alias tmux='TERM=screen-256color tmux'
alias ssh='TERM=vt100 ssh'

if [ "$TERM" = "screen" -o "$TERM" = "xterm" -o "$TERM" = "network" ]
then
	export TERM=vt100
fi
COLORTERM=true; export COLORTERM

export EDITOR=emacs

# set path
PATH=$PATH:$HOME/bin
PATH=/usr/local/bin:$PATH
export PATH

## set prompt - multiline
export PS1='\n\w\n\u@\h \! %'


# Check for an interactive session
[ -z "$PS1" ] && return

#Include ArchLinux Logo: (archlogorc file)
#. ~/.archlogorc

# Shell prompt
export LS_OPTIONS='--color=auto -lh'
eval `dircolors`
export GREP_OPTIONS='--color=auto'

#aliases
alias ls='ls $LS_OPTIONS' 

#Devel
alias be='bundle exec'

PATH=$PATH:/var/lib/gems/1.9.1/bin
PATH=$PATH:/usr/local/rvm/bin
PATH=$PATH:~/.gem/ruby/1.9.1/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM

# Git tab completion
source ~/.git-completion.bash

# Bash completion
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# Use EMACS
export EDITOR=/usr/bin/emacs
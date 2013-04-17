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
alias open='xdg-open'

#Devel
alias be='bundle exec'
alias g='git'
alias gs='git status'
alias gl='git log'
alias rspec='rspec --format NyanCatFormatter'
alias firefox-dev='firefox -P dev -no-remote </dev/null &>/dev/null &'

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

# Specific per-machine bash stuff:
if [ -f .bash_spec ]; then
. .bash_spec
fi

# Use EMACS
export EDITOR='/usr/bin/emacs -nw'
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Extract
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

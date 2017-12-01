# Check for an interactive session
[ -z "$PS1" ] && return

#Include ArchLinux Logo: (archlogorc file)
#. ~/.archlogorc

# Shell prompt
export LS_OPTIONS='--color=auto -lh'
eval `dircolors`

#aliases
alias ls='ls $LS_OPTIONS'
alias open='xdg-open'

#Devel
alias be='bundle exec'
alias g='git'
alias gs='git status'
alias gl='git log'
#alias rspec='rspec --format NyanCatFormatter'
alias firefox-dev='firefox -P dev -no-remote </dev/null &>/dev/null &'
alias search='grep -irn'
alias uu='sudo apt-get update'
alias ug='sudo apt-get dist-upgrade'
alias uur='sudo apt-get autoremove'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT1| grep -E "state|to\ full|percentage"'
alias serve_dir='ruby -run -e httpd . -p 9090'
alias hconsole='heroku local:run bundle exec rails console'
alias hserver='heroku local:run bundle exec rails server'
alias hspec='heroku local:run bundle exec rspec'
alias fpc='fpc -Co -Cr -Mtp -gl'
alias e='emacsclient -n'
alias nw='emacsclient -t'

PATH=$PATH:~/workspace/picandocodigo/shell-scripting

# Git tab completion
source ~/.git-completion.bash

# Bash completion
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
export GIT_PS1_SHOWDIRTYSTATE=1

export PS1='\[\033[01;32m\]\u\[\033[01;34;10m\]@\[\033[01;36m\]\h\[\033[01;34m\] \[\033[01;34m\]\w\[\033[01;33m\] `date +%H:%M:%S`\[\033[01;36m\]$(__git_ps1)\n\[\033[01;34m\]\$\[\033[00m\] '

# Specific per-machine bash stuff:
if [ -f .bash_spec ]; then
. .bash_spec
fi

# Use EMACS
export EDITOR='/usr/bin/emacs -nw'

# Extract
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjfv $1     ;;
        *.tar.gz)    tar xzfv $1     ;;
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

# Rails
openlatestmigration() {
    $EDITOR db/migrate/$(ls -tr db/migrate | tail -1)
}

# ASDF - https://github.com/asdf-vm/asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

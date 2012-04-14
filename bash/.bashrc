# Check for an interactive session
[ -z "$PS1" ] && return

#Include ArchLinux Logo: (archlogorc file)
#. ~/.archlogorc

# Shell prompt
export LS_OPTIONS='--color=auto -l'
eval `dircolors`

#aliases
alias ls='ls $LS_OPTIONS' 

#Devel
alias be='bundle exec'

export EDITOR="emacs"
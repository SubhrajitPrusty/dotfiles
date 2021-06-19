#
# ~/.bashrc
#

# use auto-completion after those words
complete -cf sudo
complete -cf man
complete -cf killall
complete -cf pkill
complete -cf fakeroot
complete -cf respawn
complete -cf pgrep
complete -cf aptitude

# GIT and other autocomplete

for file in /etc/bash_completion.d/* ; do
    source "$file"
done

## FUNCTIONS

# . dir sizes
dirsize () {
	du -hd 1
}

wiki () {
	links "http://en.wikipedia.org/w/index.php?search=${*// /+}"
}
ddg () {
	links "http://duckduckgo.com/lite?q=${*// /+}"
}

rt () {
    if [ $# -eq 0 ]; then
        xttitle ${PWD##*/}
    else
        xttitle $1
    fi
}

## ALIASES

## Terminal
alias quit="exit"
alias c="clear"
alias df="df -h"

# Make some output colorful
alias la="ls -alhF"
alias lm="la | less"
alias ccal=" cal | grep -A7 -B7 --color=auto $(date +%d)"

# job control
alias mtop="ps --no-header -eo pmem,size,vsize,comm | sort -nr | sed 10q"
alias ctop="ps --no-header -eo pcpu,comm | sort -nr | sed 10q"

# misc
alias pipes="pipes.sh"
alias htop="htop -d 3"
alias matrix="cmatrix -b -u 3 -C blue"
alias fcl="fortune | cowsay | lolcat"
alias fortune="fortune -a"
alias scrot="scrot -d 2"
alias nethogs="sudo nethogs"
alias killall="killall -v"
alias links="links2"
alias synaptic="sudo synaptic"
alias cv="xclip -selection clipboard -o"

# power options
alias shutdown="sudo shutdown -P"
alias pm-suspend="sudo pm-suspend"
alias hibernate="sudo pm-hibernate"
alias reboot="sudo reboot"

# Workspaces
alias cdx="cd /media/subhrajit/OS/Users/subhrajit/code/"


## EXPORTS

# make multiple shell share same history file
export HISTSIZE=10000           # bash history will save N commands
export HISTFILESIZE=${HISTSIZE} # bash will remember N commands
export HISTCONTROL=ignoreboth   # ingore duplicates and spaces
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history:c'

# LANG to utf8
export LANG=en_IN.utf8

# make urxvt work better
export TERM='xterm-256color'
# export TERM='linux'

# scripts path
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/Scripts/
export PATH=$PATH:/opt/Telegram

# YARN/NODE
export PATH=$PATH:/home/subhrajit/.yarn/bin

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# POSTMAN PATH
export PATH=$PATH:/opt/Postman/app/


## POWERLINE

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /home/subhrajit/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh

###

## WORK


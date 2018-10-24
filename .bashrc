#
# ~/.bashrc
#

## INIT {{{

# # If not running interactively, don't do anything
# [[ $- != *i* ]] && return

# # Check if root for functions & aliases
# _isroot=false
# [[ $UID -eq 0 ]] && _isroot=true

# Colors
# fg=('\e[0;30m\' '\[\e[0;31m\]' '\[\e[0;32m\]' '\[\e[0;33m\]'
#     '\[\e[0;34m\]' '\[\e[0;35m\]' '\[\e[0;36m\]' '\[\e[0;37m\]'
#     '\[\e[1;30m\]' '\[\e[1;31m\]' '\[\e[1;32m\]' '\[\e[1;33m\]'
#     '\[\e[1;34m\]' '\[\e[1;35m\]' '\[\e[1;36m\]' '\[\e[1;37m\]')
# nofg='\[\e[0m\]'
# fd=${fg[1]}

# use auto-completion after those words
complete -cf sudo
complete -cf man
complete -cf killall
complete -cf pkill
complete -cf fakeroot
complete -cf respawn
complete -cf pgrep
complete -cf aptitude

# }}}

# ## FUNCTIONS {{{

# . dir sizes
dirsize () {
	du -hd 1
}

# consult vim's help
:h () {
	vim +"h $1" +only +'map q ZQ'
}

wiki () {
	links "http://en.wikipedia.org/w/index.php?search=${*// /+}"
}
ddg () {
	links "http://duckduckgo.com/lite?q=${*// /+}"
}

## }}}

## ALIASES {{{

## Terminal
alias quit="exit"
alias c="clear"
alias df="df -h"

# Make some output colorful
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias la="ls -alhF"
alias lm="la | less"
alias ccal=" cal | grep -A7 -B7 --color=auto $(date +%d)"

# job control
alias mtop="ps --no-header -eo pmem,size,vsize,comm | sort -nr | sed 10q"
alias ctop="ps --no-header -eo pcpu,comm | sort -nr | sed 10q"

## }}}


## EXPORTS {{{

# colored manpages
if $_isxrunning; then
	export PAGER=less
	export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
	export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
	export LESS_TERMCAP_me=$'\E[0m'           # end mode
	export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
	export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
	export LESS_TERMCAP_ue=$'\E[0m'           # end underline
	export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
fi

# make multiple shell share same history file
export HISTSIZE=10000           # bash history will save N commands
export HISTFILESIZE=${HISTSIZE} # bash will remember N commands
export HISTCONTROL=ignoreboth   # ingore duplicates and spaces
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history:c'

#basic shit

export PS1="\u:\w: "

## }}}

# aliases

alias sap="sudo apt"
alias pipes="pipes.sh"
alias htop="htop -d 3"
alias shutdown="sudo shutdown -P"
alias matrix="cmatrix -b -u 3 -C blue"
alias fcl="fortune | cowsay | lolcat"
alias fortune="fortune -a"
alias sapi="sudo apt install"
alias sapp="aptitude search"
alias scrot="scrot -d 2"
alias nethogs="sudo nethogs"
alias killall="killall -v"
alias hibernate="sudo pm-hibernate"
alias links="links2"
alias reboot="sudo reboot"
alias synaptic="sudo synaptic"
alias cv="xclip -selection clipboard -o"

# added by Anaconda2 installer
export PATH="/home/subhrajit/anaconda2/bin:$PATH"

# copy to work folder
alias cdx="cd /media/subhrajit/Windows/Users/Subhrajit/Documents/CDX/"

# flutter path
export PATH="/media/subhrajit/Apps/dev/flutter/bin:$PATH"

# jdk path

# export JAVA_HOME="/usr/bin"
# export PATH="$PATH"

export JAVA_HOME="/opt/jdk1.8.0_181/"
export PATH="$JAVA_HOME/bin:$PATH"

# android studio path
export PATH="/media/subhrajit/Apps/dev/android-studio/bin:$PATH"

# ANDROID_HOME

export ANDROIDSDK="/media/subhrajit/Apps/dev/android-sdk"
export ANDROIDNDK="/media/subhrajit/Apps/dev/android-ndk"
export ANDROIDNDKVER="r18"
export ANDROID_HOME="/media/subhrajit/Apps/dev/android-sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# powerline config
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

# scripts path

export PATH=$PATH:$HOME/Scripts/

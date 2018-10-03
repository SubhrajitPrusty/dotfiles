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

# Alias to avoid some "PERKELE!!!"
alias :q="quit"
alias cd..="cd .."
alias df="df -h"
alias perkele="quit"

# Make some output colorful
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias la="ls -alhF"
alias lm="la | less"
alias ccal=" cal | grep -A7 -B7 --color=auto $(date +%d)"

# job control
alias mtop="ps --no-header -eo pmem,size,vsize,comm | sort -nr | sed 10q"
alias ctop="ps --no-header -eo pcpu,comm | sort -nr | sed 10q"

## stupid shit
alias fman="man --html=firefox"

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

#export PATH=/usr/share/local/bin:$PATH
export PATH=/home/subhrajit/scripts:$PATH
#export PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"
#export PS1="${fd}> ${nofg}"
#eval $(ssh-agent)
#ssh-add

export PS1="\u:\w: "

## }}}

# aliases

alias sap="sudo apt-get"
alias pipes="pipes.sh -p 5 -t 3"
alias htop="htop -d 3"
alias shutdown="sudo shutdown -P"
alias matrix="cmatrix -b -u 3 -C blue"
alias fcl="fortune | cowsay | lolcat"
alias fortune="fortune -a"
alias fastboot="sudo fastboot"
alias sapi="sudo apt-get install"
alias sapp="aptitude search"
alias ncmpcpp="mpd && ncmpcpp"
alias scrot="scrot -d 2"
alias rm="rm -v"
alias nethogs="sudo nethogs"
alias killall="killall -v"
alias hibernate="sudo pm-hibernate"

alias vnstat="vnstat -ru"
alias reboot="sudo reboot"
alias fb="links m.facebook.com"
alias ortel="links cm.ortel.net"
alias neton="nmcli c up id Ethernet"
alias netoff="nmcli c down id Ethernet"

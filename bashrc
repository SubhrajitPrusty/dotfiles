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

# DONOT load profile in rc
# # Load bash profile
#
# if [ -f ~/.bash_profile ]; then
#     . ~/.bash_profile
# fi
#
## FUNCTIONS

# . dir sizes
dirsize () {
	du -hd 1
}

wiki () {
	links2 "http://en.wikipedia.org/w/index.php?search=${*// /+}"
}
ddg () {
	links2 "http://duckduckgo.com/lite?q=${*// /+}"
}

rt () {
    if [ $# -eq 0 ]; then
        kitty @ set-tab-title "${PWD##*/}"
    else
        kitty @ set-tab-title "${1}"
    fi
}

vol () {
    current_sink=$(pactl list sinks short | grep "RUNNING" | cut -f 1)
    pactl set-sink-volume $current_sink $1
}

pretty_csv () {
    column -t -s, -n "$@" | less -F -S -X -K
}

changelog () {
    if [ -z $1 ]; then
        git log --no-merges --pretty="- %s" origin/master..HEAD
    else
        git log --no-merges --pretty="- %s" $1..HEAD
    fi
}

mem () {
  local process_name="$1"
  if [ -z "$process_name" ]; then
    echo "Usage: get_total_mem process_name"
    return 1
  fi

  ps aux | grep "$process_name" | grep -v grep | awk '{sum+=$6} END {print "Total '"$process_name"' memory: " sum/1024 " MB"}'
}

## ALIASES

## Terminal
alias quit="exit"
alias c="clear"
alias df="df -h"
alias rm="rm -v"

# Modern LINUX

alias ls="lsd"
# alias fd="fdfind"
alias gtop="docker run --rm -it --name gtop --net="host" --pid="host" aksakalli/gtop"

# Fix dircolors bg issue
# directories with +rwx are unreadable without this
export LS_COLORS+=':ow=01;33'

# Make some output colorful
alias la="ls -alhF"
alias lm="la | less"

# job control
alias mtop="ps --no-header -eo pmem,size,vsize,comm,pid | sort -nr | sed 10q"
alias ctop="ps --no-header -eo pcpu,comm,pid | sort -nr | sed 10q"

# misc
alias ll="ls -l"
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
alias latest="ls -lt | head -n 10"
alias icat="kitty +kitten icat"
alias ffmpeg="ffmpeg -hide_banner"

# power options
alias shutdown="sudo shutdown -P"
alias pm-suspend="sudo pm-suspend"
alias hibernate="sudo pm-hibernate"
alias reboot="sudo reboot"

# Workspaces
alias cdx="cd $HOME/source/code"

# code
# alias pytest="pytest --disable-warnings"
alias kc="DEBUG= kubectl"
alias kx="DEBUG= kubectx"
alias gitprune='git branch -D $(git branch -v | grep "\[gone\]" | cut -d" " -f 3)'
alias pgcli="$(pyenv whence --path pgcli) postgresql://postgres:pass@localhost:5432/"

## EXPORTS

# shopt -s histappend
export HISTFILESIZE=9999999 # no limit for bash history
export HISTSIZE=9999999 # idk
export HISTCONTROL=ignoreboth # ignore spaces and dupes
export HISTIGNORE='shutdown now:history'
# share all history across open shells
export PROMPT_COMMAND='history -a'

# LANG to utf8
export LANG=en_IN.utf8

# make urxvt work better
export TERM='xterm-256color'
# export TERM='linux'

# no logs for howdy
export OPENCV_LOG_LEVEL=0
export OPENCV_VIDEOIO_PRIORITY_INTEL_MFX=0

# scripts path
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:/opt/nvim-linux64/bin"

# YARN/NODE
export PATH=$PATH:$HOME/.yarn/bin

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# golang
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$(go env GOPATH)/bin"
export GOPATH="$(go env GOPATH)"

# Linkerd
export PATH=$PATH:$HOME/.linkerd2/bin

# Rust
export PATH=$PATH:$HOME/.cargo/bin/

# Powerline-(go)

function _update_ps1() {
    # PS1="$($GOPATH/bin/powerline-go -error $? -jobs $(jobs -p | wc -l))"
    # echo "powerline-go"
    PS1="$($GOPATH/bin/powerline-go -error $? -hostname-only-if-ssh -cwd-max-depth 2 -numeric-exit-codes -modules venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,root)"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

# UPDATE PROMPT

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# later alias
alias vim=nvim
alias vi=nvim

# Powerline (Python)

# function _update_ps1() {
#     echo "powerline python"
#     time PS1=$(powerline-shell $?)
# }
#
# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

###

# teleport
export TELEPORT_PASSWORD=""
export TELEPORT_EMAIL=""
export TELEPORT_SECRET=""

# pritunl
export PRITUNL_PROFILE_ID=""
export PRITUNL_PROFILE_PIN=""
export PRITUNL_SECRET=""
export PRITUNL_EMAIL=""

# studio-totp
export STUDIO_SECRET=""

# amazon totp
export AMAZON_SECRET=""

# Always keep this at end

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# export PYENV_VERSION="3.10.6"

alias pya="pyenv activate"
alias pyd="pyenv deactivate"

# D2
DESTINY_API_KEY=""

# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# docker
export DOCKER_BUILDKIT=1
# totp
export PATH=$PATH:$HOME/source/totp/

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.helm_autocomplete ]; then
  . ~/.helm_autocomplete
fi

if [ -f ~/.tp-completion.bash ]; then
  . ~/.tp-completion.bash
fi

if [ -f ~/.kubectl-completion.bash ]; then
  . ~/.kubectl-completion.bash
fi

# GIT and other autocomplete
for file in /etc/bash_completion.d/* ; do
    source "$file"
done

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# Ctrl+R and Ctrl+T
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# direnv
# eval "$(direnv hook bash)"
_direnv_hook() {
  local previous_exit_status=$?;
  trap -- '' SIGINT;
  eval "$("/usr/bin/direnv" export bash)";
  trap - SIGINT;
  return $previous_exit_status;
};
if ! [[ "${PROMPT_COMMAND:-}" =~ _direnv_hook ]]; then
  PROMPT_COMMAND="_direnv_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi

# logcli completions
# eval "$(logcli --completion-script-bash)"
_logcli_bash_autocomplete() {
    local cur prev opts base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$( ${COMP_WORDS[0]} --completion-bash ${COMP_WORDS[@]:1:$COMP_CWORD} )
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _logcli_bash_autocomplete logcli

# thefuck
# eval "$(thefuck --alias)"
# function fuck () {
#     TF_PYTHONIOENCODING=$PYTHONIOENCODING;
#     export TF_SHELL=bash;
#     export TF_ALIAS=fuck;
#     export TF_SHELL_ALIASES=$(alias);
#     export TF_HISTORY=$(fc -ln -10);
#     export PYTHONIOENCODING=utf-8;
#     TF_CMD=$(
#     thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@"
#     ) && eval "$TF_CMD";
#     unset TF_HISTORY;
#     export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
#     history -s $TF_CMD;
# }



# pyenv
# eval "$(pyenv init --path)"
# NOTE: This is repeated again down the line

PATH="$(bash --norc -ec 'IFS=:; paths=($PATH); for i in ${!paths[@]}; do if [[ ${paths[i]} == "'$HOME/.pyenv/shims'" ]]; then unset '\''paths[i]'\''; fi; done; echo "${paths[*]}"')"
export PATH="$HOME/.pyenv/shims:${PATH}"
# command pyenv rehash 2>/dev/null

# ## eval "$(pyenv init -)"

# PATH="$(bash --norc -ec 'IFS=:; paths=($PATH); for i in ${!paths[@]}; do if [[ ${paths[i]} == "'$HOME/.pyenv/shims'" ]]; then unset '\''paths[i]'\''; fi; done; echo "${paths[*]}"')"
# export PATH="$HOME/.pyenv/shims:${PATH}"
# export PYENV_SHELL=bash
# source '$HOME/.pyenv/libexec/../completions/pyenv.bash'
# command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  activate|deactivate|rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}

## eval "$(pyenv virtualenv-init -)"

# export PATH="$HOME/.pyenv/plugins/pyenv-virtualenv/shims:${PATH}";
# export PYENV_VIRTUALENV_INIT=1;
# _pyenv_virtualenv_hook() {
#   local ret=$?
#   if [ -n "$VIRTUAL_ENV" ]; then
#     eval "$(pyenv sh-activate --quiet || pyenv sh-deactivate --quiet || true)" || true
#   else
#     eval "$(pyenv sh-activate --quiet || true)" || true
#   fi
#   return $ret
# };
#
# if ! [[ "$PROMPT_COMMAND" =~ _pyenv_virtualenv_hook ]]; then
#   PROMPT_COMMAND="_pyenv_virtualenv_hook;$PROMPT_COMMAND"
# fi


# HEVC Firefox
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_X11_EGL=1


# Function to run in PROMPT_COMMAND
# Checks when a directory is changed, then
# renames the current shell title to the dir name
# activates the pyenv virtualenv if .python-version file is present
function check_dir_change() {
    if [[ "$PWD" != "$LAST_DIR" ]]; then
        rt # rename shell title
        if [ -f ".python-version" ]; then
            version=$(cat .python-version)
            dir_name=${PWD##*/}  # Get current directory name
            if [[ $version =~ ^3\. ]]; then
                pyenv activate $dir_name > /dev/null
            else
                pyenv activate $(cat .python-version) > /dev/null
            fi
        fi
        LAST_DIR="$PWD"
    fi
}

# Add the function to PROMPT_COMMAND
PROMPT_COMMAND="check_dir_change;$PROMPT_COMMAND"

# trivy scan
# alias trivy="docker run -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.cache/trivy/:/root/.cache/ aquasec/trivy:latest"

# cargo is rust pkg manager
# . "$HOME/.cargo/env"

export PATH=$PATH:$HOME/.pyenv/bin/

# nvm is npm version manager

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export OPENAI_API_KEY=""
alias llm=$(pyenv whence --path llm)

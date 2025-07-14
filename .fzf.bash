# Setup fzf
# ---------
if [[ ! "$PATH" == */home/subhrajit/source/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/subhrajit/source/fzf/bin"
fi

eval "$(fzf --bash)"

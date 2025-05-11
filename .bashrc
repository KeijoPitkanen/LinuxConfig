#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Check for active terminal sessions
active_terminals=$(who | grep -E 'tty|pts' | wc -l)

# Check for active kitty terminal processes
active_kitty=$(pgrep -c -u $USER kitty)

# If no active kitty terminals, run the command
if [ "$active_kitty" -eq 1 ]; then
  fastfetch
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

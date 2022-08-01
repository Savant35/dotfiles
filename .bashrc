#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#bash colors
reset="\[\033[0m\]"
black="\[\033[1;30m\]"
red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
yellow="\[\033[0;33m\]"
blue="\[\033[1;34m\]"
magenta="\[\033[0;35m\]"
cyan="\[\033[0;36m\]"
white="\[\033[0;37m\]"
bg_black="\[\033[0;40m\]"
bg_red="\[\033[0;41m\]"
bg_green="\[\033[0;42m\]"
bg_yellow="\[\033[0;43m\]"
bg_blue="\[\033[1;44m\]"
bg_magenta="\[\033[0;45m\]"
bg_cyan="\[\033[1;46m\]"

#customize PS1
#PS1="\n$blue┌─────($red\u$blue)─────($green\w$blue)\n└>$cyan\$$reset"
PS1="\n$blue┌─────$black$bg_blue $black$bg_blue\u$reset$blue─────$blue$black$bg_blue\w$reset$blue\n└>$cyan\$ $reset"
PS0="\e[2 q"


#add vim mode 
set -o vi
bind '"jk":vi-movement-mode'

#LS_colors disable directory hightligt
LS_COLORS=$LS_COLORS:'ow=1;34;' ; export LS_COLORS

#fzf keybindings
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

#bash aliases
source ~/.config/bash/aliases
[ -f "$XDG_CONFIG_HOME/bash/aliases" ] && source "$XDG_CONFIG_HOME/bash/aliases"


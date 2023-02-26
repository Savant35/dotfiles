#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
#other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CATCHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

#Disable files
export LESSHISTFILE=-
export EDITOR="vim"
export SVN_EDITOR="vim"

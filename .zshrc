# harry's config 

# Enable colors and change prompt:
autoload -U colors && colors

#unset bell
unsetopt BEEP

#set up beutiful prompts
newline=$'\n'
#PS1="%B%F{blue}┌─────%f%F{black}%K{blue}%n%k%f%F{blue}─────%f%F{black}%K{blue}%~%k%f%F{blue}${newline}└>%f%F{cyan}\$%f%b "
PS1="%F{blue}┌─────%F{black}%K{blue} %k%f%f%F{black}%K{blue}%n%k%f%F{blue}─────%f%F{black}%K{blue}%~%k%f%F{blue}${newline}└>%f%F{cyan}\$%f "

# History in cache directory:
#HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
bindkey jk vi-cmd-mode
#export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Add autosuggestions
if [ -d "$ZDOTDIR/plugins/zsh-autosuggestions" ]; then
  source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
  git clone --quiet "https://github.com/zsh-users/zsh-autosuggestions" "$ZDOTDIR/plugins/zsh-autosuggestions"
  source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

# Add syntax-highlighting
if [ -d "$ZDOTDIR/plugins/zsh-syntax-highlighting" ]; then
  source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
  git clone --quiet "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$ZDOTDIR/plugins/zsh-syntax-highlighting"
  source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Load aliases and shortcuts if existent.
[ -f "$ZDOTDIR/shortcut" ] && source "$ZDOTDIR/shortcut"
[ -f "$ZDOTDIR/aliases" ] && source "$ZDOTDIR/aliases"

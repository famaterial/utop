# Create autosuggest-accept widget
autosuggest-accept() {
  zle accept-line
}

zle -N autosuggest-accept
bindkey '^[r' autosuggest-accept

# Your existing configuration
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[yellow]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.local/share/zsh_history"
bindkey -e
export EDITOR=vim
alias t="translate"
alias m="cd $HOME/mucator/testing/testingv24"
alias .l="cd $HOME/.local/bin/"
alias z="zathura"
alias xclip="xclip -sel clip"
alias c="cd $HOME/CIS-260/"
alias b="cd $HOME/BUS-155/"
alias e="cd $HOME/ENG-101/"
source $HOME/.config/shell/aliasrc
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


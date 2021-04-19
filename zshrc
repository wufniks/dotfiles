export GPG_TTY=$(tty)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zinit ice wait"0" blockf
zinit light zsh-users/zsh-completions

zinit ice wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

zinit light simnalamburt/cgitc

eval "$(starship init zsh)"
eval "$(pyenv init -)"
eval "$(zoxide init zsh)"

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi

#
# zsh-sensible
#
if (( $+commands[lsd] )); then
  alias l='lsd -Al --date=relative --group-dirs=first --blocks=permission,user,size,date,name'
  alias ll='lsd -l --date=relative --group-dirs=first --blocks=permission,user,size,date,name'
  alias lt='lsd --tree --depth=2 --date=relative --group-dirs=first'
else
  alias l='ls -alh'
  alias ll='ls -lh'
fi
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

HISTSIZE=90000
SAVEHIST=90000
HISTFILE=~/.zsh_history

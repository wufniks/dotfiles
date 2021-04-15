[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zinit ice wait"0" blockf
zinit light zsh-users/zsh-completions

zinit ice wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# zinit ice compile"*.lzui" from"notabug"
# zinit load zdharma/zui

# zinit light zdharma/zplugin-crasis

zinit snippet OMZ::plugins/git/git.plugin.zsh
# zinit ice svn; zinit snippet OMZ::plugins/z

# initializing starship
eval "$(starship init zsh)"

#export EDITOR=/usr/local/bin/micro
#export VISUAL=/usr/local/bin/micro

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /usr/local/etc/profile.d/z.sh

### Added by Zinit's installer
source '/Users/hshin/.zinit/bin/zinit.zsh'
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

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

# if [[ ! $EMACS ]]; then
#     zinit light romkatv/powerlevel10k
#     source ~/.purepower
# else
#     zinit cdclear -q # <- forget completions provided up to this moment
#     setopt promptsubst
#     zinit snippet OMZ::themes/zhann.zsh-theme
# fi

# initializing starship
eval "$(starship init zsh)"

#export EDITOR=/usr/local/bin/micro
#export VISUAL=/usr/local/bin/micro

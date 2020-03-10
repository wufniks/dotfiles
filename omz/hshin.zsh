[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /usr/local/etc/profile.d/z.sh

### Added by Zplugin's installer
source '/Users/hshin/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

zplugin ice compile"*.lzui" from"notabug"
zplugin load zdharma/zui

zplugin light zdharma/zplugin-crasis

zplugin snippet OMZ::plugins/git/git.plugin.zsh
# zplugin ice svn; zplugin snippet OMZ::plugins/z

# if [[ ! $EMACS ]]; then
#     zplugin light romkatv/powerlevel10k
#     source ~/.purepower
# else
#     zplugin cdclear -q # <- forget completions provided up to this moment
#     setopt promptsubst
#     zplugin snippet OMZ::themes/zhann.zsh-theme
# fi

# initializing starship
eval "$(starship init zsh)"

#export EDITOR=/usr/local/bin/micro
#export VISUAL=/usr/local/bin/micro

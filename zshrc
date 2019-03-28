# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# export PATH=$PATH:/Users/hshin/.cargo/bin:/usr/local/sbin
# export PATH="$HOME/.cargo/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias amazon_ssh='ssh -o StrictHostKeyChecking=no -i ~/.ssh/amazon_ubuntu.pem -l ubuntu $@'
alias amazon_ssh_tvacr='ssh -o StrictHostKeyChecking=no -i ~/.ssh/tvacr.pem -l ubuntu $@'
alias la="exa -abghl --git --color=automatic"
# alias c='pygmentize -O style=borland -f console256 -g'


. /usr/local/etc/profile.d/z.sh

alias cl='colorls --sort-dirs --report'
alias ct='colorls --tree'

source $(dirname $(gem which colorls))/tab_complete.sh

alias upload_bionic='docker run -it --rm -v `pwd`:/src -w /src -e DEB_S3_CODENAME=bionic dreg.be/devops/deb-s3:0.1.0 $@'

alias ec='/usr/local/bin/emacsclient -nc'

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
zplugin ice svn; zplugin snippet OMZ::plugins/z

zplugin light romkatv/powerlevel10k
source ~/.purepower

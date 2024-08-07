# .zshenv

export OS="$(uname -s)"

#########
# Editors
#########

export EDITOR='nvim'
export PAGER='bat'
export VISUAL='nvim'

#####
# XDG
#####

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share"
export XDG_RUNTIME_DIR="$HOME/.local/run/user/$(id -u)"

# Rust / Cargo
export CARGO_HOME="$HOME"/.cargo
# export CARGO_HOME="$XDG_DATA_HOME"/cargo
# export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
# export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
# export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
# export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# zsh + tools
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export _Z_DATA="$XDG_CACHE_HOME"/.z

# zinit
declare -A ZINIT
ZINIT[HOME_DIR]="$ZDOTDIR"/.zinit
ZINIT[BIN_DIR]="$ZDOTDIR"/.zinit/bin
ZINIT[PLUGINS_DIR]="$ZDOTDIR"/.zinit/plugins
ZINIT[COMPLETIONS_DIR]="$ZDOTDIR"/.zinit/completions
ZINIT[SNIPPETS_DIR]="$ZDOTDIR"/.zinit/snippets
ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME"/zcompdump/zcompdump-zinit

# Python
export PYENV_ROOT=$HOME/.pyenv

#############
# PATH Config
#############

# TODO: https://www.arp242.net/zshrc.html#easier-path

export PATH="$PATH:$CARGO_HOME/bin"
# export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin"
# export PATH="$PATH:$HOME/.poetry/bin"
# export PATH="$PATH:$HOME/Applications"
# export PATH="$PATH:/sbin"
# export PATH="$PATH:/usr/local"
# export PATH="$PATH:/usr/local/bin"
# export PATH="$PATH:/usr/local/sbin"
# export PATH="$PATH:/usr/sbin"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/node@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@16/include"

#############
# ETC
#############

export BAT_THEME="gruvbox-dark"

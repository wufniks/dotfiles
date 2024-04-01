# .zshrc for macOS and Linux
# Aaron Lichtman (@alichtman)

# TODO {{{
#
# 1. Sort out vim bindings
#
# }}}

OS="$(uname -s)"

# Prompt {{{

# Config in ~/.config/starship.toml
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/default.toml"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# END Prompt }}}

# Plugins {{{

source "${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit wait lucid for \
	OMZL::clipboard.zsh \
	OMZL::compfix.zsh \
	OMZL::correction.zsh \
    atload"
        alias ..='cd ..'
        alias ...='cd ../..'
        alias ....='cd ../../..'
        alias .....='cd ../../../..'
    " \
	OMZL::git.zsh \
	OMZL::grep.zsh \
	OMZL::history.zsh \
	OMZL::key-bindings.zsh \
	OMZL::spectrum.zsh \
	OMZL::termsupport.zsh \
    atload"
        alias gcd='gco dev'
    " \
	OMZP::git \
	OMZP::fzf \
	OMZP::ssh-agent \
	OMZP::kubectl \
    atload"
        alias dcupb='docker-compose up --build'
    " \
	OMZP::docker-compose \
    as"completion" \
    OMZP::docker/_docker \
    djui/alias-tips \
    hlissner/zsh-autopair \
    chriskempson/base16-shell \
    atuinsh/atuin

# https://github.com/zdharma/zinit-configs/blob/a60ff64823778969ce2b66230fd8cfb1a957fe89/psprint/zshrc.zsh#L277
zinit wait lucid for \
 silent atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 as"completion" \
    zsh-users/zsh-completions \
 atload"!export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=yellow,fg=white,bold'" \
    zsh-users/zsh-history-substring-search \
 pick"git-it-on.plugin.zsh" \
    peterhurford/git-it-on.zsh \
 pick"autoenv.zsh" \
    Tarrasch/zsh-autoenv \
 atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
    trapd00r/LS_COLORS

# END Plugins }}}

# zsh-history-substring-search {{{

setopt HIST_IGNORE_ALL_DUPS

# Bind up and down arrow keys

if [ "$OS" = "Darwin" ]; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
elif [ "$OS" = "Linux" ]; then
    # https://superuser.com/a/1296543
    # key dict is defined in /etc/zsh/zshrc
    bindkey "$key[Up]" history-substring-search-up
    bindkey "$key[Down]" history-substring-search-down
fi

# Bind j and k for in vim mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# END zsh-history-substring-search }}}

# z and fz {{{

FZ_CMD=j
FZ_SUBDIR_CMD=jj

# END z and fz }}}

# ssh {{{

# zstyle :omz:plugins:ssh-agent identities id_momenti

# END ssh }}}

# Completion {{{

# Automatically refresh completions
zstyle ':completion:*' rehash true
# Highlight currently selected tab completion
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _expand _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' group-name '' # group results by category

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Use hyphen-insensitive completion. Case sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Include dotfiles in completions
setopt globdots

# homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# type '...' to get '../..'
# Please don't ask me how this works. I have absolutely no idea.
# Mikel Magnusson <mikachu@gmail.com> wrote this.
function _rationalise-dot() {
  local MATCH MBEGIN MEND
  if [[ $LBUFFER =~ '(^|/| |    |'$'\n''|\||;|&)\.\.$' ]]; then
    LBUFFER+=/
    zle self-insert
  fi
  zle self-insert
}
zle -N _rationalise-dot
bindkey . _rationalise-dot
# without this, typing a . aborts incremental history search
bindkey -M isearch . self-insert

# Load completions
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit -d $XDG_CACHE_HOME/zcompdump/default

# END Completion }}}

# General zsh Behavior {{{

set termguicolors

# cd without needing "cd"
setopt auto_cd

# Fix $ git reset --soft HEAD^ error.
unsetopt nomatch

# Append a trailing `/' to all directory names resulting from globbing
setopt mark_dirs

# Shift+Tab to get reverse menu completion
bindkey '^[[Z' reverse-menu-complete

# END General zsh Behavior }}}

# History {{{

setopt inc_append_history   # append history list to the history file (important for multiple parallel zsh sessions!)
setopt share_history        # import new commands from the history file also in other zsh-session
setopt extended_history     # save each command beginning timestamp and the duration to the history file
setopt hist_ignore_space    # remove command lines from the history list when the first character on the line is a space

export HIST_STAMPS="yyyy.mm.dd"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
export HISTFILE="$XDG_CACHE_HOME/.zsh_history"

# END History }}}

# Emacs Mode {{{

bindkey -e

# END vim }}}


# Backgrounding and Unbackgrounding {{{

# Use Ctrl-z swap in and out of vim (or any other process)
# https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
function ctrl-z-toggle () {
  if [[ $#BUFFER -eq 0 ]]; then
	BUFFER="setopt monitor && fg"
	zle accept-line
  else
	zle push-input
	zle clear-screen
  fi
}
zle -N ctrl-z-toggle
bindkey '^Z' ctrl-z-toggle

# END Backgrounding and Unbackgrounding }}}

# Disarm rm {{{

# Prompt to confirm rm DIR/*
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# END Disarm rm }}}

# Sourcing Other Files {{{

[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"

# Load other dotfiles
for file in $XDG_CONFIG_HOME/zsh/.{aliases,zfunctions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# END Sourcing Other Files }}}

# Startup Tools {{{

function execute_cmd_if_exists() {
    if hash "$1" 2>/dev/null; then
        "$1"
    fi
}

execute_cmd_if_exists year-progress
execute_cmd_if_exists tls

# END Startup Tools }}}

export GPG_TTY=$(tty)

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

HISTSIZE=90000
SAVEHIST=90000
HISTFILE=~/.zsh_history


eval "$(op completion zsh)"; compdef _op op

#!/usr/bin/env bash

eval "$(/opt/homebrew/bin/brew shellenv)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# If pyenv is on PATH, load it and set the python interpreter version.
if hash pyenv; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    # pyenv global 3.8.1
fi

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :


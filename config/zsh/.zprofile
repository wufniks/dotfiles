#!/usr/bin/env bash

CPU=$(uname -m)
if [[ "$CPU" == "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  export PATH=/opt/homebrew/bin:$PATH
  eval "$(/usr/local/bin/brew shellenv)"
fi

alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias abrew="arch -arm64 /opt/homebrew/bin/brew"


# If pyenv is on PATH, load it and set the python interpreter version.
if hash pyenv; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    # pyenv global 3.8.1
fi


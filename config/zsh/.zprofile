#!/usr/bin/env bash

eval "$(/opt/homebrew/bin/brew shellenv)"

# If pyenv is on PATH, load it and set the python interpreter version.
if hash pyenv; then
    eval "$(pyenv init -)"
    # pyenv global 3.8.1
fi

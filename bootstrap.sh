#!/bin/bash

# installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install rustup
curl https://sh.rustup.rs -sSf | sh

brew install pyenv pyenv-virtualenv zsh starship z

# https://wesleywiser.github.io/post/vscode-vim-repeat-osx/
# repeat key press in vim mode in vscode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# link custom setting for omz
ln -s $(pwd)/omz/hshin.zsh ~/.oh-my-zsh/custom/

# install zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
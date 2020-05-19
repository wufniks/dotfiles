#!/bin/bash

# installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install rustup
curl https://sh.rustup.rs -sSf | sh

# brew install pyenv pyenv-virtualenv zsh starship z tig
brew bundle

# https://wesleywiser.github.io/post/vscode-vim-repeat-osx/
# repeat key press in vim mode in vscode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# link custom setting for omz
ln -s $(pwd)/omz/hshin.zsh ~/.oh-my-zsh/custom/

# install zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# # install cascadia font
# brew tap homebrew/cask-fonts && brew cask install font-cascadia-nerd-font

# install emacs-plus
# brew tap d12frosted/emacs-plus && brew install emacs-plus
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

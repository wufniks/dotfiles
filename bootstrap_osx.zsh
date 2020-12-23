#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR=$HOME/.dotfiles

install_homebrew() {
	if ! type brew > /dev/null; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
	brew update
}

# prerequisite
prepare() {
    xcode-select --install || true
	install_homebrew
}

install_formulas() {
    # brew install pyenv pyenv-virtualenv zsh starship z tig
    brew bundle --file $DOTFILES_DIR/Brewfile
}

configure() {
    # https://wesleywiser.github.io/post/vscode-vim-repeat-osx/
    # repeat key press in vim mode in vscode
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
}

main() {
	prepare

	git clone https://github.com/wufniks/dotfiles.git $DOTFILES_DIR

	install_formulas

	# install rustup
	curl https://sh.rustup.rs -sSf | sh


	# install oh my zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# link custom setting for omz
	ln -s $DOTFILES_DIR/omz/hshin.zsh ~/.oh-my-zsh/custom/

	# install zinit
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

	cat $DOTFILES_DIR/zshrc >> $(HOME)/.zshrc

	# install emacs-plus
	# brew tap d12frosted/emacs-plus && brew install emacs-plus
	git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
	~/.emacs.d/bin/doom install

	configure
}

main $@

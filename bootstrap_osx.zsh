#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${HOME}/.dotfiles"
ITERM_COLOR_SCHEME="${DOTFILES_DIR}/iTerm2-Color-Schemes"

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
    brew bundle --file ${DOTFILES_DIR}/Brewfile
}

configure() {
    # https://wesleywiser.github.io/post/vscode-vim-repeat-osx/
    # repeat key press in vim mode in vscode
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
    # do simllar thing for intellij too
    defaults write -g ApplePressAndHoldEnabled -bool false
}

main() {
    prepare

    if [ ! -d ${DOTFILES_DIR} ]; then
        git clone https://github.com/wufniks/dotfiles.git ${DOTFILES_DIR} --recursive
    fi

    cp ${DOTFILES_DIR}/.zshenv ${HOME}/.zshenv

    if [ -d ${HOME}/.config ]; then
        mv ${HOME}/.config ${HOME}/.config.bak
    fi
    ln -s ${DOTFILES_DIR}/config ${HOME}/.config

    install_formulas

    # install rustup
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


    # install oh my zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # install zinit
    sh -c "$(curl -fsSL https://git.io/zinit-install)"

    # setup doom emacs
    git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install

    # color themes
    if [ ! -d $ITERM_COLOR_SCHEME ]; then
    	git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git ${ITERM_COLOR_SCHEME}
    fi
    echo "Installed iterm2 color scheme"

    # install vim-plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    echo "Installed vim-plug"

    ln -s $DOTFILES_DIR/.vimrc $HOME/.vimrc
    echo "Installed vim configuration"

    # install intellimacs
    git clone https://github.com/MarcoIeni/intellimacs ~/.intellimacs
    ln -s $DOTFILES_DIR/.ideavimrc $HOME/.ideavimrc

    configure
}

main $@

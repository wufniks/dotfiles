call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Enable true colors if available
set termguicolors
" Enable italics, Make sure this is immediately after colorscheme
" https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
highlight Comment cterm=italic gui=italic

set bg=dark
colorscheme gruvbox

set rtp+=/opt/homebrew/opt/fzf

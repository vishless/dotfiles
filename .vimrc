filetype plugin indent on " show existing tab with 4 spaces width
set tabstop=4 " when indenting with '>', use 4 spaces width
set shiftwidth=4 " On pressing tab, insert 4 spaces
set expandtab
set number " Show line numbers

if empty(glob('vimfiles/autoload/plug.vim'))
  silent !curl -fLo vimfiles/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('vimfiles/plugged')
  Plug 'preservim/nerdtree'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
call plug#end()

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cs_checkers = ['code_checker']

" theme
colorscheme gruvbox
set background=dark

let mapleader=","
nmap <leader>ne :NERDTree<cr>

set lines=45 columns=150
set guifont=Fira_Code_Medium:h11:W500:cANSI:qDRAFT

" Airline Theme
let airline_theme='base16'

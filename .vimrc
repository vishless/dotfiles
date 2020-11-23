"filetype plugin indent on " show existing tab with 4 spaces width
"syntax enable " enable syntax highlighting
set nocompatible " no compatibility with vi
set tabstop=4 " when indenting with '>', use 4 spaces width
set shiftwidth=4 " On pressing tab, insert 4 spaces
set expandtab " convert tabs to spaces
set hidden " switch buffer without saving
set wildmode=longest,list " vertical autocomplete menu for Ex-mode 
set number " Show line numbers
set relativenumber

if empty(glob('vimfiles/autoload/plug.vim'))
  silent !curl -fLo vimfiles/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('vimfiles/plugged')
  Plug 'preservim/nerdtree'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} 
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'tpope/vim-rails'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
call plug#end()

" OmniSharp
let g:OmniSharp_translate_cygwin_wsl = 1
let g:OmniSharp_server_use_mono = 1

" ALE
let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'javascript': ['flow-language-server']
\}
let b:ale_linters = ['cs', 'flow-language-server']

" COC
let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'
let g:coc_npm_path = 'C:\Program Files\nodejs\node_modules\npm\bin\npm.exe'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cs_checkers = ['code_checker']

" Airline Theme
let airline_theme='base16'

" theme
colorscheme gruvbox
set background=dark

let mapleader=","
nmap <leader>ne :NERDTree<cr>

set lines=45 columns=150
set guifont=Fira_Code_Medium:h11:W500:cANSI:qDRAFT

filetype indent on " show existing tab with 4 spaces width
set autoindent
"syntax enable " enable syntax highlighting
set fileformat=unix	
set encoding=utf-8
set fileencoding=utf-8
set nocompatible " no compatibility with vi
set tabstop=2 " when indenting with '>', use 4 spaces width
set shiftwidth=2 " On pressing tab, insert 4 spaces
set expandtab " convert tabs to spaces
set hidden " switch buffer without saving
set wildmenu
set wildmode=longest,list " vertical autocomplete menu for Ex-mode 
"set number " Show line numbers
set mouse=a
set cursorline
set cursorcolumn
set splitright
set splitbelow
set autoread
set hlsearch

" Relative numbers for Normal mode &
" Absolute numbers for Insert mode
"set number relativenumber
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

"Replace trailing space with dot
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/

" Searching files recursively
set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/vendor/gems/
set wildignore+=**/webpack/**
" The double / will ensure filename with path
set directory=$HOME/.vim/swapfiles//

" Remove garbage spilling on screen
"autocmd vimenter * colorscheme slate

if empty(glob('$HOME/.vim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rails'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    "Plug 'OmniSharp/omnisharp-vim'
    "Plug 'dense-analysis/ale'
    "Plug 'neoclide/coc.nvim', {'branch': 'release'} 
    "Plug 'vim-syntastic/syntastic'
    Plug 'tpope/vim-surround'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'tpope/vim-dispatch'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
call plug#end()

" OmniSharp
let g:OmniSharp_translate_cygwin_wsl = 1
let g:OmniSharp_server_use_mono = 1

" ALE
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
let b:ale_linters = ['cs', 'flow-language-server']

" COC
" let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'
" let g:coc_npm_path = 'C:\Program Files\nodejs\node_modules\npm\bin\npm.exe'
let g:coc_disable_startup_warning = 1

" statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cs_checkers = ['code_checker']

" theme
colorscheme gruvbox 
set background=dark

" Airline Theme
let airline_theme='dark'

" auto formatting of files that have "@format" or "@prettier" tag
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.md,*.yaml,*.html PrettierAsync" Mapping

" Fugitive - Gwrite error - Cannot write buftype option is set
set buftype=""

" ** KEY BINDS **
let mapleader=","
" Execute current file
nmap <leader>r :!%:p<cr>
" toggle NerdTree (file browser)
nmap <leader>nt :NERDTree<cr>
" find the open file in NerdTree
nmap <leader>nf :NERDTreeFind<cr>
"<cword>"<cr> " Search word under cursor
noremap <leader>ag :Ag!

" set lines=45 columns=150
set guifont=Fira_Code_Medium:h11:W500:cANSI:qDRAF

" TO-DO Binds
" create a new todo item
"map do o_ 
" create a sub todo item
"map st o<Tab>_ 
" check off a todo item and time stamp it
"map ne ^rx: <Esc>:r! date +" [\%H:\%M]"<ENTER>kJA<Esc>$

set shellpipe=> "Prevent commadn results flashing in terminal
set tags=./tags,tags;$HOME

filetype indent on " show existing tab with 4 spaces width
set autoindent
set encoding=utf-8
set nocompatible " no compatibility with vi
set tabstop=2 " when indenting with '>', use 4 spaces width
set shiftwidth=2 " On pressing tab, insert 4 spaces
set expandtab " convert tabs to spaces
set hidden " switch buffer without saving
set wildmenu
set wildmode=longest,list " vertical autocomplete menu for Ex-mode 
set number " Show line numbers
set mouse=a
set cursorline
set cursorcolumn
set splitright
set splitbelow
set autoread
set ignorecase
set nofixendofline
"set hlsearch
"set fileformat=unix	
"set fileencoding=utf-8

" Relative numbers for Normal mode &
" Absolute numbers for Insert mode
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Searching files recursively
set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/vendor/gems/
set wildignore+=**/webpack/**
" The double / will ensure filename with path
set directory=$HOME/.config/nvim/swapfiles//

if empty(glob('$HOME/.local/share/nvim/site/autoload/'))
	silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.config/nvim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rails'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ThePrimeagen/harpoon'
call plug#end()

" theme
colorscheme gruvbox 
set background=dark

" Airline Theme
let airline_theme='dark'

" Fugitive - Gwrite error - Cannot write buftype option is set
set buftype=""

" ** KEY BINDS **
let mapleader=" "

" NerdTree (file browser)
nmap <leader>nt :NERDTree<cr>
nmap <leader>nf :NERDTreeFind<cr>

" Telescope
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>

" Git
nmap <leader>gs :Git<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>gr :Gread<cr>

" Harpoon
nnoremap <leader>ha <cmd>lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>hu <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>

" RG search word under cursor
nmap <leader>rw yiw :Rg <C-r>"<cr>

" VIM execute current file
nmap <leader>ve :!%:p<cr>

" set lines=45 columns=150
set guifont=Fira_Code_Medium:h11:W500:cANSI:qDRAF

" TO-DO Binds
" create a new todo item
map do o_ 
" check off a todo item and time stamp it
map ne ^rx: <Esc>:r! date +" [\%H:\%M]"<ENTER>kJA<Esc>$
" create a sub todo item
"map st o<Tab>_ 

set shellpipe=> "Prevent commadn results flashing in terminal
set tags=./tags,tags;$HOME

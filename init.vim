filetype indent on " show existing tab with 4 spaces width
set autoindent
set encoding=utf-8
set nocompatible " no compatibility with vi
set tabstop=2 " when indenting with '>', use 4 spaces width
set shiftwidth=2 " On pressing tab, insert 4 spaces
set linespace=10
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
set backspace=indent,eol,start
set nobackup		" do not keep a backup file
set nowritebackup
set autoindent		" always set autoindenting on
set autoread		" Load changed files without alerting us all the time
set splitbelow
set splitright
set scrolloff=2 	 " Scroll vertially before hitting the edges of the window
set sidescrolloff=5 " Scroll horizontally before hitting the edges of the window
" Write files before many operations
set autowrite
" … but keep the undo buffer when we switch files, otherwise autowrite can
" cause some nasty data loss
set hidden
set cursorline
set cursorcolumn
set nowrap
set updatetime=300
set shellpipe=> "Prevent commadn results flashing in terminal
set tags=./tags,tags;$HOME
" code folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
set nohlsearch
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gcmt/taboo.vim'
Plug 'ap/vim-buftabline'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
call plug#end()

" theme
colorscheme gruvbox 
set background=dark

" Airline Theme
let airline_theme='dark'

" Fugitive - Gwrite error - Cannot write buftype option is set
set buftype=""

" COC.nvim

" Solargraph is for ruby support
let g:coc_global_extensions = ['coc-solargraph']

" <Tab> completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ** KEY BINDS **
let mapleader=" "

nmap <leader>rw yiw :Rg <C-r>"<cr>

" NerdTree (file browser)
nmap <leader>nt :NERDTree<cr>
nmap <leader>nf :NERDTreeFind<cr>

" Fzf
nmap <leader>ff :Files<cr>
nmap <leader>fb :Buffers<cr>

" Git
nmap <leader>gs :Git<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>gr :Gread<cr>

" Harpoon
nnoremap <leader>ha <cmd>lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>hu <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>

" set lines=45 columns=150
set guifont=Fira_Code_Medium:h11:W500:cANSI:qDRAF

" Ref: https://betterhumans.pub/this-alternative-todo-list-will-help-you-complete-100-tasks-every-day-aae1130faac8
" create a new todo item
map do o_ 
" check off a todo item and time stamp it
map ne ^rx: <Esc>:r! date +" [\%H:\%M]"<ENTER>kJA<Esc>$

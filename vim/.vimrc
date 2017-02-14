" === Vundle ===
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'leafgarland/typescript-vim'

" removing file-line for the moment :(
" opening multiple files (e.g. `vim a b c`) results in filetype only
" being detected for the first file.
"Plugin 'bogado/file-line'
Bundle 'tpope/vim-fugitive'

" Language-specific
Plugin 'fatih/vim-go'
Plugin 'rodjek/vim-puppet'

call vundle#end()
filetype plugin indent on

" === Plugin settings ===

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" === General things ===
syntax enable
set modeline
set encoding=utf-8

" I don't know where half this crap comes from
set number
set t_Co=256
set autoindent
set smartindent
set showcmd
set showmatch
set ruler
set tw=0
set hlsearch
set incsearch
set magic
set ttyfast
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set splitbelow
set splitright
set hidden
set wildmenu
set wildmode=list:longest
set title
set novisualbell
set completeopt=menuone,menu,longest,preview
set ignorecase
set smartcase
set bs=2
set shortmess=a
set cmdheight=2

" Default indentation
set backspace=indent,eol,start
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Language-specific settings
au FileType ruby setlocal sw=2 ts=2 sts=2

augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" === Keybindings ===

" change leader to space
let mapleader=" "
noremap \ <nop>

" Open NERDtree
nmap <leader>t :NERDTreeToggle<cr>

" Open tagbar
nmap <leader>a :TagbarToggle<cr>

" Indentation keybindings
map <leader>2 :set sw=2 ts=2 sts=2<cr>
map <leader>4 :set sw=4 ts=4 sts=4<cr>

" Switch windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Switch buffers
nmap <leader>h :bprev<CR>
nmap <leader>l :bnext<CR>

nmap <leader>w :bp <BAR> bd #<CR>

" nohl
nmap <Leader>n :nohl<CR>

" === Misc crap ===

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Fix indenting with #
:inoremap # X<BS>#

" I'm a pleb
set mouse=a

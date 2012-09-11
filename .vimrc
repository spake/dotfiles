syntax enable
filetype on
filetype indent on
filetype plugin on
set encoding=utf-8

" indentation
set backspace=indent,eol,start
set smarttab
set expandtab
set sw=4
set tabstop=4
set softtabstop=4

" general
set number
set t_Co=256
set autoindent
set smartindent
"set copyindent
"set preserveindent
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

" following taken from http://items.sjbach.com/319/configuring-vim-right
set hidden
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest
set title
set novisualbell
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore=*.o,*.pyc,*.class,*.so            " compiled files
set wildignore+=ve/**                            " virtualenv folders
set completeopt=menuone,menu,longest,preview

" searching
set ignorecase
set smartcase
nnoremap * *<c-o> " Don't move on *

" backspace should work across lines
set bs=2

" cursor moves through visual lines, not real lines
map <Up> gk
map <Down> gj

" clean whitespace
map <leader>W  :%s/\s\+$//<cr>:let @/=''<CR>

" reduce vi compatibility
set nocompatible
set modeline

" Pathogen
"""call pathogen#runtime_append_all_bundles()
"""call pathogen#helptags()

" Close Tag
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" colour scheme
"""set background=dark
"""let g:solarized_termcolors=256
"""let g:solarized_termtrans=1
"""let g:solarized_termcolors=256
"""let g:solarized_contrast="high"
"""let g:solarized_visibility="high"
"""colorscheme solarized
"""call togglebg#map("<F5>")

" NERDcommenter
"""nmap <C-c> <plug>NERDCommenterToggle<CR>
"""vmap <C-c> <plug>NERDCommenterToggle<CR>

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" colourful LISP brackets
let g:lisp_rainbow=1

" fix indenting
:inoremap # X<BS>#

" add python run support
map <F5> :w<CR>:!python %<CR>

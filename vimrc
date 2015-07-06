
"No vi mode
set nocp

" vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" vundle end

filetype plugin on "Enable file specific plugins
filetype indent on
"vim latex-suite load properly
let g:tex_flavor='latex'


set autoread
"set 256 color mode
set t_Co=256
"share system clipboard
set clipboard=unnamed
"tabs and syntax
set expandtab "replace tabs with spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set ruler
set autoindent
set smartindent
set mouse=a
set backspace=indent,eol,start

syntax enable
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
colorscheme solarized

set autochdir
set backup
set backupdir=~/.vim/backup
set noerrorbells
set novisualbell
set wildmenu
set wildmode=list:longest,full
set showmatch
"completetion
set completeopt=menu,preview
set ofu=syntaxcomplete#Complete
"search
set hlsearch
set incsearch
set ignorecase
set smartcase


" Fast window resizing with +/- keys (horizontal); / and * keys (vertical)
if bufwinnr(1)
    map <kPlus> <C-W>+
    map <kMinus> <C-W>-
    map <kDivide> <c-w><
    map <kMultiply> <c-w>>
endif

set list listchars=tab:»\ ,trail:·,eol:$
map <silent> <F2> :set list! <CR>
map <silent> <F3> :!wc -w %<CR>
"hilight long lines
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/

"when vimrc edited reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %


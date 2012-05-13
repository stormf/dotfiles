
"No vi mode
set nocp
filetype plugin on "Enable file specific plugins
filetype indent on

set autoread

"share system clipboard
set clipboard=unnamed
"tabs and syntax
set expandtab "replace tabs with spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
syntax on
set number
set ruler
set autoindent
set smartindent
set mouse=a
set backspace=indent,eol,start
"set background=dark

set autochdir
set backup
set backupdir=~/.vim/backup
set noerrorbells
set novisualbell
set wildmenu
set wildmode=list:longest
set showmatch
"completetion
set completeopt=menu,preview
set ofu=syntaxcomplete#Complete
"search
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
map <silent> <F3> :!wc -w % <CR>
"hilight long lines
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/

"when vimrc edited reload it
autocmd! bufwritepost vimrc source ~/.vimrc

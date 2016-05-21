"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cosmtrek's vimrc
" ---------------------------------------------------------
" Firstly, run the following command to install vim-plug:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'
Plug 'tsukkee/unite-tag'
Plug 'cosmtrek/vim-fastunite'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/NERDCommenter'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/vim-emoji'
Plug 'ekalinin/Dockerfile.vim'
call plug#end()

filetype plugin indent on
syntax enable
syntax on
set encoding=utf8
let $LANG='en'
set langmenu=en
set wildmenu
set wildmode=list:full
set wildignorecase
set laststatus=2
set backspace=eol,start,indent
set autoread
set autowrite
set nobackup
set nowb
set noswapfile
set ruler
set cmdheight=2
set hidden
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set history=100
set gcr=a:blinkon0
set noerrorbells
set novisualbell
set t_vb=
set number
set numberwidth=2
set scrolloff=5
set mouse=a
set ffs=unix,dos,mac
set lazyredraw
set ttyfast
set pumheight=20
set timeout timeoutlen=5000 ttimeoutlen=100

function! s:SID_PREFIX() abort
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
set title titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif

if has('conceal')
    set conceallevel=1
    set listchars+=conceal:Δ
endif

if has("gui_running")
	set guioptions-=T   "toolbar
	set guioptions-=r   "scrollbar
	set guioptions-=L
	set guioptions-=e
	set guioptions-=b
	set guioptions-=m   "menubar
	set t_Co=256
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12
endif

" color options
if has("gui_running")
    colorscheme solarized
    set background=light
else
    let g:seoul256_background = 233
    colorscheme seoul256
    set background=dark
endif

let mapleader = "\<Space>"
nnoremap <space> <nop>
inoremap jk <esc>

augroup MyAutoCmd
    autocmd!
augroup END

" Disable paste
autocmd MyAutoCmd InsertLeave *
      \ if &paste | setlocal nopaste | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif

" Update diff
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
" Emacs style :)
inoremap <C-n> <down>
inoremap <C-p> <up>
inoremap <C-a> <home>
inoremap <C-e> <end>
" Remap Vim 0 to first non-blank character
nnoremap 0 ^
nnoremap e $
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Paste in a new line
nnoremap P :pu<cr>

" Close the current buffer and move to the previous one
nnoremap <leader>bq :bp <BAR> bd #<cr>

" Useful mappings for managing tabs
map te :tabedit<space>
map th :tab<space>help<space>
map <leader>, :tabprev<cr>
map <leader>. :tabnext<cr>

" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" More natural split opening
set splitbelow
set splitright
set winwidth=30
set winheight=1
set previewheight=8
set helpheight=12

" Resize windows
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Smart way to move between windows
" <C-W>r swap the only two windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Copy & paste to system clipboard
set clipboard=unnamed

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" ctags path
set tags=./tags,tags;

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
autocmd BufRead,BufNewFile *.c set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.h set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.m set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.py set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.js set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.css set ts=2 sw=2 et sts=2
autocmd BufRead,BufNewFile *.scss set ts=2 sw=2 et sts=2
autocmd BufRead,BufNewFile *.html set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.xml set ts=4 sw=4 et sts=4 ai
autocmd BufRead,BufNewFile *.json set ts=4 sw=4 et sts=4 ai
autocmd BufRead,BufNewFile *.rb set ts=2 sw=2 et sts=2 ai
autocmd BufRead,BufNewFile *.go set ts=4 sw=4 ai
autocmd BufRead,BufNewFile *.yml set ts=2 sw=2 et sts=2 ai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startify
let g:startify_custom_header =
  \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val')

" vim-better-whitespace
highlight ExtraWhitespace ctermbg=Red
autocmd BufWritePre * StripWhitespace

" Airline
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

" Gitgutter
set updatetime=300
let g:gitgutter_sign_column_always = 1
" Emoji
if emoji#available()
    let g:gitgutter_sign_added = emoji#for('frog')
    let g:gitgutter_sign_modified = emoji#for('dog')
    let g:gitgutter_sign_removed = emoji#for('pig')
    let g:gitgutter_sign_modified_removed = emoji#for('cat')
endif

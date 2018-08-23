"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cosmtrek's vimrc
" ---------------------------------------------------------
" Firstly, run the following command to install vim-plug:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" How to debug?
"   vim --startuptime vim.log
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

call plug#begin('~/.vim/plugged')
" themes, ui, etc.
Plug 'junegunn/seoul256.vim'
Plug 'cosmtrek/lightline.vim'
Plug 'mhinz/vim-signify'
" editing
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'bps/vim-textobj-python'
" searching
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'justinmk/vim-dirvish'
" tools
Plug 'tpope/vim-fugitive'
Plug 'skywind3000/asyncrun.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-slash'
Plug 'osyo-manga/vim-over'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/echodoc.vim'
" languages, autocomplete, etc.
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'fatih/vim-go'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'solarnz/thrift.vim'
Plug 'uarun/vim-protobuf'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/NERDCommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
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
set noerrorbells
set novisualbell
set t_vb=
set number
set relativenumber
set numberwidth=2
set scrolloff=5
set mouse-=a
set ffs=unix,dos,mac
set lazyredraw
set ttyfast
set pumheight=20
set timeout timeoutlen=1000 ttimeoutlen=100
set cursorline
set gcr=a:blinkon0

if has("gui_running")
	set guioptions-=T   "toolbar
	set guioptions-=r   "scrollbar
	set guioptions-=L
	set guioptions-=e
	set guioptions-=b
	set guioptions-=m   "menubar
	set t_Co=256
    set guifont=Hack:h12
endif

" Colorscheme
let g:seoul256_srgb = 1
let g:seoul256_background = 235
colo seoul256

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

" Key
let mapleader = "\<Space>"
nnoremap <space> <nop>

augroup MyAutoCmd
    autocmd!
    " Disable paste
    autocmd InsertLeave *
      \ if &paste | setlocal nopaste | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif
    autocmd QuickFixCmdPost * call asyncrun#quickfix_toggle(8, 1)
augroup END

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
cnoremap <C-n> <down>
cnoremap <C-p> <up>
cnoremap <C-a> <home>
cnoremap <C-e> <end>
" Remap Vim 0 to first non-blank character
nnoremap 0 ^
nnoremap e $
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Paste in a new line
nnoremap P :pu<cr>

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
" No clipboard
nnoremap <leader>y :w! /tmp/vclipboard<cr>
vnoremap <leader>y :w! /tmp/vclipboard<cr>
nnoremap <leader>p :r /tmp/vclipboard<cr>
vnoremap <leader>p :r /tmp/vclipboard<cr>

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" ctags path
set tags=./.tags;,.tags

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
augroup spacetab
    autocmd!
    autocmd BufRead,BufNewFile *.c set ts=4 sw=4 et sts=4
    autocmd BufRead,BufNewFile *.h set ts=4 sw=4 et sts=4
    autocmd BufRead,BufNewFile *.m set ts=4 sw=4 et sts=4
    autocmd BufRead,BufNewFile *.py set ts=4 sw=4 et sts=4 autoindent shiftround
    autocmd BufRead,BufNewFile *.js set ts=2 sw=2 et sts=4
    autocmd BufRead,BufNewFile *.css set ts=2 sw=2 et sts=2
    autocmd BufRead,BufNewFile *.scss set ts=2 sw=2 et sts=2
    autocmd BufRead,BufNewFile *.html set ts=2 sw=2 et sts=2
    autocmd BufRead,BufNewFile *.vue set ts=2 sw=2 et sts=2
    autocmd BufRead,BufNewFile *.xml set ts=4 sw=4 et sts=4 ai
    autocmd BufRead,BufNewFile *.json set ts=4 sw=4 et sts=4 ai
    autocmd BufRead,BufNewFile *.rb set ts=2 sw=2 et sts=2 ai
    autocmd BufRead,BufNewFile *.go set ts=4 sw=4 ai
    autocmd BufRead,BufNewFile *.yml set ts=2 sw=2 et sts=2 ai
augroup END

" Swap
vnoremap <C-S-X> <ESC>`.``gvp``P

" Toggle quickfix window rapidly
:noremap <F9> :call asyncrun#quickfix_toggle(8)<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-better-whitespace
highlight ExtraWhitespace ctermbg=Red
autocmd MyAutoCmd BufWritePre * StripWhitespace

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" Signify
set signcolumn=yes
let g:signify_vcs_list = ['git']

" Fugitive
autocmd MyAutoCmd BufReadPost fugitive://* set bufhidden=delete

" Git
autocmd Filetype gitcommit setlocal spell textwidth=78

" NERDTree
nmap <F10> :NERDTreeToggle<CR>

" UndoTree
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" lightline
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'active': {
    \   'left': [[ 'mode', 'paste' ],
    \            [ 'gitbranch', 'readonly', 'filename' ],
    \            [ 'linter_warnings', 'linter_errors' ]],
    \   'right': [[ 'lineinfo' ], [ 'percent' ],
    \             [ 'filetype', 'fileencoding', 'fileformat' ]],
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'filename': 'LightlineFilename',
    \ },
    \ 'component_expand': {
    \   'linter_warnings': 'LightlineAleWarnings',
    \   'linter_errors': 'LightlineAleErrors',
    \ },
    \ 'component_type': {
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \ },
    \}

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" lightline-ale
augroup lightline#ale
  autocmd!
  autocmd User ALEJobStarted call lightline#update()
  autocmd User ALELintPost call lightline#update()
  autocmd User ALEFixPost call lightline#update()
augroup END

function! LightlineAleWarnings() abort
  if !LightlineAleLinted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf('W%d', all_non_errors)
endfunction

function! LightlineAleErrors() abort
  if !LightlineAleLinted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:all_errors == 0 ? '' : printf('E%d', all_errors)
endfunction

function! LightlineAleLinted() abort
  return get(g:, 'ale_enabled', 0) == 1
    \ && getbufvar(bufnr(''), 'ale_linted', 0) > 0
    \ && ale#engine#IsCheckingBuffer(bufnr('')) == 0
endfunction

" gutentags
let g:gutentags_project_root = ['.root', '.git', '.svn', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

" ale
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_list_window_size = 5
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = {
    \ 'go': ['gometalinter'],
    \ 'python': ['flake8'],
    \ 'make': ['checkmake'],
    \ 'thrift': ['thrift'],
    \}
let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=goimports'

" YCM
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_complete_in_strings=1
let g:ycm_python_binary_path = 'python'
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'infolog' : 1,
    \ 'mail' : 1
    \}
" TODO: let g:ycm_filetype_whitelist
let g:ycm_semantic_triggers =  {
    \ 'c,cpp,python,go,javascript,lua': ['re!\w{2}'],
    \}
nnoremap <C-]> :YcmCompleter GoTo<CR>

" UltiSnips
" TODO: link to my dotfiles
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/snips']
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
nnoremap <Leader>ue :UltiSnipsEdit<CR>

" LeaderF
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_WindowHeight = 0.30
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_StlSeparator = {'left': '', 'right': ''}
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
nnoremap <Leader>lf :LeaderfFunction!<CR>
nnoremap <Leader>lm :LeaderfMru<CR>

" indent line
let g:indentLine_char = '¦'

" Go
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:golang_goroot="/usr/local/go"
autocmd FileType go nmap <Leader>gi <Plug>(go-implements)
autocmd FileType go nmap <Leader>ga <Plug>(go-alternate)
autocmd FileType go nmap <Leader>gd <Plug>(go-describe)
autocmd FileType go nmap <Leader>gv <Plug>(go-info)

" Rust
let g:rustfmt_autosave = 1

" Vue
autocmd BufRead,BufNewFile *.vue set filetype=html

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-\>'
autocmd FileType html,css,eruby,vue EmmetInstall

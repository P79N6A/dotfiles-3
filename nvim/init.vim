"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" cosmtrek's vimrc for Neovim
" ---------------------------------------------------------------------------
"
" Firstly, run the following command to install vim-plug:
"   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
" themes, ui, etc.
Plug 'junegunn/seoul256.vim'
Plug 'cosmtrek/lightline.vim'
Plug 'mhinz/vim-signify'
" edit, search, etc.
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-sneak'
" files
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-vinegar'
Plug 'skywind3000/vim-preview'
Plug 'tpope/vim-fugitive'
Plug 'simnalamburt/vim-mundo'
Plug 'Yggdroot/indentLine'
Plug 'simeji/winresizer'
" completion, lint, languages, etc.
Plug 'zxqfl/tabnine-vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'solarnz/thrift.vim'
Plug 'uarun/vim-protobuf'
Plug 'scrooloose/NERDCommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neomake/neomake'
call plug#end()

" misc
set termguicolors
set lazyredraw
set number
set relativenumber
set ignorecase
set smartcase
set numberwidth=2
set pumheight=10
set scrolloff=5

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif

" check environment
if $USER == "yurunyu"
    let g:python_host_prog = '/home/linuxbrew/.linuxbrew/bin/python2'
    let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
else
    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
endif

" Colorscheme
let g:seoul256_srgb = 1
let g:seoul256_background = 235
colo seoul256

" Key
let mapleader = "\<Space>"
nnoremap <space> <nop>
nnoremap <leader>w :w!<cr>

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

" Useful mappings for managing tabs
map te :tabedit<space>
map th :tab<space>help<space>
map <leader>, :tabprev<cr>
map <leader>. :tabnext<cr>

" Smart way to move between windows
" <C-W>r swap the only two windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" More natural split opening
set splitbelow
set splitright
set winwidth=30
set winheight=2
set previewheight=12
set helpheight=12

" Copy & paste to system clipboard
set clipboard=unnamed
" No clipboard
nnoremap <leader>y :w! /tmp/vclipboard<cr>
vnoremap <leader>y :w! /tmp/vclipboard<cr>
nnoremap <leader>p :r /tmp/vclipboard<cr>
vnoremap <leader>p :r /tmp/vclipboard<cr>

" ctags path
set tags=./.tags;,.tags

" tab or space
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
augroup spacetab
    autocmd!
    autocmd BufRead,BufNewFile *.c set ts=4 sw=4 et sts=4
    autocmd BufRead,BufNewFile *.h set ts=4 sw=4 et sts=4
    autocmd BufRead,BufNewFile *.m set ts=4 sw=4 et sts=4
    autocmd BufRead,BufNewFile *.go set ts=4 sw=4 ai
    autocmd BufRead,BufNewFile *.py set ts=4 sw=4 et sts=4 ai shiftround
    autocmd BufRead,BufNewFile *.js set ts=2 sw=2 et sts=4
    autocmd BufRead,BufNewFile *.css set ts=2 sw=2 et sts=2
    autocmd BufRead,BufNewFile *.scss set ts=2 sw=2 et sts=2
    autocmd BufRead,BufNewFile *.html set ts=2 sw=2 et sts=2
    autocmd BufRead,BufNewFile *.vue set ts=2 sw=2 et sts=2
    autocmd BufRead,BufNewFile *.json set ts=4 sw=4 et sts=4 ai
    autocmd BufRead,BufNewFile *.xml set ts=4 sw=4 et sts=4 ai
    autocmd BufRead,BufNewFile *.rb set ts=2 sw=2 et sts=2 ai
    autocmd BufRead,BufNewFile *.yml set ts=2 sw=2 et sts=2 ai
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-better-whitespace
highlight ExtraWhitespace ctermbg=Red

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" Signify
set signcolumn=yes
let g:signify_vcs_list = ['git']

" Git
autocmd Filetype gitcommit setlocal spell textwidth=78

" NERDTree
nmap ee :NERDTreeToggle<CR>

" netrw
let g:netrw_liststyle = 3

" UndoTree
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Sneak
let g:sneak#label = 1

" tags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

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
    \   'linter_warnings': 'LightlineNeomakeWarnings',
    \   'linter_errors': 'LightlineNeomakeErrors',
    \ },
    \ 'component_type': {
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \ },
    \}

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" lightline-neomake
augroup lightline#neomake
  autocmd!
  autocmd User NeomakeFinished nested call lightline#update()
augroup END

function! LightlineNeomakeWarnings() abort
  if !exists(":Neomake")
    return ''
  endif
  let l:warns = neomake#statusline#LoclistCounts()['W']
  return warns == 0 ? '' : printf('W%d', warns)
endfunction

function! LightlineNeomakeErrors() abort
  if !exists(":Neomake")
    return ''
  endif
  let l:errors = neomake#statusline#LoclistCounts()['E']
  return errors == 0 ? '' : printf('E%d', errors)
endfunction

" neomake
call neomake#configure#automake('w')
let g:neomake_list_height = 5
let g:neomake_go_gometalinter_args = ['--disable-all', '--fast', '--enable=staticcheck']

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

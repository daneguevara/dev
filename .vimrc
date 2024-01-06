call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nvie/vim-flake8'
call plug#end()

if filereadable($LOCALVIMRC)
    source $LOCALVIMRC
endif

set nocompatible
syntax on
set modelines=0
set wildignore+=*/node_modules
set expandtab
set tabstop=2
set softtabstop=2 
set encoding=utf-8
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber

let mapleader = ","

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

nnoremap <LEADER>p "0p
nnoremap <LEADER>P "0P
nnoremap <LEADER><SPACE> :noh<CR>
nnoremap ; :
nnoremap <C-j> j
nnoremap <C-k> k
nnoremap <C-h> ^
nnoremap <C-l> $
noremap <LEADER>f :FZF<CR>
noremap <LEADER>e :NERDTreeToggle<CR>

inoremap ;; <ESC>`^
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <C-o>^
inoremap <C-l> <C-o>$

vnoremap ;; <ESC>
vnoremap <C-j> :m '>-2<CR>
vnoremap <C-k> :m '<-2<CR>
vnoremap <C-h> ^
vnoremap <C-l> $

set mouse=a
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<f12>

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

set noswapfile
set nobackup

" Unified color scheme (default: dark)
color seoul256

" Light color scheme
color seoul256-light

" Switch
set background=dark

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" Initialize configuration dictionary
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']

let g:lsp_settings = {
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}

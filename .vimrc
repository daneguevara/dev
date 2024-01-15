call plug#begin()

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nvie/vim-flake8'
Plug 'ThePrimeagen/vim-be-good'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jremmen/vim-ripgrep'
" Plug 'zbirenbaum/copilot.lua'
Plug 'itchyny/vim-gitbranch'

call plug#end()

if filereadable($LOCALVIMRC)
    source $LOCALVIMRC
endif

syntax on

set clipboard=unnamedplus
set mouse=a

set nocompatible
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
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

let mapleader = ","

" === NORMAL + VISUAL + OPERATOR MODE REMAPS ===

" file search, change buffer, yank to local shortcuts
noremap <leader>f :Rg <space>
noremap <leader>p :FZF /mnt/code.capitalrx.com/
noremap <leader>e :NERDTreeToggle<cr>
noremap <leader>b :buffers<cr>:b
noremap <leader>y :w! /vagrant/yeet<cr>

" === NORMAL MODE REMAPS ===

" fast commands
nnoremap ; :
nnoremap q; q:

" ctrl enter, ctrl shift enter new lines - stay in normal mode
nnoremap <c-cr> o<esc>
nnoremap <c-s-cr> O<esc>

" ctrl bs, ctrl shift bs to remove new lines
nnoremap <c-bs> jddk
nnoremap <c-s-bs> kdd

" ez search highlighting and clearing
nnoremap <leader><leader> *``;
nnoremap <leader><space> :noh<cr>

" shift tab to pair reverse jumplist with tab-jumplist
nnoremap <s-tab> <c-o>

" quick indents
nnoremap > >>
nnoremap < <<

" ctrl hl side jumps, single line jumps
nnoremap <c-h> <home>
nnoremap <c-j> j<c-e>
nnoremap <c-k> k<c-y>
nnoremap <c-l> <end>

" meta (alt) hl side word jumps, jk line swapping
nnoremap <m-h> b
nnoremap <m-j> :m .+1<cr>==
nnoremap <m-k> :m .-2<cr>==
nnoremap <m-l> e

" ctrl arrow 4-D jumps
nnoremap <c-left> <home>
nnoremap <c-down> G
nnoremap <c-up> gg
nnoremap <c-right> <end>

" arrow keys side word jumps, line swapping
nnoremap <m-left> b
nnoremap <m-down> :m .+1<cr>==
nnoremap <m-up> :m .-2<cr>==
nnoremap <m-right> e

" === INSERT MODE REMAPS ===

" alternate escapes insert mode
inoremap jk <esc>`^

" intellisense/autocomplete
inoremap <s-tab> <c-x><c-o>

" ctrl hjkl insert movements
inoremap <c-h> <home>
inoremap <c-j> <c-g>j
inoremap <c-k> <c-g>k
inoremap <c-l> <end>

inoremap <m-h> <c-o>b
inoremap <m-j> <esc>:m .+1<cr>==gi
inoremap <m-k> <esc>:m .-2<cr>==gi
inoremap <m-l> <c-o>e<right>

inoremap <c-left> <home>
inoremap <c-down> <c-o>G
inoremap <c-up> <c-o>gg
inoremap <c-right> <end>

inoremap <m-left> <c-o>b
inoremap <m-down> <esc>:m .+1<cr>==gi
inoremap <m-up> <esc>:m .-2<cr>==gi
inoremap <m-right> <c-o>e<right>

" === VISUAL MODE REMAPS ===

vnoremap ; :

" selection hl shift indents, jk line swaps
vnoremap < <gv
vnoremap > >gv

" ctrl hjkl movements visual mode
vnoremap <c-h> ^
vnoremap <c-j> jzz
vnoremap <c-k> kzz
vnoremap <c-l> $

vnoremap <m-h> b
vnoremap <m-j> :m '>+1<cr>gv=gv
vnoremap <m-k> :m '<-2<cr>gv=gv
vnoremap <m-l> e

vnoremap <c-left> <home>
vnoremap <c-down> G
vnoremap <c-up> gg
vnoremap <c-right> <end>

vnoremap <m-left> b
vnoremap <m-down> :m '>+1<cr>gv=gv
vnoremap <m-up> :m '<-2<cr>gv=gv
vnoremap <m-right> e

" === EMULATE SHIFT select remaps (select mode) ===

" normal mode cursor move keys enter select mode
nmap <s-left> v<c-g><left>
nmap <s-down> v<c-g><down>
nmap <s-up> v<c-g><up>
nmap <s-right> v<c-g><right>

nmap <c-s-left> v<c-g><c-left>
nmap <c-s-down> v<c-g><c-down>
nmap <c-s-up> v<c-g><c-up>
nmap <c-s-right> v<c-g><c-right>

nmap <m-s-left> v<c-g><m-left>
nmap <m-s-down> yym`P``
nmap <m-s-up> yym`P``k
nmap <m-s-right> v<c-g><m-right>

imap <s-left> jk<s-left>
imap <s-down> jk<s-down>
imap <s-up> jk<s-up>
imap <s-right> jk<s-right>

imap <c-s-left> jk<c-s-left>
imap <c-s-down> jk<c-s-down>
imap <c-s-up> jk<c-s-up>
imap <c-s-right> jk<c-s-right>

imap <m-s-left> jk<m-s-left>
imap <m-s-down> jk<m-s-down>i
imap <m-s-up> jk<m-s-up>i
imap <m-s-right> jk<m-s-right>

vnoremap <s-left> <c-g><left>
vnoremap <s-down> <c-g><down>
vnoremap <s-up> <c-g><up>
vnoremap <s-right> <c-g><right>

vnoremap <c-s-left> <c-g><home>
vnoremap <c-s-down> <c-g>G
vnoremap <c-s-up> <c-g>gg
vnoremap <c-s-right> <c-g><end>

vnoremap <m-s-left> <c-g><s-left>
vnoremap <m-s-down> m`YP``gv
vnoremap <m-s-up> m`Y:lock normal P<cr>``gv
vnoremap <m-s-right> <c-g><s-right>

snoremap <s-left> <left>
snoremap <s-down> <down>
snoremap <s-up> <up>
snoremap <s-right> <right>

snoremap <c-s-left> <home>
snoremap <c-s-down> <c-o>G
snoremap <c-s-up> <c-o>gg
snoremap <c-s-right> <end>

snoremap <m-s-left> <s-left>
snoremap <m-s-right> <s-right>

" stop selection without shift key
smap <left> <s-left><c-g>
smap <down> <s-down><c-g>
smap <up> <s-up><c-g>
smap <right> <s-right><c-g>

smap <c-left> <c-s-left><c-g>
smap <c-down> <c-s-down><c-g>
smap <c-up> <c-s-up><c-g>
smap <c-right><c-s-right><c-g>

smap <m-left> <m-s-left><c-g>
smap <m-down> <m-s-down><c-g>
smap <m-up> <m-s-up><c-g>
smap <m-right> <m-s-right><c-g>

" === TERMINAL MODE REMAPS ===

" alternate escape for fzf
tnoremap jk <esc>

" unlimited time for multi-keybinds
set notimeout ttimeout

" stay tidy
set noswapfile
set nobackup

" cursor modes
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" weeeeebin out
let g:tokyonight_style = "storm"
let g:tokykonight_enable_italic = 1
let g:tokyonight_transparent_background = 1
let g:lightline = {'colorscheme' : 'tokyonight'}

colorscheme tokyonight

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
    nmap <buffer> ,k <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

function Toggle_current_buffer_diagnostics()
    let buffer_id = buffer_number()

    if lsp#internal#diagnostics#state#_is_enabled_for_buffer(buffer_id)
        call lsp#disable_diagnostics_for_buffer(buffer_id)
    else
        call lsp#enable_diagnostics_for_buffer(buffer_id)
    endif
endfunction

noremap <f2> :call Toggle_current_buffer_diagnostics()<cr>

" Initialize configuration dictionary
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']

let g:lsp_settings = {
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8'],
\         'plugins': {
\           'flake8': {
\             'hangClosing': v:true,
\           },
\         },
\       },
\     },
\   },
\}

let g:lightline = {
\   'colorscheme': 'wombat',
\   'active': {
\     'left': [
\       [ 'mode', 'paste' ],
\       [ 'gitbranch', 'readonly', 'filename', 'modified' ],
\     ],
\   },
\   'component_function': {
\     'gitbranch': 'FugitiveHead',
\   },
\}

let g:pyindent_open_paren = 'shiftwidth()'

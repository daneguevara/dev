call plug#begin()

" treesitter - enable better syntax highlighting, text objects, code folding
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" default settings
Plug 'tpope/vim-sensible'

" theme and colors
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'

" fuzzy searching
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" vim language server protocol
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" async autocomplete general
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" async autocomplete ts
Plug 'runoshun/tscompletejob'
Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'

" python linting, formatting
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'nvie/vim-flake8'
Plug 'Vimjas/vim-python-pep8-indent'

" git
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'

" undo tree history
Plug 'mbbill/undotree'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-fzf-native.nvim'

" comments
Plug 'tpope/vim-commentary'

" terraform
Plug 'hashivim/vim-terraform'

call plug#end()

if filereadable($LOCALVIMRC)
    source $LOCALVIMRC
endif

syntax on

set clipboard+=unnamedplus

set mouse=a
set modelines=0
set wildignore+=*/node_modules
set wildmode=list:longest
set expandtab
set tabstop=2
set softtabstop=2
set encoding=utf-8
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ruler
set number
set relativenumber
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch

" unlimited time for multi-keybinds
set notimeout ttimeout

" stay tidy
set noswapfile
set nobackup

" set indents
augroup rainerdane_indent
  autocmd!
  autocmd BufNewFile,BufRead *.vim setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" remove trailing whitespace
augroup rainerdane_whitespace
  autocmd!
  autocmd BufRead,BufWrite *.vim :%s/\s\+$//e
augroup END

let mapleader = ","

" remap so tab can be used for autocomplete confirmation
let g:UltiSnipsExpandTrigger="<c-cr>"

" raw ripgrep
noremap <leader>g :Rg<space>

" raw fzf
noremap <leader>t :FZF<cr>

" list, select buffer
noremap <leader>b :buffers<cr>:b

" use system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

let g:capitalrx_db = "capitalrx_formulary"

function Set_capitalrx_db()
  let g:capitalrx_db = input("Enter database name: ")
endfunction

noremap <leader>qd :call Set_capitalrx_db()<cr>

" write (SQL) selection/current file to proxy sql client as sql runner
" print output
noremap <leader>qp :<c-u>execute "*w !psql " . g:capitalrx_db<cr>

" output written to sql.out file
noremap <leader>qo :<c-u>execute "silent *w !psql " . g:capitalrx_db . " &> $SQL_OUT_FILE"<cr>gv

" open sql.out in horizontal or vertical split window
nmap <leader>qs <c-w>s<c-w>j:view $SQL_OUT_FILE<cr><f4><c-w>k
nmap <leader>qv <c-w>v<c-w>l:view $SQL_OUT_FILE<cr><f4><c-w>h

" write python file to python debugger with breakpoint at current line
nnoremap <leader>pdb :execute "terminal ! python -m pdb " . line(".")<cr>

" toggle undo tree
nnoremap <leader>u :UndotreeToggle<cr>

" force write
nnoremap <leader>w <cmd>w!<cr>
noremap <c-s> <cmd>w!<cr>
inoremap <c-s> <cmd>w!<cr>

" insert mode left, right movements
inoremap <c-f> <right>
inoremap <c-b> <left>

" === NORMAL MODE REMAPS ===

" find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files layout_strategy=vertical<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles layout_strategy=vertical<cr>
nnoremap <leader>fg <cmd>Telescope live_grep layout_strategy=vertical<cr>
nnoremap <leader>fb <cmd>Telescope buffers layout_strategy=vertical<cr>
nnoremap <leader>fh <cmd>Telescope help_tags layout_strategy=vertical<cr>
nnoremap <leader>ft <cmd>Telescope treesitter layout_strategy=vertical<cr>
nnoremap <leader>fa <cmd>Telescope autocommands layout_strategy=vertical<cr>
nnoremap <leader>fc <cmd>Telescope commands layout_strategy=vertical<cr>
nnoremap <leader>fk <cmd>Telescope keymaps layout_strategy=vertical<cr>
nnoremap <leader>fv <cmd>Telescope vim_options layout_strategy=vertical<cr>
nnoremap <leader>fr <cmd>Telescope registers layout_strategy=vertical<cr>

" fast commands
nnoremap ; :
nnoremap q; q:

" ctrl enter, ctrl shift enter new lines - stay in normal mode
nnoremap <c-cr> o<esc>d0
nnoremap <c-s-cr> O<esc>d0

" search word under cursor
nnoremap <leader>/ *N;

" search for trailing whitespace
nnoremap <leader><c-/> :%s/\s\+$//e<cr>

" clear search highlight
nnoremap <leader><space> :noh<cr>:echo ''<cr>

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

" ctrl hjkl insert movements
inoremap <c-h> <home>
inoremap <c-j> <c-g>j
inoremap <c-k> <c-g>k
inoremap <c-l> <end>

inoremap <m-h> <c-o>b
inoremap <m-j> <esc>`^:m .+1<cr>==gi
inoremap <m-k> <esc>`^:m .-2<cr>==gi
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

" range ex command
vnoremap ; :

" gate visual selection lowercase, uppercase behind modifier key
vnoremap <c-u> u
vnoremap <c-s-u> U

" use default case keys to exit visual mode
vnoremap u v
vnoremap U v

" search selection
vnoremap // y/<c-r>"<cr>N

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

nmap <m-J> yym`P``
nmap <m-K> yym`P``k

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

imap <m-J> <m-s-down>
imap <m-K> <m-s-up>

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

vmap <m-J> <m-s-down>
vmap <m-K> <m-s-up>

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
smap <c-right> <c-s-right><c-g>

smap <m-left> <m-s-left><c-g>
smap <m-down> <m-s-down><c-g>
smap <m-up> <m-s-up><c-g>
smap <m-right> <m-s-right><c-g>

" === THEME SETTINGS ===

" cursor modes
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" fzf settings
let g:fzf_vim = {}
let g:fzf_vim.preview_wigdow = ['right,50%', 'ctrl-/']

" weeeeebin out
let g:tokyonight_style = "storm"
let g:tokykonight_enable_italic = 1
let g:tokyonight_transparent_background = 1
let g:lightline = {'colorscheme' : 'tokyonight'}

colorscheme tokyonight

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

" === VIM LSP SETTINGS ===

" register python async autocomplete
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
    \  'name': 'pylsp',
    \  'cmd': {server_info->['pylsp']},
    \  'allowlist': ['python'],
    \})
endif

" register ts async autocomplete
call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
\  'name': 'tscompletejob',
\  'allowlist': ['typescript'],
\  'completor': function('asyncomplete#sources#tscompletejob#completor'),
\}))

" vim-lsp autocomplete setup, keybinds
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
    nmap <buffer> gk <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" autocomplete keybinds
inoremap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
" imap <c-@> <Plug>(asyncomplete_force_refresh)

" vim-lsp general settings
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

let g:pyindent_open_paren = 'shiftwidth()'
let g:python_host_prog = $HOME . '/.pyenv/versions/py2nvim/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/py3nvim/bin/python'

function Toggle_current_buffer_diagnostics()
  let buffer_id = buffer_number()

  if lsp#internal#diagnostics#state#_is_enabled_for_buffer(buffer_id)
    call lsp#disable_diagnostics_for_buffer(buffer_id)

    return "Diagnostics disabled for buffer " . buffer_id
  else
    call lsp#enable_diagnostics_for_buffer(buffer_id)

    return "Diagnostics enabled for buffer " . buffer_id
  endif
endfunction

function Toggle_mouse()
  if &mouse == 'a'
    set mouse=

    return "Mouse disabled, terminal c/p enabled"
  endif

  set mouse=a

  return "Mouse enabled, terminal c/p disabled"
endfunction

function Disable_diagnostics()
  let buffer_id = buffer_number()

  call lsp#disable_diagnostics_for_buffer(buffer_number())

  return "Diagnostics disabled for buffer " . buffer_id
endfunction

noremap <f2> :echo Toggle_current_buffer_diagnostics()<cr>
noremap <f3> :echo Toggle_mouse()<cr>
noremap <f4> :echo Disable_diagnostics()<cr>

autocmd FileChangedShell * let v:fcs_choice = 'reload'

autocmd FileType sql setlocal commentstring=--\ %s

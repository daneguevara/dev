-- set clipboard
vim.opt.clipboard:append("unnamedplus")

-- split windows below and to the right
vim.opt.splitright = true
vim.opt.splitbelow = true

-- no wrap
vim.opt.wrap = true

-- set mouse
vim.opt.mouse = "a"

-- disable modelines
vim.opt.modelines = 0

-- ignore node_modules directory in wildmenu
vim.opt.wildignore:append("*/node_modules")

-- default wildmode
vim.opt.wildmode = "longest:list,full"

-- use spaces instead of tabs
vim.opt.expandtab = true

-- set tabstop, softtabstop, shiftwidth defaults
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- set encoding to utf-8
vim.opt.encoding = "utf-8"

-- enable autoindent
vim.opt.autoindent = true

-- show mode
vim.opt.showmode = true

-- show command being typed
vim.opt.showcmd = true

-- keep buffers hidden instead of closing them
vim.opt.hidden = true

-- use visual bell instead of audible bell
vim.opt.visualbell = true

-- show ruler
vim.opt.ruler = true

-- display line numbers
vim.opt.number = true

-- display relative line numbers
vim.opt.relativenumber = true

-- ignore case when searching
vim.opt.ignorecase = true

-- use smartcase when searching
vim.opt.smartcase = true

-- use global flag by default in substitute command
vim.opt.gdefault = true

-- highlight matching parentheses
vim.opt.showmatch = true

-- highlight search results
vim.opt.hlsearch = true

-- disable timeout for multi-keybindings
vim.opt.timeout = false
vim.opt.ttimeout = true

-- disable swapfile and backup
vim.opt.swapfile = false
vim.opt.backup = false

-- set indent for files
vim.api.nvim_exec([[
  augroup rainer_indent
    autocmd!
    autocmd BufNewFile,BufRead *.vim,*.lua,*.js setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd BufNewFile,BufRead *.md,*.py,*.sh setlocal shiftwidth=4 tabstop=4 softtabstop=4
  augroup END
]], false)

-- remove trailing whitespace for files
vim.api.nvim_exec([[
  augroup rainer_whitespace
    autocmd!
    autocmd BufRead,BufWrite *.vim,*.lua,*.js,*.py :%s/\s\+$//e
  augroup END
]], false)

-- dynamically open help window based on window height and width
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("help_window", {}),
  pattern = "help,*.txt",
  callback = function()
    local width = vim.api.nvim_win_get_width(0)

    if vim.o.buftype == "help" then
      vim.cmd.set("filetype=help")
    end

    if width > 160 and vim.o.buftype == "help" then
      vim.cmd.wincmd("L")
    end
  end,
})

vim.g.python_host_prog = os.getenv("HOME") .. "/.pyenv/versions/py2nvim/bin/python"
vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/py3nvim/bin/python"

vim.g.tcomment_mapleader1 = "<leader>-"

-- add sql formatter for sql files
vim.api.nvim_exec([[
  function! FormatSql()
    execute "%!sql-formatter --config ~/.config/sql-formatter/config.json"
  endfunction

  autocmd FileType sql setlocal formatprg=sql-formatter\ --config\ ~/.config/sql-formatter/config.json
]], false)

-- tmux nav
vim.api.nvim_exec([[
  function! IsFloating(id) abort
      let l:cfg = nvim_win_get_config(a:id)
      return !empty(l:cfg.relative) || l:cfg.external
  endfunction

  function! TmuxNavigateDirections() abort
    let [y, x] = win_screenpos('.')
    let h = winheight('.')
    let w = winwidth('.')

    let can_go_up    = y > 2 " +1 for the tabline
    let can_go_down  = y + h < &lines - &laststatus
    let can_go_left  = x > 1
    let can_go_right = x + w < &columns

    if IsFloating(0)
      return ''
    endif

    return
          \ (can_go_up    ? 'U' : '') .
          \ (can_go_down  ? 'D' : '') .
          \ (can_go_left  ? 'L' : '') .
          \ (can_go_right ? 'R' : '')
  endfunction

  let progname = substitute($VIM, '.*[/\\]', '', '')
  set title titlestring=%{progname}\ %t\ #%{TmuxNavigateDirections()}

  " enable support for setting the window title in regular Vim under tmux
  if &term =~ '^screen' && !has('nvim')
    execute "set t_ts=\e]2; t_fs=\7"
  endif
]], false)

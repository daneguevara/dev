vim.g.mapleader = ','

-- open explorer for current buffer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]roject [V]iew' })

-- use ctrl-q for macro q and unbind q
vim.api.nvim_set_keymap('n', '<c-q>', 'q', { noremap = true })
vim.api.nvim_set_keymap('n', 'q', '<nop>', { noremap = true })

-- force write (only needed for nfs shared drive wonkiness)
vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>w!<cr>', { noremap = true })

-- NORMAL MODE REMAPS

-- fast commands
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', 'q;', 'q:', { noremap = true })

-- ctrl enter, ctrl shift enter new lines - stay in normal mode
vim.api.nvim_set_keymap('n', '<c-cr>', 'o<esc>d0', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-s-cr>', 'O<esc>d0', { noremap = true })

-- remove trailing whitespace
vim.api.nvim_set_keymap('n', '<c-s>', ':%s/\\s\\+$//e<cr>', { noremap = true })

-- search cursor word
vim.api.nvim_set_keymap('n', '<leader>/', '*N', { noremap = true })

-- clear search highlight, echo
vim.keymap.set('n', '<leader><space>', function()
  vim.cmd('nohlsearch')
  print('Search highlight cleared')
end, { desc = '[C]lear [H]ighlight' })

-- shift tab to pair reverse jumplist with tab-jumplist
vim.api.nvim_set_keymap('n', '<s-tab>', '<c-o>', { noremap = true })

-- ctrl hl side jumps, single line jumps
vim.api.nvim_set_keymap('n', '<c-h>', '<home>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-j>', 'j<c-e>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-k>', 'k<c-y>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<end>', { noremap = true })

-- meta (alt) hl side word jumps, jk line swapping
vim.api.nvim_set_keymap('n', '<m-h>', 'b', { noremap = true })
vim.api.nvim_set_keymap('n', '<m-j>', ':m .+1<cr>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<m-k>', ':m .-2<cr>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<m-l>', 'e', { noremap = true })

-- TERMINAL MODE REMAPS
vim.api.nvim_set_keymap('t', '<c-esc>', '<c-\\><c-n>', { noremap = true })

-- COMMAND LINE MODE REMAPS

-- bash like movements (move c-f to c-q first)
vim.api.nvim_set_keymap('c', '<c-q>', '<c-f>', { noremap = true })
vim.api.nvim_set_keymap('c', '<c-f>', '<right>', { noremap = true })
vim.api.nvim_set_keymap('c', '<c-b>', '<left>', { noremap = true })

vim.api.nvim_set_keymap('c', '<c-h>', '<home>', { noremap = true })
vim.api.nvim_set_keymap('c', '<c-l>', '<end>', { noremap = true })

-- INSERT MODE REMAPS

-- alternate escapes insert mode
vim.api.nvim_set_keymap('i', 'jk', '<esc>`^', { noremap = true })

-- bash like movements
vim.api.nvim_set_keymap('i', '<c-f>', '<right>', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-b>', '<left>', { noremap = true })

-- ctrl hjkl movements insert mode
vim.api.nvim_set_keymap('i', '<c-h>', '<home>', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-j>', '<down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-k>', '<up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-l>', '<end>', { noremap = true })

-- ctrl-cr ctrl-s-cr new lines
vim.api.nvim_set_keymap('i', '<c-cr>', '<c-o>o', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-s-cr>', '<c-o>O', { noremap = true })

vim.api.nvim_set_keymap('i', '<m-h>', '<c-o>b', { noremap = true })
vim.api.nvim_set_keymap('i', '<m-j>', '<esc>`^:m .+1<cr>==gi', { noremap = true })
vim.api.nvim_set_keymap('i', '<m-k>', '<esc>`^:m .-2<cr>==gi', { noremap = true })
vim.api.nvim_set_keymap('i', '<m-l>', '<c-o>e<right>', { noremap = true })

-- VISUAL MODE REMAPS

-- use q to quit visual mode
vim.api.nvim_set_keymap('v', 'q', '<esc>', { noremap = true })

-- range ex command
vim.api.nvim_set_keymap('v', ';', ':', { noremap = true })

-- selection hl shift indents, jk line swaps
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- ctrl hjkl movements visual mode
vim.api.nvim_set_keymap('v', '<c-h>', '^', { noremap = true })
vim.api.nvim_set_keymap('v', '<c-j>', 'jzz', { noremap = true })
vim.api.nvim_set_keymap('v', '<c-k>', 'kzz', { noremap = true })
vim.api.nvim_set_keymap('v', '<c-l>', '$', { noremap = true })

vim.api.nvim_set_keymap('v', '<m-h>', 'b', { noremap = true })
vim.api.nvim_set_keymap('v', '<m-j>', ':m \'>+1<cr>==gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<m-k>', ':m \'<-2<cr>==gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<m-l>', 'e', { noremap = true })

-- git bindings
vim.keymap.set('n', '<leader>gs', function() vim.cmd('Git status') end, { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gd', function() vim.cmd('Git diff') end, { desc = '[G]it [D]iff' })
vim.keymap.set('n', '<leader>gb', function() vim.cmd('Git blame') end, { desc = '[G]it [B]lame' })

-- toggle wrap
vim.keymap.set('n', '<s-cr>', function()
  vim.cmd('set wrap!')
  print('Wrap ' .. (vim.opt.wrap:get() and 'enabled' or 'disabled'))
end, { desc = 'Toggle Wrap' })

-- WINDOW MANAGEMEMENT

-- window scroll bind, off
vim.api.nvim_set_keymap('n', '<leader>sb', ':windo set scrollbind<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>so', ':windo set noscrollbind<cr>', { noremap = true })

-- ctrl-tab to switch windows
vim.api.nvim_set_keymap('n', '<c-tab>', '<c-w>w', { noremap = true })

-- count layout windows (non floating/relative)
local window_count = function()
  local windows = vim.api.nvim_list_wins()
  local count = 0

  for _, window in ipairs(windows) do
    if vim.api.nvim_win_get_config(window).relative == '' then
      count = count + 1
    end
  end

  return count
end

--256 on 27" 1440p
local current_window_width = function()
  return vim.api.nvim_win_get_width(0)
end

-- "clear" window by editing a new buffer
vim.keymap.set('n', '<c-8>', function()
  vim.cmd('enew')
end, { desc = 'Clear window' })

-- move to left window
vim.keymap.set('n', '<c-9>', function() return '<c-w>h' end, { expr = true })

-- move to right window or move vertical split single window to the right (useful for wide screen)
vim.keymap.set('n', '<c-0>', function() local count = window_count()
  -- just move right if the window is small
  if current_window_width() < 200 then
    vim.cmd('wincmd l')
  end

  if window_count() > 1 then
    vim.cmd('wincmd l')
  else
    vim.cmd('silent! bd')
    vim.cmd('vsplit')
    vim.cmd('silent! b#')
  end
end, { desc = 'Move to right window or move single window right' })

-- vim.keymap.set("c", "<S-Enter>", function()
--   require("noice").redirect(vim.fn.getcmdline())
-- end, { desc = "Redirect Cmdline" })

vim.g.mapleader = ','

-- open explorer for current buffer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]roject [V]iew' })

-- use ctrl-q for macro q and unbind q
vim.api.nvim_set_keymap('n', '<c-q>', 'q', { noremap = true })
vim.api.nvim_set_keymap('n', 'q', '<nop>', { noremap = true })

-- ctrl-tab to switch windows
vim.api.nvim_set_keymap('n', '<c-tab>', '<c-w>w', { noremap = true })

-- set default pg db
vim.g.pgdb = 'capitalrx_dev_aws'

-- PGSQL TOOLING MAPS
-- TODO: move query output and scratch buffers locations to lua config

local set_pbdb = function()
  local db = vim.fn.input('Set PgSQL Database (' .. vim.g.pgdb .. ') : ')

  if db ~= '' then
    vim.g.pgdb = db
  end

  vim.print('PgSQL database set to ' .. vim.g.pgdb)
end
vim.keymap.set('n', '<leader>qd', set_pbdb, { desc = '[Q]uery [D]atabase', noremap = true })

-- run inline sql query, display results
vim.api.nvim_set_keymap('v', '<leader>qp', ':<c-u>execute "*w !psql " .. g:capitalrx_db<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>qp', ':execute ".!psql " .. g:capitalrx_db<cr>u"', { noremap = true })

-- run inline sql query, save results
vim.api.nvim_set_keymap('v', '<leader>qo', ':<c-u>execute "silent *w !psql " .. g:capitalrx_db .. " &> $SQL_OUT_FILE"<cr>gv', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>qo', ':execute ".!psql " .. g:capitalrx_db .. " &> $SQL_OUT_FILE"<cr>u', { noremap = true })

-- TODO: prob better to just keep a log of queries executed
vim.api.nvim_set_keymap('n', '<leader>qs', ':e $SQL_SCRATCH_FILE<cr>', { noremap = true })

-- open/close results buffer
vim.api.nvim_set_keymap('n', '<leader>qx', '<c-w>s<c-w>j:view $SQL_OUT_FILE<cr><c-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>qv', '<c-w>v<c-w>l:view $SQL_OUT_FILE<cr><c-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>qc', ':bd out.sql<cr>', { noremap = true })

-- execute python debugger on current file with breakpoint at current line
vim.api.nvim_set_keymap('n', '<leader>xpd', ':execute "terminal ! python -m pdb " .. line(".")<cr>', { noremap = true })

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
vim.api.nvim_set_keymap('n', '<leader><space>', ':noh<cr>:echo \'\'<cr>', { noremap = true })

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

-- ctrl arrow 4-D jumps
vim.api.nvim_set_keymap('n', '<c-left>', '<home>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<c-down>', 'G', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<c-up>', 'gg', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-right>', '<end>', { noremap = true })

-- arrow keys side word jumps, line swapping
vim.api.nvim_set_keymap('n', '<m-left>', 'b', { noremap = true })
vim.api.nvim_set_keymap('n', '<m-up>', ':m .-2<cr>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<m-down>', ':m .+1<cr>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<m-right>', 'e', { noremap = true })

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

vim.api.nvim_set_keymap('i', '<c-left>', '<home>', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<c-down>', '<c-o>G', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<c-up>', '<c-o>gg', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-right>', '<end>', { noremap = true })

vim.api.nvim_set_keymap('i', '<m-left>', '<c-o>b', { noremap = true })
vim.api.nvim_set_keymap('i', '<m-down>', '<esc>:m .+1<cr>==gi', { noremap = true })
vim.api.nvim_set_keymap('i', '<m-up>', '<esc>:m .-2<cr>==gi', { noremap = true })
vim.api.nvim_set_keymap('i', '<m-right>', '<c-o>e<right>', { noremap = true })

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

vim.api.nvim_set_keymap('v', '<c-left>', '<home>', { noremap = true })
-- vim.api.nvim_set_keymap('v', '<c-down>', 'G', { noremap = true })
-- vim.api.nvim_set_keymap('v', '<c-up>', 'gg', { noremap = true })
vim.api.nvim_set_keymap('v', '<c-right>', '<end>', { noremap = true })

vim.api.nvim_set_keymap('v', '<m-left>', 'b', { noremap = true })
vim.api.nvim_set_keymap('v', '<m-down>', ':m \'>+1<cr>==gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<m-up>', ':m \'<-2<cr>==gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<m-right>', 'e', { noremap = true })

-- git bindings
vim.keymap.set('n', '<leader>gs', function() vim.cmd('Git status') end, { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gd', function() vim.cmd('Git diff') end, { desc = '[G]it [D]iff' })
vim.keymap.set('n', '<leader>gb', function() vim.cmd('Git blame') end, { desc = '[G]it [B]lame' })

-- toggle wrap
vim.api.nvim_set_keymap('n', '<s-cr>', ':set wrap! | set wrap?<cr>', { noremap = true })

-- window scroll bind, off
vim.api.nvim_set_keymap('n', '<leader>sb', ':windo set scrollbind<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>so', ':windo set noscrollbind<cr>', { noremap = true })

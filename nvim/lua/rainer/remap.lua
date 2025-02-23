vim.g.mapleader = ","

-- note: configure a new macro keybind before this if i ever decide to use them
-- vim.api.nvim_set_keymap("n", "q", "<nop>", { noremap = true })

-- force write (only needed for nfs shared drive wonkiness)
vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>w!<cr>", { noremap = true })

-- sad quit all
vim.api.nvim_set_keymap("n", "<leader>qq", "<cmd>qa!<cr>", { noremap = true })

-- NORMAL MODE REMAPS

-- fast commands
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })

-- ctrl enter, ctrl shift enter new lines - stay in normal mode
vim.api.nvim_set_keymap("n", "<c-cr>", "o<esc>d0", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-bs>", "O<esc>d0", { noremap = true })

-- windows
vim.api.nvim_set_keymap("n", "<c-left>", "<c-w>h", { desc = "Move to left window" })
vim.api.nvim_set_keymap("n", "<c-right>", "<c-w>l", { desc = "Move to right window" })
vim.api.nvim_set_keymap("n", "<c-up>", "<c-w>k", { desc = "Move to top window" })
vim.api.nvim_set_keymap("n", "<c-down>", "<c-w>j", { desc = "Move to bottom window" })

vim.keymap.set("n", "<leader><bs>", function()
  vim.cmd("silent! %s/\\s\\+$//e")

  print("Trailing whitespace removed")
end, { desc = "Remove trailing whitespace" })

-- search cursor word
vim.api.nvim_set_keymap("n", "<leader>/", "*N", { noremap = true })

-- clear search highlight, echo
vim.keymap.set("n", "<leader><space>", function()
  vim.cmd("nohlsearch")

  print("Search highlight cleared")
end, { desc = "[C]lear [H]ighlight" })

-- shift tab to pair reverse jumplist with tab-jumplist
vim.api.nvim_set_keymap("n", "<s-tab>", "<c-o>", { noremap = true })

-- ctrl hl side jumps, single line jumps
vim.api.nvim_set_keymap("n", "<c-h>", "^", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-j>", "j<c-e>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-k>", "k<c-y>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-l>", "<end>", { noremap = true })

-- meta (alt) hl side word jumps, jk line swapping
vim.api.nvim_set_keymap("n", "<m-h>", "b", { noremap = true })
vim.api.nvim_set_keymap("n", "<m-j>", "<cmd>m .+1<cr>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<m-k>", "<cmd>m .-2<cr>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<m-l>", "e", { noremap = true })

-- TERMINAL MODE REMAPS
vim.api.nvim_set_keymap("t", "<c-esc>", "<c-\\><c-n>", { noremap = true })

-- COMMAND LINE MODE REMAPS

-- bash like movements (move c-f to c-q first)
vim.api.nvim_set_keymap("c", "<c-q>", "<c-f>", { noremap = true })
vim.api.nvim_set_keymap("c", "<c-f>", "<right>", { noremap = true })
vim.api.nvim_set_keymap("c", "<c-b>", "<left>", { noremap = true })

vim.api.nvim_set_keymap("c", "<c-h>", "<home>", { noremap = true })
vim.api.nvim_set_keymap("c", "<c-l>", "<end>", { noremap = true })

-- INSERT MODE REMAPS

-- alternate escapes insert mode
vim.api.nvim_set_keymap("i", "jk", "<esc>`^", { noremap = true })

-- bash like movements
vim.api.nvim_set_keymap("i", "<c-f>", "<right>", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-b>", "<left>", { noremap = true })

-- ctrl hjkl movements insert mode
vim.api.nvim_set_keymap("i", "<c-h>", "<cmd>normal ^<cr>", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-j>", "<down>", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-k>", "<up>", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-l>", "<end>", { noremap = true })

-- ctrl-cr ctrl-s-cr new lines
vim.api.nvim_set_keymap("i", "<c-cr>", "<c-o>o", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-s-cr>", "<c-o>O", { noremap = true })

vim.api.nvim_set_keymap("i", "<m-h>", "<cmd>normal b<cr>", { noremap = true })
vim.api.nvim_set_keymap("i", "<m-j>", "<esc>`^<cmd>m .+1<cr>==gi", { noremap = true })
vim.api.nvim_set_keymap("i", "<m-k>", "<esc>`^<cmd>m .-2<cr>==gi", { noremap = true })
vim.api.nvim_set_keymap("i", "<m-l>", "<cmd>normal e<cr>", { noremap = true })

-- VISUAL MODE REMAPS

-- use q to quit visual mode
vim.api.nvim_set_keymap("v", "q", "<esc>", { noremap = true })

-- range ex command
vim.api.nvim_set_keymap("v", ";", ":", { noremap = true })

-- selection hl shift indents, jk line swaps
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })

-- ctrl hjkl movements visual mode
vim.api.nvim_set_keymap("v", "<c-h>", "^", { noremap = true })
vim.api.nvim_set_keymap("v", "<c-j>", "jzz", { noremap = true })
vim.api.nvim_set_keymap("v", "<c-k>", "kzz", { noremap = true })
vim.api.nvim_set_keymap("v", "<c-l>", "$", { noremap = true })

vim.api.nvim_set_keymap("v", "<m-h>", "b", { noremap = true })
vim.api.nvim_set_keymap("v", "<m-k>", ":m '<-2<cr>==gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<m-j>", ":m '>+1<cr>==gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<m-l>", "e", { noremap = true })

vim.keymap.set("v", "<leader>k", function()
  vim.cmd("'<,'>m '<-2<cr>==gv")

  print("Moved selection up")
end, { desc = "Move selection up" })

-- toggle wrap
vim.keymap.set("n", "<leader><cr>", function()
  vim.wo.wrap = not vim.wo.wrap

  print("Wrap " .. (vim.wo.wrap and "enabled" or "disabled"))
end, { desc = "Toggle Wrap" })

-- WINDOW MANAGEMEMENT

-- window scroll bind, unbind
vim.keymap.set("n", "<leader>sb", function()
  vim.cmd("windo set scrollbind")

  print("Scroll Bind enabled")
end, { desc = "Scroll Bind" })

vim.keymap.set("n", "<leader>so", function()
  vim.cmd("windo set noscrollbind")

  print("Scroll Bind disabled")
end, { desc = "Scroll Unbind" })

-- ctrl-` to switch windows
vim.api.nvim_set_keymap("n", "<c-`>", "<c-w>w", { noremap = true })

-- layout windows (non floating/relative)
local windows = function()
  return vim.tbl_filter(function(win)
    if not vim.api.nvim_win_is_valid(win) then
      return false
    end

    return vim.api.nvim_win_get_config(win).relative == ""
  end, vim.api.nvim_list_wins())
end

-- loaded buffers
local buffers = function()
  return vim.tbl_filter(function(buf)
    if 1 ~= vim.fn.buflisted(buf) then
      return false
    end
    if not vim.api.nvim_buf_is_loaded(buf) then
      return false
    end

    return true
  end, vim.api.nvim_list_bufs())
end

--256 on 27" 1440p
local current_window_width = function()
  return vim.api.nvim_win_get_width(0)
end

-- edit new buffer, with vertical split if single window and wide screen
vim.keymap.set("n", "<c-.>", function()
  if current_window_width() < 160 then
    vim.cmd("enew")
  else
    vim.cmd("vnew")
  end
end, { desc = "Edit new (vsplit if space)" })

-- edit new buffer, with horizontal split if single window
vim.keymap.set("n", "<c-'>", function()
  if vim.api.nvim_win_get_height(0) < 60 then
    return
  end

  vim.cmd("new")
end, { desc = "Edit new (split if space)" })

-- close windows or buffers
vim.keymap.set("n", "<c-q>", function()
  if #windows() > 1 then
    vim.cmd("q")
  elseif #buffers() > 1 then
    vim.cmd("bd")
  else
    vim.cmd("q")
  end

end, { desc = "Close windows or buffers" })

-- close current buffer after switching to previous buffer
vim.keymap.set("n", "<m-q>", function()
  if #buffers() > 1 then
    vim.cmd("silent! bp")
    vim.cmd("silent! bd#")
  else
    vim.cmd("q")
  end
end, { desc = "Close current buffer after switching to previous buffer" })

-- open explorer for current buffer
vim.keymap.set("n", "<c-_>", vim.cmd.Ex, { desc = "Open Explorer" })

-- turn diagnostics on/off
vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())

  print("Diagnostics " .. (vim.diagnostic.is_enabled() and "enabled" or "disabled"))
end)

-- terminal escape, window switch
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { noremap = true })

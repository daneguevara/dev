-- command/leader remaps, use <c-,> and <c-;> for repeat last left-right motion
vim.g.mapleader = ","
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })

-- window swaps
vim.api.nvim_set_keymap("n", "<c-left>", "<c-w>h", { desc = "Move to left window" })
vim.api.nvim_set_keymap("n", "<c-right>", "<c-w>l", { desc = "Move to right window" })
vim.api.nvim_set_keymap("n", "<c-up>", "<c-w>k", { desc = "Move to top window" })
vim.api.nvim_set_keymap("n", "<c-down>", "<c-w>j", { desc = "Move to bottom window" })

vim.keymap.set("n", "<leader><bs>", function()
  vim.cmd("silent! %s/\\s\\+$//e")

  print("trailing whitespace")
end, { desc = "Remove trailing whitespace" })

-- clear search highlight, echo
vim.keymap.set("n", "<leader><space>", function()
  vim.cmd("nohlsearch")

  print("nol")
end, { desc = "[C]lear [H]ighlight" })

-- whitespace jumps
vim.api.nvim_set_keymap("n", "<c-h>", "B", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-j>", "}", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-k>", "{", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-l>", "E", { noremap = true })

-- meta (alt) hl side word jumps, jk line swapping
vim.api.nvim_set_keymap("n", "<m-h>", "<<", { noremap = true })
vim.api.nvim_set_keymap("n", "<m-j>", "<cmd>m .+1<cr>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<m-k>", "<cmd>m .-2<cr>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<m-l>", ">>", { noremap = true })

-- escape to normal mode
vim.api.nvim_set_keymap("t", "<c-esc>", "<c-\\><c-n>", { noremap = true })

-- command mode remaps
vim.api.nvim_set_keymap("c", "<c-k>", "<c-f>", { noremap = true })
vim.api.nvim_set_keymap("c", "<c-l>", "<tab>", { noremap = true })

-- alternate escapes insert mode
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })

-- range ex command
vim.api.nvim_set_keymap("v", ";", ":", { noremap = true })

-- selection hl shift indents, jk line swaps
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })

-- ctrl hjkl movements visual mode
vim.api.nvim_set_keymap("v", "<c-h>", "B", { noremap = true })
vim.api.nvim_set_keymap("v", "<c-j>", "}", { noremap = true })
vim.api.nvim_set_keymap("v", "<c-k>", "{", { noremap = true })
vim.api.nvim_set_keymap("v", "<c-l>", "E", { noremap = true })

vim.api.nvim_set_keymap("v", "<m-h>", "<", { noremap = true })
vim.api.nvim_set_keymap("v", "<m-j>", ":m '>+1<cr>==gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<m-k>", ":m '<-2<cr>==gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<m-l>", ">", { noremap = true })

-- toggle wrap
vim.keymap.set("n", "<leader><cr>", function()
  vim.wo.wrap = not vim.wo.wrap

  print("Wrap " .. (vim.wo.wrap and "enabled" or "disabled"))
end, { desc = "Toggle Wrap" })

-- window scroll bind, unbind
vim.keymap.set("n", "<leader>sb", function()
  vim.cmd("windo set scrollbind")

  print("Scroll Bind enabled")
end, { desc = "Scroll Bind" })

vim.keymap.set("n", "<leader>so", function()
  vim.cmd("windo set noscrollbind")

  print("Scroll Bind disabled")
end, { desc = "Scroll Unbind" })

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
  if current_window_width() < 120 then
    vim.cmd("enew")
  else
    vim.cmd("vnew")
  end
end, { desc = "Edit new (vsplit if space)" })

-- edit new buffer, with horizontal split if single window
vim.keymap.set("n", "<c-'>", function()
  if vim.api.nvim_win_get_height(0) < 40 then
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

local current_file_explorer = function()
  local cur_file = vim.fn.expand('%:t')

  vim.cmd.Ex()
  vim.fn.search(cur_file..'$')
end

-- open explorer for current buffer
vim.keymap.set("n", "<c-_>", function()
  current_file_explorer()
end, { desc = "Open Explorer for current file" })

-- turn diagnostics on/off
vim.keymap.set("n", "<F12>", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())

  print("Diagnostics " .. (vim.diagnostic.is_enabled() and "enabled" or "disabled"))
end)

-- terminal escape, window switch
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { noremap = true })

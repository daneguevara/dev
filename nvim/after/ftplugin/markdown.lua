-- add a new task: -  task name
vim.api.nvim_buf_set_keymap(0, "n", "tT", "O-  ", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "tt", "o-  ", { noremap = true, silent = true })

-- add a new item: -  item name
vim.api.nvim_buf_set_keymap(0, "n", "t?", "O-  ", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "t/", "o-  ", { noremap = true, silent = true })

-- add a new event: -   event name
vim.api.nvim_buf_set_keymap(0, "n", "tE", "O-  ", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "te", "o-  ", { noremap = true, silent = true })

local quest_dir = '~/todo/'

local open_today = function()
  vim.cmd('e ' .. quest_dir .. os.date('%Y-%m-%d') .. '.md')
end

local function line_prefix(line)
  if string.match(line, "- ") then
    return "-  "
  end

  if string.match(line, "- ") then
    return "-  "
  end

  if string.match(line, "- ") then
    return "-  "
  end

  if string.match(line, "- ") then
    return "-  "
  end

  return ""
end

-- smart indent
vim.keymap.set("i", "<cr>", function()
  local line = vim.fn.getline(".")
  local prefix = line_prefix(line)

  return "<cr>" .. prefix
end, { noremap = true, expr = true, buffer = 0 })

vim.keymap.set("n", "O", function()
  local line = vim.fn.getline(".")
  local prefix = line_prefix(line)

  return "O" .. prefix
end, { noremap = true, expr = true, buffer = 0 })

vim.keymap.set("n", "o", function()
  local line = vim.fn.getline(".")
  local prefix = line_prefix(line)

  return "o" .. prefix
end, { noremap = true, expr = true, buffer = 0 })

-- keymap to mark/unmark task on current line as done: -  task name
vim.keymap.set("n", "x", function()
  local line = vim.fn.getline(".")

  if string.match(line, "- ") then
    vim.fn.setline(".", tostring(string.gsub(line, "- ", "- ")))
  else
    vim.fn.setline(".", tostring(string.gsub(line, "- ", "- ")))
  end
end, { noremap = true, silent = true, buffer = 0 })

local function in_place_edit()
  local line = vim.fn.getline(".")
  local task = string.match(line, "%s*- ")
  local done = string.match(line, "%s*- ")
  local item = string.match(line, "%s*- ")
  local event = string.match(line, "%s*- ")
  local header = string.match(line, "#+")

  if done then
    vim.api.nvim_err_writeln("Cannot edit completed task")
    return
  end

  local match = task or item or event or header

  if match then
    vim.fn.setline(".", tostring(match .. " "))
    vim.cmd("startinsert!")
    return
  end

  vim.fn.setline(".", "")
  vim.cmd("startinsert!")
end

-- keymap to edit (change) the task on current line
vim.keymap.set("n", "cc", in_place_edit, { noremap = true, buffer = 0 })

-- TEMPLATE
local skeleton = {
  "# " .. os.date("%m/%d/%Y"),
}

vim.keymap.set("n", "<leader>qq", open_today, { noremap = true, buffer = 0 })

vim.keymap.set("n", "<leader>gg", function()
  vim.fn.append(0, skeleton)

  print("Daily")
end, { noremap = true, silent = true, buffer = 0 })

-- search without highlights
vim.api.nvim_buf_set_keymap(0, "n", "n", "n:noh<cr>", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "N", "N:noh<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "tn", function()
  vim.cmd([[silent! /- \[.\] \zs\(.*\)]])
  vim.cmd([[noh]])
end, { noremap = true, silent = true, buffer = 0 })

vim.keymap.set("n", "tN", function()
  vim.cmd([[silent! ?- \[.\] \zs\(.*\)]])
  vim.cmd([[noh]])
end, { noremap = true, silent = true, buffer = 0 })

vim.keymap.set("n", "mn", function()
  vim.cmd([[silent! /^\s*- \zs[^[]\(.*\)]])
  vim.cmd([[noh]])
end, { noremap = true, silent = true, buffer = 0 })

vim.keymap.set("n", "mN", function()
  vim.cmd([[silent! ?^\s*- \zs[^[]\(.*\)]])
  vim.cmd([[noh]])
end, { noremap = true, silent = true, buffer = 0 })

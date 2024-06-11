-- add a new task: - [ ] task name
vim.api.nvim_buf_set_keymap(0, 'n', 'tT', 'O- [ ] ', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', 'tt', 'o- [ ] ', { noremap = true, silent = true })

-- add a new item: - item name
vim.api.nvim_buf_set_keymap(0, 'n', 'tM', 'O- ', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', 'tm', 'o- ', { noremap = true, silent = true })

-- add a new header: ## header name
vim.api.nvim_buf_set_keymap(0, 'n', 'tH', 'O## ', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', 'th', 'o## ', { noremap = true, silent = true })

-- add a new event :   event name
vim.api.nvim_buf_set_keymap(0, 'n', 'tE', 'O  ', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', 'te', 'o  ', { noremap = true, silent = true })

local function line_prefix(line)
  if string.match(line, '- %[.%] ') then
    return '- [ ] '
  end

  if string.match(line, '- ') then
    return '- '
  end

  if string.match(line, '## ') then
    return '## '
  end

  if string.match(line, '  ') then
    return '  '
  end

  return ''
end

-- smart indent
vim.keymap.set('i', '<cr>', function()
  local line = vim.fn.getline('.')
  local prefix = line_prefix(line)

  return '<c-o>o' .. prefix
end, { noremap = true, expr = true, buffer = 0 })

vim.keymap.set('n', 'O', function()
  local line = vim.fn.getline('.')
  local prefix = line_prefix(line)

  return 'O' .. prefix
end, { noremap = true, expr = true, buffer = 0 })

vim.keymap.set('n', 'o', function()
  local line = vim.fn.getline('.')
  local prefix = line_prefix(line)

  return 'o' .. prefix
end, { noremap = true, expr = true, buffer = 0 })

-- keymap to mark/unmark task on current line as done: - [x] task name
vim.keymap.set('n', 'x', function()
  local line = vim.fn.getline('.')

  if string.match(line, '- %[ %]') then
    vim.fn.setline('.', tostring(string.gsub(line, '- %[ %]', '- [x]')))
  else
    vim.fn.setline('.', tostring(string.gsub(line, '- %[x]', '- [ ]')))
  end
end, { noremap = true, silent = true, buffer = 0 })

local function in_place_edit()
  local line = vim.fn.getline('.')
  local task = string.match(line, '%s*- %[ %] ')
  local done = string.match(line, '%s*- %[x%] ')
  local note = string.match(line, '%s*- ')
  local header = string.match(line, '## ')
  local event = string.match(line, '  ')

  if done then
    vim.api.nvim_err_writeln('Cannot edit completed task')
    return
  end

  for _, match in ipairs({ task, note, header, event }) do
    if match then
      vim.fn.setline('.', tostring(match))
      vim.cmd('startinsert!')
      return
    end
  end

  vim.cmd('startreplace')
end

-- keymap to edit (change) the task on current line
vim.keymap.set('n', 'cc', in_place_edit, { noremap = true, buffer = 0 })

-- TEMPLATE
local skeleton = {
  '# ' .. os.date('%m/%d/%Y'),
  '',
  '## TODAY',
  '',
  '## TODO',
  '',
  '## NOTES',
}
-- TEMPLATE

-- lfg
vim.keymap.set('n', '<leader>lfg', function()
  vim.fn.append(0, skeleton)

  print("LET'S F*CKING GO!")
end, { noremap = true, silent = true, buffer = 0 })

-- search without highlights

vim.keymap.set('n', 'n', function()
  vim.fn.search('- \\[.\\] ', 'eW')
end, { noremap = true, silent = true, buffer = 0 })

vim.keymap.set('n', 'p', function()
  vim.fn.search('- \\[.\\] ', 'beW')
end, { noremap = true, silent = true, buffer = 0 })

-- search with highlights

vim.keymap.set('n', 'tn', function()
  vim.cmd([[/- \[.\] \zs\(.*\)]])
end, { noremap = true, silent = true, buffer = 0 })

vim.keymap.set('n', 'tp', function()
  vim.cmd([[?- \[.\] \zs\(.*\)]])
end, { noremap = true, silent = true, buffer = 0 })

vim.keymap.set('n', 'mn', function()
  vim.cmd([[/- \zs\([^[].*\)]])
end, { noremap = true, silent = true, buffer = 0 })

vim.keymap.set('n', 'mp', function()
  vim.cmd([[?- \zs\([^[].*\)]])
end, { noremap = true, silent = true, buffer = 0 })

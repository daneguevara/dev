-- task done - [x] lfg
-- task todo - [ ] rip
-- memo note - kekw

local task_before = 'O- [ ] '
local task_after = 'o- [ ] '
local memo_before = 'O- '
local memo_after = 'o- '

-- keymaps to add a new task: - [ ] task name
vim.api.nvim_buf_set_keymap(0, 'n', 'ti', task_before, { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', 'ta', task_after, { noremap = true, silent = true })

-- keymaps to add a new memo item
vim.api.nvim_buf_set_keymap(0, 'n', 'mi', memo_before, { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', 'ma', memo_after, { noremap = true, silent = true })

-- smart indent
vim.keymap.set('i', '<cr>', function()
  local line = vim.fn.getline('.')
  local is_task = string.match(line, '- %[.%] ')
  local is_note_item = string.match(line, '- ')

  -- to normal mode
  vim.api.nvim_input('<c-o>')

  if is_task then
    vim.api.nvim_input(task_after)
  elseif is_note_item then
    vim.api.nvim_input(memo_after)
  else
    vim.api.nvim_input('o')
  end
end, { noremap = true, buffer = 0 })

vim.keymap.set('n', 'i', function()
  local line = vim.fn.getline('.')
  local is_task = string.match(line, '- %[.%] ')
  local is_note_item = string.match(line, '- ')

  if is_task then
    vim.api.nvim_input(task_before)
  elseif is_note_item then
    vim.api.nvim_input(memo_before)
  else
    vim.api.nvim_input('i')
  end
end, { noremap = true, buffer = 0 })

vim.keymap.set('n', 'a', function()
  local line = vim.fn.getline('.')
  local is_task = string.match(line, '- %[.%] ')
  local is_note_item = string.match(line, '- ')

  if is_task then
    vim.api.nvim_input(task_after)
  elseif is_note_item then
    vim.api.nvim_input(memo_after)
  else
    vim.api.nvim_input('a')
  end
end, { noremap = true, buffer = 0 })

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
  local task = string.match(line, '- %[ %] ')
  local done = string.match(line, '- %[x%] ')
  local note = string.match(line, '- ')

  if task then
    vim.fn.setline('.', tostring(task))
    vim.cmd('startinsert!')
    return
  end

  if done then
    vim.api.nvim_err_writeln('Cannot edit completed task')
    return
  end

  if note then
    vim.fn.setline('.', tostring(note))
    vim.cmd('startinsert!')
    return
  end

  vim.input('cc')
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

local harpoon = require('harpoon')
-- local action = require('telescope.actions')

-- REQUIRED
harpoon:setup({})
-- REQUIRED

-- basic telescope configuration
-- local config = require('telescope.config').values
-- local function toggle_telescope(harpoon_files)
--   local file_paths = {}
--   for _, item in ipairs(harpoon_files.items) do
--     table.insert(file_paths, item.value)
--   end

--   require('telescope.pickers').new({
--     attach_mappings = function(prompt_bufnr, map)
--       map('i', '<c-e>', 'close')
--       map('n', '<c-e>', 'close')
--       map('i', '<c-a>', function()
--         action.close(prompt_bufnr)

--         harpoon.ui:toggle_quick_menu(harpoon:list(), { title = ' 󰈸 󰈸 fires 󰈸 󰈸 ' })
--       end)

--       return true
--     end,
--   }, {
--     prompt_title = '󰈸 this is fine 󰈸',
--     sorting_strategy = 'ascending',
--     finder = require('telescope.finders').new_table({
--       results = file_paths,
--     }),
--     previewer = config.file_previewer({}),
--     sorter = config.generic_sorter({}),
--   }):find()
-- end

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
-- vim.keymap.set('n', '<c-e>', function()
--   toggle_telescope(harpoon:list())
-- end, { desc = '󰈸 this is fine 󰈸' })

vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end)

-- fast navigation!!
vim.keymap.set('n', '<c-p>', function() harpoon:list():prev() end)
vim.keymap.set('n', '<c-n>', function() harpoon:list():next() end)
vim.keymap.set('n', '<c-a>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list(), { title = ' 󰈸 󰈸 fires 󰈸 󰈸 ' })
end)

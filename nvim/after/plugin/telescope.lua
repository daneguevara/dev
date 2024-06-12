local telescope = require('telescope')
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
local layout = require('telescope.actions.layout')
local state = require('telescope.actions.state')
local harpoon = require('harpoon')

local preview_scroll = function(n)
  local current_picker = state.get_current_picker(vim.api.nvim_get_current_buf())
  local previewer = current_picker.previewer

  if previewer and previewer.scroll_fn then
    previewer:scroll_fn(n)
  end
end

telescope.setup({
  defaults = {
    layout_strategy = 'flex',
    layout_config = {
      width = 0.75,
      height = 0.75,
      flex = {
        flip_columns = 160
      },
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<c-/>'] = 'close',
        ['<c-e>'] = 'close',
        ['<c-f>'] = 'close',
        ['<c-l>'] = false,
        ['<c-s>'] = function()
          layout.toggle_preview(vim.api.nvim_get_current_buf())
        end,
        ['<c-j>'] = function()
          preview_scroll(1)
        end,
        ['<c-k>'] = function()
          preview_scroll(-1)
        end,
        ['<c-a>'] = function()
          local selected_entry = state.get_selected_entry()

          -- check if the selected entry is a file
          local file = io.open(selected_entry.value, 'r')
          if file then
            file:close()

            print('setting on 󰈸: ' .. selected_entry.value)

            harpoon:list():add({
              value = selected_entry.value,
              context = {
                row = 1,
                col = 0,
              },
            })
            harpoon:sync()
          else
            print('cannot set on 󰈸: ' .. selected_entry.value)
          end
        end,
      },
      n = {
        ['<c-/>'] = "close",
        ['<c-e>'] = "close",
        ['<c-f>'] = "close",
        ['<c-s>'] = function()
          layout.toggle_preview(vim.api.nvim_get_current_buf())
        end,
      },
    },
  },
})

-- general searches
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]ld' })
vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc = '[F]ind [T]reesitter' })
vim.keymap.set('n', '<leader>fa', builtin.autocommands, { desc = '[F]ind [A]utocommands' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = '[F]ind [C]ommands' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fv', builtin.vim_options, { desc = '[F]ind [V]im Options' })
vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = '[F]ind [R]egisters' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = '[F]ind [Q]uickfix' })
vim.keymap.set('n', '<leader>fl', function()
  builtin.find_files({
    prompt_title = 'Find Lua Config',
    cwd = '/home/vagrant/.config/nvim',
  })
end, { desc = '[F]ind [L]ua Config' })

-- project ls (git)
vim.keymap.set('n', '<leader>ps', function()
  builtin.git_files({
    prompt_title = 'Files (' .. vim.cmd('pwd') .. ')',
  })
end, { desc = '[P]roject L[s]' })

-- project grep (ripgrep)
vim.keymap.set('n', '<leader>pg', function()
  builtin.live_grep({
    prompt_title = 'Grep (' .. vim.cmd('pwd') .. ')',
  })
end, { desc = '[P]roject [G]rep' })

-- local ls
vim.keymap.set('n', '<leader>ls', function()
  builtin.find_files({
    prompt_title = 'Files (' .. utils.buffer_dir() .. ')',
    cwd = utils.buffer_dir(),
  })
end, { desc = '[L]i[s]t Dir' })

-- local grep (ripgrep)
vim.keymap.set('n', '<c-/>', function()
  builtin.live_grep({
    prompt_title = 'Grep (' .. utils.buffer_dir() .. ')',
    cwd = utils.buffer_dir(),
  })
end, { desc = 'Local Grep' })

-- local cursor word grep
vim.keymap.set('n', '<leader>/', function()
  builtin.grep_string({ cwd = utils.buffer_dir() })
end, { desc = 'Grep Cursor Word' })

-- buffer manager
vim.keymap.set('n', '<c-b>', function()
  builtin.buffers({
    sort_mru = true,
    attach_mappings = function(_, map)
      map('i', '<c-d>', 'delete_buffer')
      map('i', '<c-8>', 'delete_buffer')
      map('n', 'd', 'delete_buffer')
      map('i', '<c-b>', 'close')
      map('n', '<c-b>', 'close')

      return true
    end,
  })
end, { desc = 'Buffers' })

-- halp
vim.keymap.set('n', '<leader>h', function()
  builtin.help_tags({
    cache_picker = {
      num_pickers = 1,
    },
    layout_strategy = 'flex',
    layout_config = {
      width = 0.75,
      height = 0.9,
      flex = {
        flip_columns = 160
      },
    },
  })
end, { desc = '[H]elp' })

vim.keymap.set('n', '<c-f>', builtin.resume, { desc = 'Resume [F]inder' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })

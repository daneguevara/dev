local telescope = require('telescope')
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
local layout = require('telescope.actions.layout')
local state = require('telescope.actions.state')
local actions = require('telescope.actions')
local harpoon = require('harpoon')

local preview_scroll = function(n)
  local current_picker = state.get_current_picker(vim.api.nvim_get_current_buf())
  local previewer = current_picker.previewer

  if previewer and previewer.scroll_fn then
    previewer:scroll_fn(n)
  end
end

local preview_scroll_j = function()
  preview_scroll(1)
end

local preview_scroll_k = function()
  preview_scroll(-1)
end

local toggle_preview = function()
  layout.toggle_preview(vim.api.nvim_get_current_buf())
end

telescope.setup({
  defaults = {
    path_display = {
      'truncate',
    },
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
        ['<c-x>'] = false,
        ['<c-s>'] = toggle_preview,
        ['<c-j>'] = preview_scroll_j,
        ['<c-k>'] = preview_scroll_k,
        ['<m-q>'] = false,
        ['<c-q>'] = actions.smart_send_to_qflist,
        ['<c-a>'] = function()
          local selected_entry = state.get_selected_entry()

          -- -- check if the selected entry is a file
          -- local file = io.open(selected_entry.value, 'r')
          -- if file then
          if selected_entry then
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

-- quickfix bindings
vim.keymap.set('n', 'qq', builtin.quickfix, { desc = '[F]ind [Q]uickfix' })
vim.keymap.set('n', 'qn', function() vim.cmd('cnext') end, { desc = '[Q]uickfix [N]ext' })
vim.keymap.set('n', 'qp', function() vim.cmd('cprev') end, { desc = '[Q]uickfix [P]rev' })

-- general searches
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]ld' })
vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc = '[F]ind [T]reesitter' })
vim.keymap.set('n', '<leader>fa', builtin.autocommands, { desc = '[F]ind [A]utocommands' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = '[F]ind [C]ommands' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fv', builtin.vim_options, { desc = '[F]ind [V]im Options' })
vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = '[F]ind [R]egisters' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fl', function()
  builtin.find_files({
    prompt_title = 'Find Lua Config',
    cwd = '~/.config/nvim',
  })
end, { desc = '[F]ind [L]ua Config' })

-- git files
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })

-- global grep (ripgrep)
vim.keymap.set('n', '<leader>gg', function()
  builtin.live_grep({
    prompt_title = 'Grep (' .. vim.cmd('pwd') .. ')',
  })
end, { desc = '[G]lobal [G]rep' })

-- find files (local)
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({
    prompt_title = 'Files (' .. utils.buffer_dir() .. ')',
    cwd = utils.buffer_dir(),
  })
end, { desc = '[F]ind [F]iles' })

-- grep (local)
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
      map('i', '<c-q>', 'delete_buffer')
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

local startup = require('startup')
local quote = require('rainer.quotes')

local oldfile_size = 6

-- local open_oldfile = function(n)
--   vim.fn.search('\\[' .. n .. '\\]', 'w')

--   startup.open_file()
--   vim.cmd('noh')
-- end

-- local open_oldfile_vsplit = function(n)
--   vim.fn.search('\\[' .. n .. '\\]', 'w')

--   startup.open_file_vsplit()
--   vim.cmd('noh')
-- end

local open_today = function()
  vim.cmd('vsplit ~/todo/' .. os.date('%Y-%m-%d') .. '.md')
end

local cast_spell = function()
  return quote()
end

local settings

settings = {
  header = {
    type = 'text',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Header',
    margin = 5,
    content = {
      '                                    ¶¶¶¶¶¶             ',
      '                                ¶¶¶¶¶ccee¶¶            ',
      '                              ¶¶¶cccceeaa¶¶            ',
      '                          ¶¶¶¶¶cccceeaaa¶¶             ',
      '                      ¶¶¶¶¶cccccceeaaaa¶¶              ',
      '           ¶¶¶¶¶¶¶¶¶¶¶¶cccccceeaaaaaaa¶¶               ',
      '         ¶¶¶ccccccccccccceeaaaaaaaaaa¶¶                ',
      '           ¶¶¶aaaaaaaeeceeeeeaaaaaag¶¶                 ',
      '             ¶¶¶¶¶¶aaaaaaaaeeeeeeag¶¶                  ',
      '                 ¶¶¶¶¶¶¶¶aaaaaaeeegg¶¶                 ',
      '                  #######¶¶¶¶¶aaaaggg¶¶                ',
      '                 ###|¯|########¶¶aaaaggg¶¶             ',
      '               ¶¶###| |###|¯|#####¶¶¶aagggg¶¶          ',
      '             ¶¶££#########| |########¶¶¶¶ggg¶¶         ',
      '           ¶¶££¶¶#################£££££¶¶¶¶¶           ',
      '           ¶¶££££££#########££££££££¶¶£¶¶              ',
      '           ¶¶¶¶££££££££££££¶¶¶¶¶¶£££££¶¶               ',
      '          ¶§xxx¶¶££££££¶¶¶¶££££££££££££¶¶              ',
      '          ¶§xxx¶¶££££¶¶¶¶¶¶££££££££££££¶¶              ',
      '           ¶¶¶¶££££££§xxx¶¶££££££££££££¶¶              ',
      '           ¶¶££¶¶££££§xxx¶¶££££££££££££¶¶              ',
      '           ¶¶££¶¶££££¶¶¶¶¶¶££££££££££¶¶                ',
      '           ¶¶£££¶¶£££££££££¶¶££££££££¶¶                ',
      '           ¶¶££££¶¶¶£££££££¶¶££££££££¶¶                ',
      '          ¶¶£££££££¶¶¶¶¶¶££££¶¶££££¶¶££¶¶              ',
      '         ¶¶££££££££££££££££££££¶¶¶¶££££££¶¶            ',
      '          ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    ¶¶¶¶¶¶¶             ',
      '                                                       ',
      ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
      ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
      ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
      ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
      ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
      ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    },
    highlight = 'Statement',
  },
  quote = {
    type = 'text',
    align = 'center',
    fold_section = false,
    title = 'Quote',
    margin = 5,
    content = cast_spell(),
    highlight = 'Constant',
  },
  today = {
    type = 'text',
    align = 'center',
    fold_section = false,
    title = 'Today',
    content = {
      ' ' .. os.date('%m/%d/%Y'),
    },
    highlight = 'SpecialComment',
  },
  body = {
    type = 'mapping',
    align = 'center',
    fold_section = false,
    title = 'Commands',
    margin = 5,
    content = {
      { ' Colorschemes', 'Telescope colorscheme', '<leader>cs' },
    },
    highlight = 'String',
    oldfiles_amount = 0,
  },
  footer = {
    type = 'oldfiles',
    oldfiles_directory = true,
    align = 'center',
    fold_section = false,
    title = 'Recent Files',
    margin = 5,
    content = {},
    highlight = 'String',
    default_color = '#FFFFFF',
    oldfiles_amount = oldfile_size,
  },
  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = { 1, 3, 3, 3, 0 },
    after = function()
      local startup_window_id = vim.api.nvim_get_current_win()
      local window_width = vim.api.nvim_win_get_width(0)

      for i = 0, 9 do
        vim.keymap.set('n', tostring(i), function()
          vim.fn.search('\\[' .. i .. '\\]', 'w')

          -- clear highlights
          vim.cmd('noh')
        end, { noremap = true, silent = true, buffer = true })
      end

      -- o to open oldfile
      vim.keymap.set('n', 'o', function()
        local line_ref_id = string.match(vim.fn.getline('.'), '%[(%d+)%]')

        if line_ref_id == nil then
          vim.fn.search('\\[0\\]', 'w')
          vim.cmd('noh')
        end

        startup.open_file()
        vim.cmd('noh')
      end, { noremap = true, silent = true, buffer = true })

      -- v to open oldfile in vertical split
      vim.keymap.set('n', 'v', function()
        local line_ref_id = string.match(vim.fn.getline('.'), '%[(%d+)%]')

        if line_ref_id == nil then
          vim.fn.search('\\[0\\]', 'w')
          vim.cmd('noh')
        end

        startup.open_file_vsplit()
        vim.cmd('noh')
      end, { noremap = true, silent = true, buffer = true })

      -- t to open shenanigans for today
      vim.keymap.set('n', 't', function()
        open_today()
      end, { noremap = true, silent = true, buffer = true })

      -- p to open vertical explorer
      vim.keymap.set('n', 'p', function()
        vim.cmd.Vexplore({ bang = true })
      end, { noremap = true, silent = true, buffer = true })

      -- girl bye q.q
      vim.keymap.set('n', 'qq', function()
        print('Girl bye!')
        vim.cmd('q')
      end, { noremap = true, silent = true, buffer = true })

      -- hide statuslines when switching to startup buffer (startup plugin unsets when leaving)
      vim.api.nvim_create_autocmd('BufEnter', {
        buffer = 0,
        desc = 'Hide startup statuslines',
        callback = function()
          vim.opt.laststatus = 0
          vim.opt.showtabline = 0
        end,
      })

      -- resize startup window on width change
      local redraw_id = vim.api.nvim_create_autocmd('WinResized', {
        pattern = '*',
        desc = 'Redraw wizard',
        callback = function()
          local mode = vim.api.nvim_get_mode().mode

          -- only redraw in normal mode bc of startup cursor update shenanigans
          if mode ~= 'n' then
            return
          end

          local window_width_current = vim.api.nvim_win_get_width(startup_window_id)

          if window_width_current == window_width then
            return
          end

          -- cast spell from the office
          startup.settings.quote.content = cast_spell()

          if vim.bo.filetype == 'startup' then
            startup.redraw()
          else
            startup.redraw(true)
          end

          window_width = window_width_current
          vim.cmd('noh')
          vim.api.nvim_win_set_cursor(0, { 1, 1 })
        end,
      })

      -- redraw autocmd cleanup

      vim.api.nvim_create_autocmd('BufUnload', {
        buffer = 0,
        desc = 'Delete startup buffer redraw autocommand',
        callback = function()
          vim.api.nvim_del_autocmd(redraw_id)
        end,
      })
    end,
  },
  mappings = {
    execute_command = '<cr>',
    open_section = '<tab>',
    open_help = '?',
  },
  colors = {
    background = '#1f2227',
    folded_section = '#56b6c2',
  },
  helpers = {
    open_oldfile = open_oldfile,
    open_today = open_today,
  },
  parts = { 'header', 'quote', 'today', 'body', 'footer' },
}

return settings

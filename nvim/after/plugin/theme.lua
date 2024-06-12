require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('catppuccin').setup({

  term_colors = true,
  transparent_background = true,
  color_overrides = {
    mocha = {
      base = "#0b0b12",
      mantle = "#11111a",
      crust = "#14191e",
    },
  },
  integrations = {
    cmp = true,
    treesitter = true,
    notify = true,
    harpoon = true,
    native_lsp = {
      enabled = true,
      inlay_hints = {
        background = true,
      },
    },
    telescope = {
      enabled = true,
    },
  }
})

vim.cmd [[colorscheme catppuccin]]

-- turn off in favor of lualine
vim.opt.showmode = false

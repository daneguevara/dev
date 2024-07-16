local configs = require('nvim-treesitter.configs')
local parsers = require('nvim-treesitter.parsers')

---@diagnostic disable-next-line: missing-fields
configs.setup({

  -- language parsers, not filetypes
  ensure_installed = {
    'c',
    'lua',
    'vim',
    'vimdoc',
    'bash',
    'query',
    'python',
    'rust',
    'javascript',
    'typescript',
    'html',
    'css',
    'json',
    'sql',
    'hcl',
    'yaml',
    'terraform',
  },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

---@diagnostic disable-next-line: inject-field
parsers.get_parser_configs().terroir = {
  install_info = {
    url = '~/projects/tree-sitter-terroir',
    files = {
      'src/parser.c',
      'src/tree_sitter/parser.h',
    },
    branch = 'main',
    generate_requires_npm = false,
    requires_generate_from_grammar = false,

    -- parsers are registered to filetypes
    filetype = 'tf',
  }
}

vim.api.nvim_set_keymap('n', 'gt', ':TSHighlightCapturesUnderCursor<cr>', { noremap = true, silent = true })

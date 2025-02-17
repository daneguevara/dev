local configs = require("nvim-treesitter.configs")
local parsers = require("nvim-treesitter.parsers")

---@diagnostic disable-next-line: missing-fields
configs.setup({
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise "v")
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg "@function.inner"
      -- * method: eg "v" or "o"
      -- and should return the mode ("v", "V", or "<c-v>") or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg "@function.inner"
      -- * selection_mode: eg "v"
      -- and should return true or false
      include_surrounding_whitespace = true,
    },
  },

  -- language parsers, not filetypes
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "bash",
    "query",
    "python",
    "rust",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "sql",
    "hcl",
    "yaml",
    "terraform",
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
    url = "~/projects/tree-sitter-terroir",
    files = {
      "src/parser.c",
      "src/tree_sitter/parser.h",
    },
    branch = "main",
    generate_requires_npm = false,
    requires_generate_from_grammar = false,

    -- parsers are registered to filetypes
    filetype = "tf",
  }
}

vim.api.nvim_set_keymap("n", "gt", ":TSHighlightCapturesUnderCursor<cr>", { noremap = true, silent = true })

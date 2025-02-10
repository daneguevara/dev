local noice = require("noice")

noice.setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  cmdline = {
    enabled = true,        -- enables the Noice cmdline UI
    view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim", title = " Command " },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+" }, icon = "", lang = "lua", title = " Lua " },
      lua_print = { pattern = { "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "=", lang = "lua", title = " Lua Print " },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      input = { view = "cmdline_input" },  -- Used by input()
    },
  },
  popupmenu = {
    enabled = true, -- enables the Noice popupmenu UI
    ---@type 'nui'|'cmp'
    backend = "nui", -- backend to use to show regular cmdline completions
    -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
    kind_icons = {}, -- set to `false` to disable icons
  },
  presets = {
    inc_rename = false,   -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
  views = {
    cmdline_popup = {
      position = {
        row = 21,
        col = "50%",
      },
      size = {
        width = 75,
        height = "auto",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 24,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
  messages = {
    enabled = true,
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
  },
  errors = {
    view = "mini",
  },
  commands = {
    log = {
      view = "popup",
      opts = {
        enter = details,
        format = "details",
        position = {
          row = "50%",
          col = "2%",
        },
        size = {
          height = 40,
          width = 100,
        },
      },
      filter = {},
    },
    errors = {
      view = "mini",
    },
  },
})

-- send command
vim.keymap.set("c", "<c-s>", function()
  noice.redirect(vim.fn.getcmdline())
end, { desc = "Redirect Cmdline", noremap = true })

-- clear screen
vim.keymap.set("n", "<leader><space>", function()
  vim.cmd("noh")
  vim.cmd("Noice dismiss")
end, { desc = "Clear highlights, notices" })

-- show messages
vim.keymap.set("n", "<c-s>", function()
  vim.cmd("NoiceLog")
end, { desc = "Messages" })

local noice = require('noice')

noice.setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    -- bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    -- long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
  cmdline = {
    enabled = true, -- enables the Noice cmdline UI
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = {}, -- global options for the cmdline. See section on views
    format = {
      -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
      -- view: (default is cmdline view)
      -- opts: any options passed to the view
      -- icon_hl_group: optional hl_group for the icon
      -- title: set to anything or empty string to hide
      cmdline = { pattern = "^:", icon = "", lang = "vim", title = " Command " },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+" }, icon = "", lang = "lua", title = " Lua " },
      lua_print = { pattern = { "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "=", lang = "lua", title = " Lua Print " },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = { view = "cmdline_input" }, -- Used by input()
      -- lua = false, -- to disable a format, set to `false`
    },
  },
})

-- send it
vim.keymap.set("c", "<c-s>", function()
  noice.redirect(vim.fn.getcmdline())
end, { desc = "Redirect Cmdline", noremap = true })

-- clear notifications
vim.keymap.set("n", "qq", function()
  vim.cmd("Noice dismiss")
end, { desc = "Dismiss Noice" })

-- open latest errors
vim.api.nvim_set_keymap("c", "<c-e>", "<c-u>NoiceErrors<cr>", { noremap = true, })

-- open latest messages
vim.api.nvim_set_keymap("c", "<c-y>", "<c-u>NoiceLast<cr>", { noremap = true, })

local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.on_attach(function(_, buff)
  lsp.default_keymaps({ buffer = buff })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'rust_analyzer' },

  handlers = {
    ['pylsp'] = function()
      lspconfig.pylsp.setup({
        settings = {
          pylsp = {
            configurationSources = { 'flake8' },
            plugins = {
              pycodestyle = {
                enabled = false,
              },
            },
            flake8 = {
              enabled = true,
              --['hang-closing'] = true,
              config = 'flake8',
            },
            ruff = {
              enabled = true,
            },
          },
        },
      })
    end,

    ['sqlls'] = function()
      lspconfig.sqlls.setup({
        cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
        filetypes = { 'sql' },
        root_dir = function()
          return vim.loop.cwd()
        end,
      })
    end,

    ['lua_ls'] = function()
      lspconfig.lua_ls.setup({
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
            return
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                -- '~/.local/share/nvim/site/pack/packer/start/LuaSnip',
                '~/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp',
                '~/.local/share/nvim/site/pack/packer/start/harpoon',
                -- '~/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim',
                -- '~/.local/share/nvim/site/pack/packer/start/lualine.nvim',
                -- '~/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim',
                -- '~/.local/share/nvim/site/pack/packer/start/mason.nvim',
                '~/.local/share/nvim/site/pack/packer/start/nvim-cmp',
                '~/.local/share/nvim/site/pack/packer/start/nvim-lspconfig',
                '~/.local/share/nvim/site/pack/packer/start/nvim-treesitter',
                -- '~/.local/share/nvim/site/pack/packer/start/nvim-web-devicons',
                -- '~/.local/share/nvim/site/pack/packer/start/packer.nvim',
                '~/.local/share/nvim/site/pack/packer/start/playground',
                '~/.local/share/nvim/site/pack/packer/start/plenary.nvim',
                '~/.local/share/nvim/site/pack/packer/start/telescope.nvim',
                -- '~/.local/share/nvim/site/pack/packer/start/undotree',
                -- '~/.local/share/nvim/site/pack/packer/start/vim-commentary',
                -- '~/.local/share/nvim/site/pack/packer/start/vim-fugitive',
                '~/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent',
                '~/.local/share/nvim/site/pack/packer/start/vim-repeat',
                '~/.local/share/nvim/site/pack/packer/start/vim-surround',
                '~/.local/share/nvim/site/pack/packer/opt/copilot-cmp',
                '~/.local/share/nvim/site/pack/packer/opt/copilot.lua',
                -- '~/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects',
                -- '/usr/local/lib/nvim',
                '~/.config/nvim/after',
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          })
        end,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })
    end,

    ['ts_ls'] = function()
      lspconfig.ts_ls.setup({})
    end,

    ['terraformls'] = function()
      lspconfig.terraformls.setup({})

      vim.api.nvim_create_autocmd({'BufWritePre'}, {
        pattern = {'*.tf', '*.tfvars'},
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end,

    ['tflint'] = function()
      lspconfig.tflint.setup({})
    end,
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('rainer-lsp-attach', { clear = true }),
  callback = function(event)
    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    local imap = function(keys, func, desc)
      vim.keymap.set('i', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <c-t>.
    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

    -- Find references for the word under your cursor.
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    nmap('go', require('telescope.builtin').lsp_type_definitions, '[Go]to Type [D]efinition')

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    nmap('<leader>sd', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    nmap('<leader>sw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- or a suggestion from your LSP for this to activate.
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap.
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    imap('<c-s>', vim.lsp.buf.signature_help, 'Signature Help')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  end,
})

local cmp_status_ok, cmp = pcall(require, 'cmp')

if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end

require('luasnip/loaders/from_vscode').lazy_load()

-- local check_backspace = function()
--   local col = vim.fn.col('.') - 1
--   return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
-- end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = '',
  Method = 'm',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
  Copilot = '',
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

-- append args string to /tmp/nvim.log
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      else
        cmp.complete()
      end
    end, {
      'i',
    }),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
      else
        cmp.complete()
      end
    end, {
      'i',
    }),
    ['<C-w>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
      else
        fallback()
      end
    end, {
      'i',
    }),
    ['<C-e>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.abort()
      end
    end, {
      'i',
    }),
    ['<C-y>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.complete_common_string()
      else
        cmp.complete()
      end
    end, {
      'i',
    }),
    ['<C-h>'] = cmp.mapping(function(fallback)
      local suggestion = require('copilot.suggestion')

      if suggestion.is_visible() then
        suggestion.dismiss()
      else
        fallback()
      end
    end, {
      'i',
    }),
    ['<C-l>'] = cmp.mapping(function(fallback)
      local suggestion = require('copilot.suggestion')

      if suggestion.is_visible() then
        suggestion.accept_line()
      else
        fallback()
      end
    end, {
      'i',
    }),
    ['<cr>'] = cmp.mapping(function(fallback)
      if cmp.visible() and cmp.get_active_entry() then
        cmp.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        })
      else
        fallback()
      end
    end, {
      'i',
    }),
    ['<C-cr>'] = cmp.mapping(function(fallback)
      local suggestion = require('copilot.suggestion')

      if suggestion.is_visible() then
        suggestion.accept()
      else
        fallback()
      end
    end, {
      'i',
    }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      local suggestion = require('copilot.suggestion')

      if luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      elseif suggestion.is_visible() then
        suggestion.accept_word()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<C-j>'] = cmp.mapping(function(fallback)
      local suggestion = require('copilot.suggestion')

      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif suggestion.is_visible() then
        suggestion.accept()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<C-Tab>'] = cmp.mapping(function(fallback)
      local suggestion = require('copilot.suggestion')

      if suggestion.is_visible() then
        suggestion.accept_word()
      else
        fallback()
      end
    end, {
      'i',
    }),
    ['<C-u>'] = cmp.mapping(function(fallback)
      if not require('noice.lsp').scroll(-4) then
        fallback()
      end
    end, {
      'n',
      'i',
      's',
    }),
    ['<C-d>'] = cmp.mapping(function(fallback)
      if not require('noice.lsp').scroll(4) then
        fallback()
      end
    end, {
      'n',
      'i',
      's',
    }),
    ['<C-.>'] = cmp.mapping(function()
      local suggestion = require('copilot.suggestion')

      if suggestion.is_visible() then
        suggestion.next()
      else
        suggestion.next()
      end
    end, {
      'i',
    }),
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip = '[Snippet]',
        buffer = '[Buffer]',
        path = '[Path]',
        -- copilot = '[Copilot]',
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    -- { name = 'copilot' },
    -- { name = 'otter' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'cmdline' },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
		},
    completion = {
      border = 'rounded',
    },
	},
  docs = {
    auto_open = true,
  },
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})

cmp.setup.filetype({ 'sql' }, {
  sources = {
    { name = 'vim-dadbod-completion' },
    { name = 'buffer' },
  },
})

-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim")

  use({
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  })

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "angkeith/telescope-terraform-doc.nvim" },
    },
  })

  use({
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
  })

  use({ "nvim-tree/nvim-web-devicons" })

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  })

  use({
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("startup").setup(require("rainer.wizard"))
    end
  })

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use("nvim-treesitter/playground")

  use("mbbill/undotree")

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    }
  })

  use({
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      local copilot = require("rainer.copilot")
    end,
    requires = {
      "nvim-lualine/lualine.nvim",
    },
  })
  -- use({
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- })

  use("Vimjas/vim-python-pep8-indent")

  -- use("Vigemus/iron.nvim")

  use("tpope/vim-commentary")
  use("tpope/vim-fugitive")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")

  use("sunaku/tmux-navigate")

  use({
    "jmbuhr/otter.nvim",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  })

  use("lucasprag/simpleblack")
  use({
    "catppuccin/nvim",
    as = "catppuccin",
  })
  use { "scottmckendry/cyberdream.nvim" }
  use("MunifTanjim/nui.nvim")
  use("rcarriga/nvim-notify")

  use({
    "folke/noice.nvim",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  })
  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  })
  use("Mofiqul/dracula.nvim")
  use("tpope/vim-dadbod")
  use("kristijanhusak/vim-dadbod-completion")
  use({
    "kristijanhusak/vim-dadbod-ui",
    requires = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    config = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  })

  use("itchyny/calendar.vim")
end)

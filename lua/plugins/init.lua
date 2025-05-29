return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require 'lspconfig'.clangd.setup{}
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", "rust", "c"
      },
      highlight = {
        enable = true,  -- Включаем подсветку синтаксиса
        disable = {},   -- Отключаем подсветку для других языков, если нужно
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require('nvim-tree').setup {
        git = {
          ignore = false,
        },
      }
    end,
  },
  
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {
        highlight = {
          TODO = { icon = "", color = "info", gui = "bold" },      -- TODO оранжевый
          FIX = { icon = "", color = "error", gui = "bold" },        -- FIXME красный
          NOTE = { icon = "", color = "hint", gui = "italic" },      -- NOTE голубой
          HACK = { icon = "", color = "warning", gui = "italic" },   -- HACK желтый
        },
      }
    end
  },
}


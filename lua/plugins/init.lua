return {
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup()
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      return require "configs.null-ls" -- load the options from a custom
      -- 'null-ls' config file
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "cmake-tools",
      },
    },
  },
  -- setup Syntax highlighters for specific languages using tree-sitter
  -- (i.e. this is equivalent of running `:TSInstall <language_name>`
  --        command in nvim`)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "python",
        "cpp",
        "make",
        "cmake",
        "rust",
        "dockerfile",
        "markdown",
        "markdown_inline",
        "cmake",
      },
    },
  },
  -- setup vim tmux navigator plugin
  -- (for seamlessly navigate between vim and tmux panes)
  {
    "christoomey/vim-tmux-navigator",
    lazy = false, -- always load this plugin
  },
}

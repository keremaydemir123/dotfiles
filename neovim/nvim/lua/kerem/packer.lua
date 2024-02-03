-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use "github/copilot.vim"
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'debugloop/telescope-undo.nvim' },
    }
  }
  use 'brenoprata10/nvim-highlight-colors'
  use 'folke/zen-mode.nvim'
  use { "akinsho/toggleterm.nvim", config = function()
    require("toggleterm").setup()
  end }
  use 'elentok/format-on-save.nvim'
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use 'nvim-treesitter/nvim-treesitter-textobjects' -- Additional textobjects for treesitter
  use {
    "ThePrimeagen/harpoon",
    requires = { { "nvim-lua/plenary.nvim" } }
  }
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end
  }
  use('sindrets/diffview.nvim')

  -- colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }
  use("ellisonleao/gruvbox.nvim")
  use('navarasu/onedark.nvim')
  use('folke/tokyonight.nvim')
  use({ 'craftzdog/solarized-osaka.nvim', as = "solorized-osaka" })
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use('onsails/lspkind.nvim')

  use('jose-elias-alvarez/null-ls.nvim')
  use 'windwp/nvim-ts-autotag'
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'numToStr/Comment.nvim'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add git related info in the signs columns and popups
  use 'kyazdani42/nvim-web-devicons'

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- stay in current windows (.http file) or change to results window (default)
        stay_in_current_window_after_split = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- table of curl `--write-out` variables or false if disabled
          -- for more granular control see Statistics Spec
          show_statistics = false,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
        search_back = true,
      })
    end
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = {
        "markdown" }
    end,
    ft = { "markdown" },
  })

  use('folke/flash.nvim')
end)

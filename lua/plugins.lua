vim.cmd([[
call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'


Plug 'akinsho/toggleterm.nvim'

Plug 'windwp/nvim-autopairs'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'stevearc/conform.nvim'
Plug 'zapling/mason-conform.nvim'


call plug#end()
]])

require("config.nvim-cmp")
require("config.mason")
require("config.nvim-treesitter")
require("config.toggleterm")
require("config.neo-tree")
require("config.telescope")
require("config.conform")

require("nvim-autopairs").setup {}
require("mason-conform").setup({})


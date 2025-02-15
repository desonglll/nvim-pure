vim.cmd([[
call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'


Plug 'akinsho/toggleterm.nvim'

Plug 'windwp/nvim-autopairs'

Plug 'nvim-telescope/telescope.nvim'

Plug 'stevearc/conform.nvim'
Plug 'zapling/mason-conform.nvim'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

call plug#end()
]])

vim.g.coq_settings = {
    auto_start = true, -- if you want to start COQ at startup
    -- Your COQ settings here
}

require("config.mason")
require("config.nvim-treesitter")
require("config.toggleterm")
require("config.neo-tree")
require("config.telescope")
require("config.conform")
require("nvim-autopairs").setup {}
require("mason-conform").setup({})

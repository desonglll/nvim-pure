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

Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

Plug 'folke/tokyonight.nvim'
Plug 'xiyaowong/transparent.nvim'

Plug 'chomosuke/typst-preview.nvim', {'tag': 'v1.*'}

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
require("nvim-autopairs").setup({})
require("mason-conform").setup({})

-- For bufferline
vim.cmd([[set termguicolors]])
vim.cmd.colorscheme("tokyonight")

require("bufferline").setup({})

-- Optional, you don't have to run setup.
require("transparent").setup({
	-- table: default groups
	groups = {
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLine",
		"CursorLineNr",
		"StatusLine",
		"StatusLineNC",
		"EndOfBuffer",
	},
	-- table: additional groups that should be cleared
	extra_groups = {},
	-- table: groups you don't want to clear
	exclude_groups = {},
	-- function: code to be executed after highlight groups are cleared
	-- Also the user event "TransparentClear" will be triggered
	on_clear = function() end,
})

require("tokyonight").setup({
	transparent = vim.g.transparent_enabled,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
	-- use the night style
	style = "night",
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = "#ff0000"
	end,
})

vim.api.nvim_set_keymap("n", "<leader>t", ":TransparentToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>p", function()
	require("typst-preview").preview()
end, { noremap = true, silent = true })

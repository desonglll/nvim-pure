require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		tsx = { "deno_fmt" },
		css = { "prettier" },
		svelte = { "prettier" },
		ruby = { "rubyfmt" },
	},
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})
vim.api.nvim_set_keymap(
	"n",
	"<leader>f",
	":lua require('conform').format({async = true})<CR>",
	{ noremap = true, silent = true }
)

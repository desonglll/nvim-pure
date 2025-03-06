local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local coq = require("coq")

-- 确保安装的 LSP
mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"ts_ls", -- 确保 TypeScript LSP 被安装
	},
})

-- 处理 LSP 配置
mason_lspconfig.setup_handlers({
	-- 默认 LSP 配置
	function(server_name)
		lspconfig[server_name].setup(coq.lsp_ensure_capabilities({}))
	end,

	-- TypeScript 专属配置
	["ts_ls"] = function()
		lspconfig.ts_ls.setup({
			filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		})
	end,
})

require("lspconfig")["tinymist"].setup({
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onType",
		semanticTokens = "disable",
	},
})

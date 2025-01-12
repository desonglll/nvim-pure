return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local is_aarch64 = vim.fn.system("uname -m"):match("aarch64") ~= nil

			local lsp_list = {
				-- unpack(is_aarch64 and {} or { "clangd" }), -- 如果是 armlinux，则不安装 clangd
				"lua_ls", -- For Lua
				"ts_ls",
				"bashls",
				-- "jdtls",
				-- auto install rust_analyzer
				"rust_analyzer"
			}
			require("mason-lspconfig").setup({
				ensure_installed = lsp_list,
				automatic_installation = true,
			})
			for _, lsp in ipairs(lsp_list) do
				require("lspconfig")[lsp].setup({
					on_attach = function(client, bufnr)
						-- 这里可以添加你的 LSP 相关设置
					end,
					flags = {
						debounce_text_changes = 150,
					},
					-- 可以在这里添加其他配置项
				})
			end
		end,
	}
}

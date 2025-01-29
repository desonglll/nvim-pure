require("mason-lspconfig").setup({
    automatic_installation = true, -- 启用自动安装
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "pyright"
    }
})


-- 获取所有可用的 LSP 服务器名称
local lsp_servers = require("mason-lspconfig").get_installed_servers()

-- 为每个已安装的 LSP 配置基础设置
for _, server_name in ipairs(lsp_servers) do
    require("lspconfig")[server_name].setup({})
end

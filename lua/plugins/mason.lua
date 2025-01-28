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
            -- 配置 Mason LSP 自动安装
            require("mason-lspconfig").setup({
                automatic_installation = true, -- 启用自动安装
            })

            -- 获取所有可用的 LSP 服务器名称
            local lsp_servers = require("mason-lspconfig").get_installed_servers()

            -- 为每个已安装的 LSP 配置基础设置
            for _, server_name in ipairs(lsp_servers) do
                require("lspconfig")[server_name].setup({})
            end
        end
    }
}

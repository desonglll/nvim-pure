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
                -- 特殊配置示例（可按需扩展）
                local server_opts = {
                    on_attach = function(client, bufnr)
                        -- 通用 LSP 绑定配置
                        local opts = { noremap = true, silent = true, buffer = bufnr }
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                        -- 更多绑定...
                    end,
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    flags = {
                        debounce_text_changes = 150,
                    }
                }

                -- 特定语言服务器的定制配置
                if server_name == "lua_ls" then
                    server_opts.settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                end

                -- 应用配置
                require("lspconfig")[server_name].setup(server_opts)
            end
        end
    }
}

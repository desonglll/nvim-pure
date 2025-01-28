return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        node_incremental = "v",
                        node_decremental = "V",
                    },
                },
                ensure_installed = {},
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                auto_install = true,
            })
        end,
    }
}

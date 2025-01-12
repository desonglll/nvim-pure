local wk = require("which-key")

local telescope = require("telescope.builtin")
wk.add({ -- Visual 模式下缩进代码

    { "jk",    "<ESC>",               desc = "Exit insert mode",                   mode = "i" },
    { "<c-w>", [[<C-\><C-n><C-w>]],   desc = "Exit terminal mode",                 mode = "t" },
    { "<",     "<gv",                 desc = "Indent left",                        mode = "v" },
    { ">",     ">gv",                 desc = "Indent right",                       mode = "v" },

    -- 上下移动选中文本
    { "J",     ":move '>+1<cr>gv-gv", desc = "Move selected text DOWN in context", mode = "v" },
    { "K",     ":move '<-2<cr>gv-gv", desc = "Move selected text UP in context",   mode = "v" },

    -- 保存文件
    { "<C-s>", ":w<CR>",              desc = "Save file",                          mode = "n" },
    { "<C-s>", "<C-c>:w<CR>",         desc = "Save file in visual mode",           mode = "v" },
    { "<C-s>", "<C-c>:w<CR>",         desc = "Save file in insert mode",           mode = "i" },
    {
        "<C-w>p",
        function()
            local picked_window_id = require("window-picker").pick_window()
            if picked_window_id then
                print("Pick: ", picked_window_id)
                vim.api.nvim_set_current_win(picked_window_id)
            end
        end,
        desc = "Pick window",
        mode = "n",
    },
    -- Tab switch
    {
        "<tab>",
        function()
            vim.api.nvim_command("tabnext")
        end,
        desc = "Switch to next tab",
        mode = { "n" },
    },
    {
        "<S-tab>",
        function()
            vim.api.nvim_command("tabprevious")
        end,
        desc = "Switch to previous tab",
        mode = { "n" },
    },

    -- Neotree 切换
    { "<space>e",  ":Neotree toggle<cr>",     desc = "Neotree toggle",                                mode = "n" },
    -- Symbols Outline切换
    { "<leader>t", ":SymbolsOutline<cr>",     desc = "SymbolsOutline toggle",                         mode = "n" },

    -- 跳转到诊断信息
    { "[d",        vim.diagnostic.goto_prev,  desc = "Go to previous diagnostic",                     mode = "n" },
    { "]d",        vim.diagnostic.goto_next,  desc = "Go to next diagnostic",                         mode = "n" },
    { "<M-d>",     vim.diagnostic.open_float, desc = "Open diagnostic float",                         mode = "n" },
    { "<M-cr>",    vim.lsp.buf.code_action,   desc = "Show code actions",                             mode = "n" },

    -- for telescope
    -- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers
    { "<space>f",  group = "File" },
    { "<space>ff", telescope.find_files,      desc = "Telescope find files",                          mode = "n" },
    { "<space>r",  telescope.oldfiles,        desc = "Lists previously open files",                   mode = "n" },
    { "<space>fh", telescope.help_tags,       desc = "Telescope help tags",                           mode = "n" },
    { "<space>s",  group = "Search" },
    { "<space>sg", telescope.live_grep,       desc = "Telescope live grep",                           mode = "n" },
    { "<space>sg", telescope.grep_string,     desc = "Telescope grep string",                         mode = "v" },
    { "<space>sb", telescope.buffers,         desc = "Lists open buffers in current neovim instance", mode = "n" },
    { "<space>sk", telescope.keymaps,         desc = "Search keymaps",                                mode = "n" },
    {
        "<space>sd",
        telescope.diagnostics,
        desc = "Lists diagnostics for all open buffers",
        mode = "n",
    },

    { "gd", telescope.lsp_definitions, desc = "LSP definitions", mode = "n", group = "Code Analyze" },
    -- for treesitter
    {
        "<space>ts",
        telescope.treesitter,
        desc = "Lists Function names, variables, from Treesitter!",
        mode = "n",
        group = "Code Analyze",
    },
    {
        "<leader>x",
        group = "Diagnostics",
    },
})

--keymap.set("n", "<space>fr", telescope.lsp_references, { desc = "Lists LSP references for word under the cursor" })

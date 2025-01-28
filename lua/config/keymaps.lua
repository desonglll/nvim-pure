-- Define key mappings using native Neovim API
local keymaps = {
    { "jk",    "<ESC>",               "Exit insert mode",                   "i" },
    { "<c-w>", [[<C-\\><C-n><C-w>]],  "Exit terminal mode",                 "t" },
    { "<",     "<gv",                 "Indent left",                        "v" },
    { ">",     ">gv",                 "Indent right",                       "v" },

    -- Move selected text up and down
    { "J",     ":move '>+1<cr>gv-gv", "Move selected text DOWN in context", "v" },
    { "K",     ":move '<-2<cr>gv-gv", "Move selected text UP in context",   "v" },

    -- Save file
    { "<C-s>", ":w<CR>",              "Save file",                          "n" },
    { "<C-s>", "<C-c>:w<CR>",         "Save file in visual mode",           "v" },
    { "<C-s>", "<C-c>:w<CR>",         "Save file in insert mode",           "i" },
}

-- Apply the key mappings
for _, map in ipairs(keymaps) do
    local lhs, rhs, desc, mode = map[1], map[2], map[3], map[4]
    vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

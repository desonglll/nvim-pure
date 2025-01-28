return {
    {
        "rmagatti/goto-preview",
        event = "BufEnter",
        config = function()
            require("goto-preview").setup({
                default_mappings = true,
            })
        end, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
        -- Default keybinddings.
        -- nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
        -- nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
        -- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
        -- nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
        -- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
        -- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
    }
}

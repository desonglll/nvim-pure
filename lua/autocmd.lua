vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local dir = vim.fn.expand("<afile>:p:h") -- 获取当前文件的目录路径
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p") -- 递归创建目录
        end
    end,
})


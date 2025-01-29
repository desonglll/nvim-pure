require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    -- 打开新终端后自动进入插入模式
    start_in_insert = true,
    -- 在当前buffer的下方打开新终端
    direction = "horizontal",
    -- 设置 float 的宽度和高度
    float_opts = {
        border = "curved",         -- 设置浮动窗口的边框样式，可以是 "single", "double", "shadow", 或者其他合法的边框样式
        width = 100,               -- 设置浮动窗口的宽度
        height = 30,               -- 设置浮动窗口的高度
        winblend = 3,              -- 设置浮动窗口的透明度，值范围是 0 到 100，0 表示完全透明，100 表示完全不透明
        highlights = {
            border = "Normal",     -- 设置边框的高亮颜色
            background = "Normal", -- 设置浮动窗口的背景颜色
        },
    },
})

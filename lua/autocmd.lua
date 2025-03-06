vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h") -- 获取当前文件的目录路径
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p") -- 递归创建目录
		end
	end,
})

vim.api.nvim_create_user_command("OpenPdf", function()
	local filepath = vim.api.nvim_buf_get_name(0)
	if filepath:match("%.typ$") then
		os.execute(
			string.format('open -a "/Applications/sioyek.app" ') .. vim.fn.shellescape(filepath:gsub("%.typ$", ".pdf"))
		)
		-- replace open with your preferred pdf viewer
		-- os.execute("zathura " .. vim.fn.shellescape(filepath:gsub("%.typ$", ".pdf")))
	end
end, {})

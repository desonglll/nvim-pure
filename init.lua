local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'

if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  -- 如果没有安装，执行安装命令
  print("vim-plug not found, installing...")
  vim.fn.system({
    'sh', '-c', 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  })
  -- 安装后重新加载配置，确保插件管理器可以使用
  vim.cmd('source ' .. vim.fn.expand('%:p'))
end
require("settings")
require("keymaps")
require("plugins")
require("autocmd")

## Ensure

ripgrep

unzip

nodejs(npm)

### Formatters

prettier

deno

## Delete cache files

```shell
rm -rf ~/.local/share/nvim ~/.local/state/nvim
```

## Install Vim-Plug

```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then

```shell
:TSInstall
```

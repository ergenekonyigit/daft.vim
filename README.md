daft.vim
========
Highly fast, powerful and customizable Vim distribution.

## Installation

After you backup your `~/.vimrc` file and `~/.vim/` folder (this is not important if you haven't used Vim before), you can install this by running this bash line, press enter if you see any error messages:

```bash
echo "runtime vimrc" > ~/.vimrc && mkdir ~/.vim && cd ~/.vim && git clone https://github.com/ergenekonyigit/daft.vim.git . && git clone https://github.com/junegunn/vim-plug.git ~/.vim/bundle/vim-plug && vim +PlugInstall
```

You're all set! Enjoy!

## monochrome - A dark Vim color scheme for your focused hacking sessions

### Look & Feel

`vim-monochrome` works in GUI/true-color terminals, as well as 256-color terminals:

<p align="center">
<img alt="Monochrome Vim color scheme" src="img/vim-monochrome.png"/>
</p>

The status line in the screenshot is
[lightline.vim](https://github.com/itchyny/lightline.vim) with the `nord` color
scheme, which is a great match.

### Installation

Installation depends on how you manage packages. For example, with
[vim-plug](https://github.com/junegunn/vim-plug) add

```
Plug 'fxn/vim-monochrome'
```

to your init file.

### Configuration

Just throw this to your _~/.vimrc_:

    colorscheme monochrome

Comments can optionally be rendered using italics:

    let g:monochrome_italic_comments = 1
    colorscheme monochrome

It is important that the flag is set before loading the theme.


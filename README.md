**nvim-word-highlight** is a neovim plugin to highlight current word
under the cursor in the file. If the current word is an existing file path it
can be opened directly via a key shortcut.

## Installation

 * **vim-plug**
    ```vim
    call plug#begin()
        Plug 'elfenpiff/nvim-word-highlight'
    call plug#end()
    ```

## Getting Started

After the installation the current word should be highlighted in the current
buffer. If it is an existing local path the file can be opened with `<leader> a`.

## Configuration

### Key binding

 * open the file under the cursor.
    ```vim
    nnoremap <leader>a :OpenPathUnderCursor<CR>
    ```

### Custom colors

 * word highlight by defining `NvimWordHighlight`.
    ```vim
    hi NvimWordHighlight guifg=green guibg=none gui=bold
    ```

 * path highlight by defining 'NvimWordHighlightPath'.
    ```vim
    hi NvimWordHighlightPath guifg=blue guibg=none gui=bold
    ```

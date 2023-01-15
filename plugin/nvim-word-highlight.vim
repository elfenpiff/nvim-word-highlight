" Title:        Word Highlight
" Description:  Highlights the current word/file path under the cursor. File path can be opened
"               directly via key shortcut.
" Maintainer:   elfenpiff <https://github.com/elfenpiff>

" Avoid loading the same plugin multiple times
if exists("g:loaded_nvim_word_highlight")
    finish
endif
let g:loaded_nvim_word_highlight = 1

exe "lua package.path = package.path .. ';/lua-?/init.lua'"

command! -nargs=0 HighlightWordUnderCursor lua require("nvim-word-highlight").highlight_word_under_cursor()
command! -nargs=0 OpenPathUnderCursor lua require("nvim-word-highlight").open_path_under_cursor()


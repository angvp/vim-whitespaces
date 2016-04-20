scriptencoding utf-8

if exists('loaded_plugin_vim_whitespaces') | finish | endif
let loaded_plugin_vim_whitespaces = 1

set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

function RemoveTrailingSpaces()
    let current_cursor_pos = getpos(".")
    :silent! %s/\\\@<!\s\+$//
    call setpos('.', current_cursor_pos)
endfunction

:autocmd BufWritePre * :call RemoveTrailingSpaces()

if exists('whitespaces_autostrip')
    :autocmd InsertLeave * :call RemoveTrailingSpaces()
endif

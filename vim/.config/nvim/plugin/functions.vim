" Toggle logic for neoformat - not every file should be formatted
" automatically
function! Autoformat()
    if !exists('b:autoformat_disable')
        let b:autoformat_disable = 0
    endif

    if b:autoformat_disable
        return
    endif

    if &readonly                         | return | endif
    if ! &modifiable                     | return | endif

    " Ignore error from undojoin: E790
    try
        undojoin
    catch /^Vim\%((\a\+)\)\=:E790/ |
    finally
        FormatWrite
    endtry
endfunction

function! AutoformatToggle()
    if !exists('b:autoformat_disable')
        let b:autoformat_disable = 0
    endif

    if b:autoformat_disable
        echomsg 'Autoformat: ENABLED'
        let b:autoformat_disable = 0
    else
        echomsg 'Autoformat: DISABLED'
        let b:autoformat_disable = 1
    endif
endfunction
command AutoformatToggle call AutoformatToggle()

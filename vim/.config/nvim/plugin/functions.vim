" Toggle logic for neoformat - not every file should be formatted
" automatically
function! MyNeoformat()
    if !exists('b:my_neoformat_disable')
        let b:my_neoformat_disable = 0
    endif

    if b:my_neoformat_disable
        return
    endif

    if &readonly                         | return | endif
    if ! &modifiable                     | return | endif

    " Ignore error from undojoin: E790
    try
        undojoin
    catch /^Vim\%((\a\+)\)\=:E790/ |
    finally
        Neoformat
    endtry
endfunction

function! NeoformatToggle()
    if !exists('b:my_neoformat_disable')
        let b:my_neoformat_disable = 0
    endif

    if b:my_neoformat_disable
        echomsg 'Neoformat: ENABLED'
        let b:my_neoformat_disable = 0
    else
        echomsg 'Neoformat: DISABLED'
        let b:my_neoformat_disable = 1
    endif
endfunction
command NeoformatToggle call NeoformatToggle()

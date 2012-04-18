"AUTHOR:   Atsushi Mizoue <asionfb@gmail.com>
"WEBSITE:  https://github.com/AtsushiM/findpath-edit.vim
"VERSION:  0.9
"LICENSE:  MIT

let s:save_cpo = &cpo
set cpo&vim

function! fpedit#Edit(...)
    let root = g:FPRoot()

    if a:0 == 0
        let a_path = ''
    else
        let a_path = a:000[0]
    endif

    if root != ''
        exec 'cd '.root

        if type(a_path) != 3
            let path = [a_path]
        else
            let path = a_path
        endif

        for e in path
            if e != ''
                let target = root.e.'/'
            else
                let target = root
            endif

            if filereadable(target) || isdirectory(target)
                if g:findpath_UseUnite == 0
                    exec 'e '.target
                else
                    exec 'Unite -input='.target.' file'
                endif

                break
            endif
        endfor
    endif
endfunction

function! fpedit#CD(...)
    let dir = g:FPRoot()
    exec 'cd '.dir

    if dir == ''
        return 0
    else
        if a:0 == 0
            let a_path = ''
        else
            let a_path = a:000[0]
        endif

        if type(a_path) != 3
            let path = [a_path]
        else
            let path = a_path
        endif

        for e in path
            if isdirectory(dir.'/'.e)
                let dir = dir.'/'.e
                break
            endif
        endfor

        exec 'cd '.dir
        pwd
        return 1
    endif
endfunction

let &cpo = s:save_cpo

"AUTHOR:   Atsushi Mizoue <asionfb@gmail.com>
"WEBSITE:  https://github.com/AtsushiM/findpath-edit.vim
"VERSION:  0.9
"LICENSE:  MIT

if exists("g:loaded_findpath_edit")
    finish
endif
let g:loaded_findpath_edit = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists("g:findpath_edit_DefaultJSDir")
    let g:findpath_edit_DefaultJSDir = ['js', 'javascript', 'javascripts']
endif
if !exists("g:findpath_edit_DefaultSASSDir")
    let g:findpath_edit_DefaultSASSDir = ['sass', 'scss']
endif
if !exists("g:findpath_edit_DefaultCSSDir")
    let g:findpath_edit_DefaultCSSDir = ['css', 'stylesheet']
endif

command! -nargs=? FPEdit call fpedit#Edit(<f-args>)
command! -nargs=? FPCD call fpedit#CD(<f-args>)

command! FPEditRoot call fpedit#Edit('')
command! FPEditSASS call fpedit#Edit(g:findpath_edit_DefaultSASSDir)
command! FPEditCSS call fpedit#Edit(g:findpath_edit_DefaultCSSDir)
command! FPEditJS call fpedit#Edit(g:findpath_edit_DefaultJSDir)

command! FPCDRoot call fpedit#CD('')
command! FPCDSASS call fpedit#CD(g:findpath_edit_DefaultSASSDir)
command! FPCDCSS call fpedit#CD(g:findpath_edit_DefaultCSSDir)
command! FPCDJS call fpedit#CD(g:findpath_edit_DefaultJSDir)

if !exists("g:findpath_edit_autocdroot")
    let g:findpath_edit_autocdroot = 0
endif
if g:findpath_edit_autocdroot == 1
    au BufReadPost * exec fpedit#CD() 
endif

let &cpo = s:save_cpo

" yuicompressor and closure-compiler and less and scss: 
" http://blog.othree.net/log/2009/12/26/javascript-on-vim/
let s:yui = executable('yuicompressor')
let s:ugl = executable('uglifyjs')
let s:clo = executable('closure-compiler')
let s:cof = executable('coffee')
let s:less = executable('lessc')
let s:sass = executable('sass')

function Fe_convert ()
    let cwd = expand('<afile>:p:h')
    let nam = expand('<afile>:t:r')
    let ext = expand('<afile>:e')
    let tnam = nam.b:tempext

    if exists('b:converter')
        cal system( b:converter.' '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.tnam.' &')
    endif

    if -1 == match(nam, "[\._]src$")
        let minfname = nam.".min".b:tempext
    else
        let minfname = substitute(nam, "[\._]src$", "", "g").b:tempext
    endif
    if filewritable(cwd.'/'.minfname) && exists('b:compressor')
        if exists('b:converter')
            cal system(b:converter.' '.cwd.'/'.nam.'.'.ext.' | '.b:compressor.' > '.cwd.'/'.minfname)
        else
            cal system('cat '.cwd.'/'.nam.'.'.ext.' | '.b:compressor.' > '.cwd.'/'.minfname)
        endif
    endif
endfunction

function Fe_js_setup ()
        if s:ugl
            let b:compressor = 'uglifyjs'
        elseif s:clo
            let b:compressor = 'closure-compiler --js'
        elseif s:yui
            let b:compressor = 'yuicompressor --type=js'
        endif
        let b:tempext = '.js'
endfunction

function Fe_css_setup ()
    if s:yui
        let b:compressor = 'yuicompressor --type=css'
    endif
    let b:tempext = '.css'
endfunction

if s:less
    autocmd BufNewFile,BufReadPre *.less let b:converter = 'lessc' | call Fe_css_setup()
    autocmd FileWritePost,BufWritePost *.less  call Fe_convert()
endif

if s:sass
    autocmd BufNewFile,BufReadPre *.scss let b:converter = 'sass' | call Fe_css_setup()
    autocmd FileWritePost,BufWritePost *.scss  call Fe_convert()
endif

if s:cof
    autocmd BufNewFile,BufReadPre *.coffee let b:converter = 'coffee -c -p' | call Fe_js_setup()
    autocmd FileWritePost,BufWritePost *.coffee call Fe_convert()
endif

if s:ugl || s:clo || s:yui
    autocmd BufNewFile,BufReadPre *.js call Fe_js_setup()
    autocmd FileWritePost,BufWritePost *.js  call Fe_convert()
endif

if s:yui
    autocmd BufNewFile,BufReadPre *.css call Fe_css_setup()
    autocmd FileWritePost,BufWritePost *.css :call Fe_convert()
endif

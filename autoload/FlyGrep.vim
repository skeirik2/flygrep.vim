function! FlyGrep#open(argv) abort
	call SpaceVim#plugins#flygrep#open(a:argv)
endfunction

function! FlyGrep#openFiles(...) abort
	if len(a:000) == 0
	  call FlyGrep#open({'files' : expand('%:p')})
	else
	  call FlyGrep#open({'files' : join(a:000)})
	endif
endfunction

function! FlyGrep#openDir(...) abort
	if len(a:000) == 0
	  call FlyGrep#open({'dir' : expand('%:p:h')})
	else
	  call FlyGrep#open({'dir' : a:0})
	endif
endfunction

function! FlyGrep#statusline() abort
    let st = ' FlyGrep %{getcwd()} '
    return st . "%{getline(1) ==# '' ? '' : (line('.') . '/' . line('$'))}"
endfunction

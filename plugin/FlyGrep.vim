"=============================================================================
" FlyGrep.vim --- Fly grep in vim
" Copyright (c) 2016-2017 Shidong Wang & Contributors
" Author: Shidong Wang < wsdjeg at 163.com >
" URL: https://github.com/wsdjeg/FlyGrep.vim
" License: MIT license
"=============================================================================

""
" @section Introduction, intro
" @stylized FlyGrep
" @library
" @order intro version dicts functions exceptions layers api faq
" Fly grep in vim, written in pure vim script for MacVim, gvim and vim version
" 8.0+.
"

""
" @section Configuration, config
" FlyGrep has strong default options, but you can also change the option
" yourself.

""
" FlyGrep will start to searching code after a delay; the default value is
" 500ms.
let g:FlyGrep_input_delay = 500

""
" A list of grepping tools will be consulted to perform the search. The first
" available executable in this list will be used. By default, the list
" contains: ['ag', 'rg', 'grep', 'pt', 'ack']
let g:FlyGrep_search_tools = ['ag', 'rg', 'grep', 'pt', 'ack']

""
" Enable FlyGrep statusline
let g:FlyGrep_enable_statusline = 1

""
" @section Usage, usage
" FlyGrep defines several commands by default:
" 1. FlyGrep - uses default tool with default arguments (usually to search in
"    current working directory)
" 2. FlyGrepBuffers - run grep tool on all files open in all buffers
" 3. FlyGrepDir - run grep tool on specified directory or the current working
"    directory if no argument is specified
" 4. FlyGrepFiles - run grep tool on specified files or the current file if
"    no argument is specified
"
command! -nargs=0                FlyGrep        call FlyGrep#open({}})
command! -nargs=0                FlyGrepBuffers call FlyGrep#open({'files' : '@buffers'})
command! -nargs=? -complete=dir  FlyGrepDir     call FlyGrep#openDir(<f-args>)
command! -nargs=* -complete=file FlyGrepFiles   call FlyGrep#openFiles(<f-args>)

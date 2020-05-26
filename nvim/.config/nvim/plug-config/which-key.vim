" === liuchengxu/vim-which-key' ===

let g:which_key_map = {}

" Default 1
" let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Operator

let g:which_key_map.w = {
  \ 'name' : '+windows'      ,
  \ 'w'    : ['<C-w>w'       , 'other-window']          ,
  \ 'q'    : ['<C-w>q'       , 'quit-window']           ,
  \ 'd'    : ['<C-w>q'       , 'quit-window']           ,
  \ '-'    : ['<C-w>s'       , 'split-window-below']    ,
  \ '|'    : ['<C-w>v'       , 'split-window-right']    ,
  \ '2'    : ['<C-w>v'       , 'layout-double-columns'] ,
  \ 'h'    : ['<C-w>h'       , 'window-left']           ,
  \ 'j'    : ['<C-w>j'       , 'window-below']          ,
  \ 'l'    : ['<C-w>l'       , 'window-right']          ,
  \ 'k'    : ['<C-w>k'       , 'window-up']             ,
  \ 'H'    : ['<C-w>5<'      , 'expand-window-left']    ,
  \ 'J'    : ['resize -5'    , 'expand-window-below']   ,
  \ 'L'    : ['<C-w>5>'      , 'expand-window-right']   ,
  \ 'K'    : ['resize +5'    , 'expand-window-up']      ,
  \ '='    : ['<C-w>='       , 'balance-window']        ,
  \ 's'    : ['<C-w>s'       , 'split-window-below']    ,
  \ 'v'    : ['<C-w>v'       , 'split-window-aside']    ,
  \ 'x'    : ['<C-w>x'       , 'flip-windows']          ,
  \ 'th'   : ['<C-w>t<C-w>H' , 'flip-horiz-to-vert']    ,
  \ 'tk'   : ['<C-w>t<C-w>K' , 'flip-vert-to-horiz']    ,
  \ '?'    : ['Windows'      , 'fzf-window']            ,
  \ }


let g:which_key_map.s = {
  \ 'name' : '+search' ,
  \ '/' : [':History/'     , 'history'],
  \ ';' : [':Commands'     , 'commands'],
  \ 'b' : [':BLines'       , 'current buffer'],
  \ 'B' : [':Buffers'      , 'open buffers'],
  \ 'c' : [':Commits'      , 'commits'],
  \ 'C' : [':BCommits'     , 'buffer commits'],
  \ 'f' : [':Files'        , 'files'],
  \ 'g' : [':GFiles'       , 'git files'],
  \ 'G' : [':GFiles?'      , 'modified git files'],
  \ 'h' : [':History'      , 'file history'],
  \ 'H' : [':History:'     , 'command history'],
  \ 'l' : [':Lines'        , 'lines'] ,
  \ 'm' : [':Marks'        , 'marks'] ,
  \ 'M' : [':Maps'         , 'normal maps'] ,
  \ 'p' : [':Helptags'     , 'help tags'] ,
  \ 'P' : [':Tags'         , 'project tags'],
  \ 's' : [':Snippets'     , 'snippets'],
  \ 'S' : [':Colors'       , 'color schemes'],
  \ 't' : [':Rg'           , 'text Rg'],
  \ 'T' : [':BTags'        , 'buffer tags'],
  \ 'w' : [':Windows'      , 'search windows'],
  \ 'y' : [':Filetypes'    , 'file types'],
  \ 'z' : [':FZF'          , 'FZF'],
\ }


" === mhinz/vim-startify === {{{

let g:which_key_map.S = {
  \ 'name' : '+startify'    ,
  \ 'S'    : [ ':Startify'  , 'start screen' ],
  \ 's'    : [ ':SSave'     , 'save sessions' ],
  \ 'l'    : [ ':SLoad'     , 'load sessions' ],
  \ 'd'    : [ ':SDelete'   , 'delete sessions' ],
  \ 'c'    : [ ':SClose'    , 'close sessions' ]
  \ }

" }}}

" === junegunn/fzf.vim === {{{

let g:which_key_map.f = {
  \ 'name' : '+FZF'    ,
  \ 'f'    : [ ':Files'     , 'Find file' ],
  \ 'b'    : [ ':Buffers'   , 'Find buffer' ],
  \ 'r'    : [ ':Rg'        , 'Find file with ripgrep' ],
  \ 't'    : [ ':Tags'      , 'Find tag' ],
  \ 'm'    : [ ':Marks'     , 'Find mark' ]
  \ }

" }}}


" === fvoldikss/vim-floatermloatterm === {{{

let g:which_key_map.t = {
  \ 'name' : '+terminal' ,
  \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
  \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
  \ 'g' : [':FloatermNew lazygit'                           , 'git'],
  \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
  \ 'j' : [':FloatermNew java'                              , 'jshell'],
  \ 'n' : [':FloatermNew node'                              , 'node'],
  \ 'p' : [':FloatermNew python'                            , 'python'],
  \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
  \ 't' : [':FloatermToggle'                                , 'toggle'],
  \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
  \ }

" }}}


" === vim-syntastic/syntastic === {{{

let g:which_key_map.y = {
  \ 'name'  : '+syntastic',
  \ 't'     : [':SyntasticToggleMode',  'Toggle mode between active/passive checker'],
  \ 'b'     : [':SyntasticCheck',       'run checker'],
  \ 'o'     : [':lopen',                'show error messages'],
  \ 'c'     : [':lclose',               'hide error messages'],
  \ 'n'     : [':lnext',                'go to next error'],
  \ 'p'     : [':lprevious',            'go to previous error'],
  \ }

" }}}

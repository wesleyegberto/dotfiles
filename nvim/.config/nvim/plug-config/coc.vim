" === neoclide/coc.nvim === {{{
let g:coc_global_extensions = [ 'coc-explorer', 'coc-actions', 'coc-snippets', 'coc-java', 'coc-omnisharp' ]

" Explorer
let g:coc_explorer_global_presets = {
  \   '.vim': {
  \      'root-uri': '~/.vim',
  \   },
  \   'floating': {
  \      'position': 'floating',
  \   },
  \   'floatingLeftside': {
  \      'position': 'floating',
  \      'floating-position': 'left-center',
  \      'floating-width': 50,
  \   },
  \   'floatingRightside': {
  \      'position': 'floating',
  \      'floating-position': 'left-center',
  \      'floating-width': 50,
  \   },
  \   'simplify': {
  \     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
  \   }
  \ }

" List all presets
nmap <Leader>el :CocList explPresets

" === coc-explorer ===
:nmap <Leader>e :CocCommand explorer<CR>
" Use preset argument to open it
nmap <Leader>E :CocCommand explorer --preset floating<CR>
nmap <Leader>ev :CocCommand explorer --preset .vim<CR>


inoremap <silent><expr> <c-space> coc#refresh()                       " use <c-space> to trigger completion

" colors
hi Pmenu      ctermbg=Gray  guibg=Gray  ctermfg=Black guifg=Black
hi PmenuSel   ctermbg=White guibg=White ctermfg=Black guifg=Black
hi PmenuThumb ctermbg=Black guibg=Black ctermfg=White guifg=White

" color for gruvbox
hi CocErrorHighlight    ctermfg=Red   guifg=#ff3333
hi CocErrorLine         ctermbg=DarkGray  guibg=#200000
" color for others
" hi CocErrorHighlight    ctermfg=Red   guifg=#000000
" hi CocErrorLine         ctermbg=DarkGray  guibg=#1C2117

hi CocErrorSign         ctermfg=Red   guifg=#ff1100
hi CocErrorVirtualText  ctermfg=Red   guifg=#ff1100
hi CocErrorFloat        ctermfg=Black guifg=#000000

hi CocWarningHighlight  ctermfg=Yellow guifg=#ff922b
hi CocWarningFloat      ctermfg=Yellow guifg=#ff922b
" hi CocWarningLine       ctermfg=Yellow guifg=#ff922b

augroup coc_commands
autocmd!

    " use <tab> for trigger completion and navigate to next complete item
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " close preview window when completion is done.
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

    " use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " remap keys for gotos
    autocmd FileType java nmap <silent> gd <Plug>(coc-definition)
    autocmd FileType java nmap <silent> gi <Plug>(coc-implementation)
    autocmd FileType java nmap <silent> gy <Plug>(coc-type-definition)
    autocmd FileType java nmap <silent> gr <Plug>(coc-references)

    " use `gh` to show documentation in preview window
    autocmd FileType java nnoremap <silent> gh :call <SID>show_documentation()<CR>
    autocmd FileType java nnoremap <silent> <Leader>cd :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " remap for rename current word
    autocmd FileType java nmap <Leader>crn <Plug>(coc-rename)

    " Remap for do codeAction of selected region, ex: `<Leader>camap` for current paragraph
    function! s:cocActionsOpenFromSelected(type) abort
      execute 'CocCommand actions.open ' . a:type
    endfunction

    " Remap for do codeAction of current line
    autocmd FileType java nmap <Leader>cal :CocCommand actions.open<CR>
    " code action for the selected content
    autocmd FileType java xnoremap <Leader>cas :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    " code action with motion
    autocmd FileType java nnoremap <Leader>cam :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

    " Fix autofix problem of current line
    autocmd FileType java nmap <Leader>qf  <Plug>(coc-fix-current)
    autocmd FileType java nmap <Leader>cqf  <Plug>(coc-fix-current)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Remap for format selected region
    autocmd FileType java nmap <Leader>cf :call CocAction('format')<CR>
    autocmd FileType java xmap <Leader>csf <Plug>(coc-format-selected)
    autocmd FileType java nmap <Leader>csf <Plug>(coc-format-selected)

    " Find symbol of current document
    autocmd FileType java nnoremap <Leader>cfm  :<C-u>CocList outline<cr>

    " Show all diagnostics
    autocmd FileType java nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    autocmd FileType java nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    autocmd FileType java nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Search workspace symbols
    autocmd FileType java nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

    " # coc-snippets
    " :CocList snippets
    " :CocCommand snippets.editSnippets
    " :CocCommand snippets.openSnippetFiles

    " Navigation between snippet placeholder
    let g:coc_snippet_next = '<c-n>'
    let g:coc_snippet_prev = '<c-p>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)

    inoremap <silent><expr> <TAB>
          \ pumvisible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

augroup END

" }}}
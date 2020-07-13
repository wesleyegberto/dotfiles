" === neoclide/coc.nvim === {{{
let g:coc_global_extensions = [ 'coc-explorer', 'coc-actions', 'coc-snippets', 'coc-java', 'coc-omnisharp', 'coc-tsserver' ]

" # coc-snippets
" :CocList snippets
" :CocCommand snippets.editSnippets
" :CocCommand snippets.openSnippetFiles

" # CocCommand for Java
" Update Java JDT.LS: `java.updateLanguageServer`
" Update project config: `java.projectConfiguration.update`
" Clean workspace: `java.clean.workspace`

" List all presets
" nmap <Leader>el :CocList explPresets<CR>

augroup coc_explorer
  autocmd!

  autocmd VimEnter * sil! au! FileExplorer *
  autocmd BufEnter * let d = expand('%') | if isdirectory(d) | bd | exe 'CocCommand explorer ' . d | endif

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

  " === coc-explorer ===
  nmap <Leader>e :CocCommand explorer<CR>
  " Use preset argument to open it
  nmap <Leader>E :CocCommand explorer --preset floating<CR>
  nmap <Leader>ev :CocCommand explorer --preset .vim<CR>

augroup END


" color for gruvbox
hi CocErrorHighlight    ctermfg=Red   guifg=#ff3333
hi CocErrorLine         ctermbg=DarkGray  guibg=#200000

" color for others themes
" hi CocErrorHighlight    ctermfg=Red   guifg=#000000
" hi CocErrorLine         ctermbg=DarkGray  guibg=#1C2117

hi CocErrorSign         ctermfg=Red   guifg=#ff1100
hi CocErrorVirtualText  ctermfg=Red   guifg=#ff1100
hi CocErrorFloat        ctermfg=Red guifg=#ff3838

hi CocWarningHighlight  ctermfg=Yellow guifg=#ff922b
hi CocWarningFloat      ctermfg=Yellow guifg=#ff922b
" hi CocWarningLine       ctermfg=Yellow guifg=#ff922b


augroup coc_commands
autocmd!

    inoremap <silent><expr> <c-space> coc#refresh()                       " use <c-space> to trigger completion

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
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gr <Plug>(coc-references)

    " use `gh` to show documentation in preview window
    nmap <silent> gh :call <SID>show_documentation()<CR>
    nmap <silent> <Leader>cd :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')


    " Remap for do codeAction of selected region, ex: `<Leader>camap` for current paragraph
    function! s:cocActionsOpenFromSelected(type) abort
      execute 'CocCommand actions.open ' . a:type
    endfunction


    " === Code actions ===
    " Remap for do codeAction of current line
    nnoremap <Leader>cal :CocCommand actions.open<CR>
    " code action for the selected content
    xnoremap <Leader>cas :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    " code action with motion
    nnoremap <Leader>cam :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

    " Fix autofix problem of current line
    autocmd FileType java nmap <Leader>cqf <Plug>(coc-fix-current)

    autocmd FileType typescript nmap <Leader>cqf :CocCommand tsserver.executeAutoFix<CR>


    " === Refactoring ===
    " remap for rename current word
    nmap <Leader>crn <Plug>(coc-rename)


    " === Source code ===
    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Find symbol/member of current document
    nnoremap <Leader>cfm  :<C-u>CocList outline<cr>

    " Remap for format selected region
    nnoremap <Leader>cf :call CocAction('format')<CR>
    xnoremap <Leader>csf <Plug>(coc-format-selected)
    nnoremap <Leader>csf <Plug>(coc-format-selected)


    " === Snippets ===
    " Navigation between snippet placeholder
    let g:coc_snippet_next = '<c-n>'
    let g:coc_snippet_prev = '<c-p>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    inoremap <C-j> <Plug>(coc-snippets-expand-jump)

    inoremap <silent><expr> <TAB>
          \ pumvisible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction


    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
augroup END

" }}}
" === OmniSharp/omnisharp-vim ===

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'

let g:OmniSharp_highlight_types = 3

" Fetch full documentation during omnicomplete requests (:OmniSharpDocumentation command)
let g:omnicomplete_fetch_full_documentation = 1

" Enable snippet completion
let g:OmniSharp_want_snippet=1

augroup csharp_commands
autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> gi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> gD :OmniSharpPreviewDefinition<CR>
    autocmd FileType cs nnoremap <buffer> gI :OmniSharpPreviewImplementation<CR>
    autocmd FileType cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>cfs :OmniSharpFindSymbol<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>cfm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> gh :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>cod :OmniSharpDocumentation<CR>

    autocmd FileType cs inoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>cqf :OmniSharpFixUsings<CR>

    " Rename with dialog
    autocmd FileType cs nnoremap <Leader>corn :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <F2> :OmniSharpRename<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>

    autocmd FileType cs nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs nnoremap <Leader>cal :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs xnoremap <Leader>cal :call OmniSharp#GetCodeActions('visual')<CR>

    " Start the omnisharp server for the current solution
    autocmd FileType cs nnoremap <Leader>css :OmniSharpStartServer<CR>
    autocmd FileType cs nnoremap <Leader>csr :OmniSharpRestartServer<CR>
    autocmd FileType cs nnoremap <Leader>csp :OmniSharpStopServer<CR>

augroup END
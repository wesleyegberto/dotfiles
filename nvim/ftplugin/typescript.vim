setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

nnoremap <silent> <Leader>pm  :Telescope langtools picker<CR>
nnoremap <silent> <Leader>pc  :Telescope langtools clean<CR>
nnoremap <silent> <Leader>pb  :Telescope langtools build<CR>
nnoremap <silent> <Leader>pta :Telescope langtools test<CR>
nnoremap <silent> <Leader>ptf :Telescope langtools test_file<CR>

lua require('telescope').load_extension('langtools')
lua require('telescope._extensions.langtools').setup({ language = 'node' })

setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

lua require('telescope').load_extension('langtools')
lua require('telescope._extensions.langtools').setup({ language = 'python' })

nnoremap <silent> <Leader>pm  :Telescope langtools picker<CR>
nnoremap <silent> <Leader>pb  :Telescope langtools build<CR>
nnoremap <silent> <Leader>pta :Telescope langtools test<CR>
nnoremap <silent> <Leader>ptf :Telescope langtools test_file<CR>
nnoremap <silent> <Leader>ptl :Telescope langtools test_last_file<CR>


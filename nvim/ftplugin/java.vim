setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

setlocal path=.,src/main/java/**,src/test/java/**,**/src/main/java/**,**/src/test/java/**
setlocal include=^\s*import
setlocal includeexpr=substitute(v:fname,'\\.','/','g')

nnoremap <silent> <Leader>pm  :Telescope langtools picker<CR>
nnoremap <silent> <Leader>pc  :Telescope langtools clean<CR>
nnoremap <silent> <Leader>pb  :Telescope langtools build<CR>
nnoremap <silent> <Leader>pp  :Telescope langtools package<CR>
nnoremap <silent> <Leader>pta :Telescope langtools test<CR>
nnoremap <silent> <Leader>ptf :Telescope langtools test_file<CR>

" lua require('telescope').load_extension('langtools')
lua require('telescope._extension.langtools').setup({ language = 'java' })

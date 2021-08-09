setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

setlocal path=.,src/main/java/**,src/test/java/**,**/src/main/java/**,**/src/test/java/**
setlocal include=^\s*import
setlocal includeexpr=substitute(v:fname,'\\.','/','g')

lua require('telescope').load_extension('langtools')
nnoremap <Leader>pm :Telescope langtools maven<CR>
nnoremap <Leader>pc :Telescope langtools maven_clean<CR>
nnoremap <Leader>pb :Telescope langtools maven_build<CR>
nnoremap <Leader>pp :Telescope langtools maven_package<CR>
nnoremap <Leader>pt :Telescope langtools maven_test<CR>

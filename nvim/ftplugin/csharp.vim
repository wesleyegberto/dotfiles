setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

source $HOME/.config/nvim/plug-config/omnisharp.vim

lua require('telescope').load_extension('langtools')
lua require('telescope._extensions.langtools').setup({ language = 'dotnet' })

nnoremap <silent> <Leader>pm :Telescope langtools picker<CR>
nnoremap <silent> <Leader>pc :Telescope langtools clean<CR>
nnoremap <silent> <Leader>pb :Telescope langtools build<CR>
nnoremap <silent> <Leader>pp :Telescope langtools package<CR>
nnoremap <silent> <Leader>pt :Telescope langtools test<CR>

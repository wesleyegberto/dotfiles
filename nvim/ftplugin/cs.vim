setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

source $HOME/.config/nvim/plug-config/omnisharp.vim

lua require('telescope').load_extension('langtools')
nnoremap <Leader>pm :Telescope langtools dotnet<CR>
nnoremap <Leader>pc :Telescope langtools dotnet_clean<CR>
nnoremap <Leader>pb :Telescope langtools dotnet_build<CR>
nnoremap <Leader>pp :Telescope langtools dotnet_package<CR>
nnoremap <Leader>pt :Telescope langtools dotnet_test<CR>

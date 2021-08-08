setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

setlocal path=.,src/main/java/**,src/test/java/**,**/src/main/java/**,**/src/test/java/**
setlocal include=^\s*import
setlocal includeexpr=substitute(v:fname,'\\.','/','g')

" set file syntax to markdown for .md file ending
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
" trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

augroup yaml_syntax 
    au FileType yaml set tabstop=2 
    au FileType yaml set shiftwidth=2 
    au FileType yaml set softtabstop=2
    au FileType yaml set foldnestmax=10
    " au FileType yaml set foldlevel=2   
    au FileType yaml set foldmethod=manual
augroup END

augroup dockerfile_syntax 
    au! BufNewFile,BufFilePre,BufRead dockerfile,Dockerfile,dockerfile.*,Dockerfile.* set filetype=Dockerfile
augroup END


augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

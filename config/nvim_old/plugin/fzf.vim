if executable('rg')

    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    let $FZF_DEFAULT_OPTS='--height 40% --layout=reverse '
    let g:rg_derive_root='true'
    let g:fzf_buffers_jump = 1
    let g:fzf_tags_command = 'ctags -R'
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif



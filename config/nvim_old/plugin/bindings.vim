" ============
" KEY BINDINGS
" ============


" WindowManagement
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>

nnoremap <leader>wd :q<CR>
nnoremap <leader>wo <C-w>o

nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>

" Buffers
nnoremap <leader>bd :bd<CR>
" nnoremap <leader>bb :Buffers <CR>
nnoremap <leader>bb <cmd>Telescope buffers theme=get_dropdown<cr>
nnoremap <leader>/ <cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown<cr>
" nnoremap <leader>/  :BLines <CR>


nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>



" Files
" nnoremap <leader>ff :Files<CR>
" nnoremap <leader>ff :Telescope find_files find_command=rg,--hidden,--files <cr>
nnoremap <leader>ff :lua require("telescope.builtin").find_files({ hidden = true})<cr>
nnoremap <leader>ec :lua require('johann.telescope').search_dotfiles()<cr>
nnoremap <leader>nd :lua require("johann.telescope").search_notes()<cr>
nnoremap <leader>of :Telescope file_browser<cr>

nnoremap <leader>ft :Vexplore<CR>
nnoremap <leader>o- :Explore<CR>


nnoremap <silent> <leader>y% :let @+=expand("%:p")<CR>



"  Grep *
" nnoremap <leader>* :Rg <CR>
nnoremap <leader>* <cmd>Telescope live_grep theme=get_dropdown<cr>

" Commandhistory
" nnoremap <leader>ch :History:<CR>
nnoremap <leader>ch <cmd>Telescope command_history theme=get_dropdown<cr>

" COC
nmap <leader>gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition) nmap <silent> gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" Snippets and complemtions
" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <c-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


" " Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" GIT
" nnoremap <silent> <leader>gg :G<CR>
nnoremap <silent> <leader>gg :Git<CR>
nnoremap <silent> <leader>ga :Git add %<CR>
" nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>gb :Telescope git_branches theme=get_dropdown<CR>
nnoremap <leader>g<space> :Git 

nnoremap <silent> <leader>gl :Telescope git_commits theme=get_dropdown<CR>

" make diffs a bit easier
" For 3-way merges
nnoremap <leader>gu :diffupdate<CR>
nnoremap <leader>nd :NV<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gj :diffget //3<CR>

" For simple 2-way merge
nnoremap <leader>gs :diffput //0<CR>


" terminal 
nnoremap <leader>sh :term<CR>
tnoremap <Esc> <C-\><C-n>


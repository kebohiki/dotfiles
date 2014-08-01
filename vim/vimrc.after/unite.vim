let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --smart-case --ignore=*.meta'
let g:unite_source_grep_recursive_opt = ''

let g:unite_quick_match_table =
      \ get(g:, 'unite_quick_match_table', {
      \ 'a' : 0, 'o' : 1, 'e' : 2, 'u' : 3, 'i' : 4, 'd' : 5, 'h' : 6, 't' : 7, 'n' : 8, 's' : 9,
      \ 'p' : 10, 'y' : 11, 'f' : 12, 'g' : 13, 'c' : 14, 'r' : 15, 'l' : 16, 'q' : 17, 'j' : 18, 'k' : 19,
      \ 'x' : 20, 'b' : 21, 'm' : 22, 'w' : 23, 'v' : 24, 'z' : 25
      \ })

call unite#custom#source(
    \ 'file_rec/async,file_rec', 'matchers',
    \ ['converter_tail', 'matcher_default'])
call unite#custom#source(
    \ 'file_rec/async,file_rec', 'converters',
    \ ['converter_file_directory'])
call unite#custom#source('file,file/new,buffer',
    \ 'matchersers', 'matcher_fuzzy')
call unite#filters#sorter_default#use(['sorter_rank'])

" http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html
" http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
" -auto-preview

" Note: <C-u> here can remove range
let g:unite_source_history_yank_enable = 1
"nnoremap ,p :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap ,p :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async<cr>
nnoremap ,' :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap ,, :<C-u>Unite -no-split -buffer-name=buffer  -quick-match buffer<cr>
nnoremap ,r :<C-u>Unite -no-split -buffer-name=register  register<cr>

"Not really using
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-d>   <Plug>(unite_exit)
  nmap <buffer> <C-d>   <Plug>(unite_exit)
  nmap <buffer> <BS>    <Plug>(unite_exit)
endfunction

" For searching the word in the cursor in the current directory,
noremap <silent> ,. :Unite grep:.:<CR>
" For searching the word in the cursor in the current buffer,
noremap <silent> ,f :Unite grep:.:<CR><C-r><C-w><CR>

" For searching the word in the cursor in all opened buffer
" noremap <silent> <Leader>sa :Unite grep:$buffers::<C-r><C-w><CR>


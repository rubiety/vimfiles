"--- NERDTree ---

let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '^tags$']
nnoremap <silent> <Leader>tt :NERDTreeToggle<CR>
" Open the nerd tree window first, in CWD, so the find doesn't change
" the tree root.
nnoremap <silent> <Leader>tf :NERDTree<CR><C-w>p:NERDTreeFind<CR>
" Auto-change cwd when changing tree root
let NERDTreeChDirMode=2
" Close vim if the only window left open is a NERDTree
augroup local
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

"--- Ctrl-P ---

set runtimepath^=~/.vim/bundle/ctrlp

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"--- NERDCommenter ---

" NERDCommenter already provides mappings. The best one to use is probably
" <Leader>cl and <Leader>cu.

"--- FormatComment

noremap <Leader>qc :call FormatComment()<CR>

"--- indentLines ---

let g:indentLine_char = '¦'
let g:indentLine_color_term = 237

"--- coffee-script ---

hi link coffeeObject NONE
hi link coffeeBracket NONE
hi link coffeeCurly NONE
hi link coffeeParen NONE
hi link coffeeSpecialOp NONE

" coffee-script highlights operators and stuff, it's really annoying
hi clear Operator
hi clear SpecialOp

"--- powerline ---

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"let g:Powerline_symbols = 'fancy'
set laststatus=2   " otherwise the powerline only appears for split windows
set noshowmode     " hide default mode text (-- INSERT -- below status line)
"silent! PowerlineReloadColorscheme

"--- ShowMarks ---

hi default ShowMarksHLl cterm=bold ctermfg=darkblue ctermbg=233 "gui=bold guifg=blue guibg=lightblue
hi default ShowMarksHLu cterm=bold ctermfg=darkblue ctermbg=233 "gui=bold guifg=blue guibg=lightblue
hi default ShowMarksHLo cterm=bold ctermfg=darkblue ctermbg=233 "gui=bold guifg=blue guibg=lightblue
hi default ShowMarksHLm cterm=bold ctermfg=darkblue ctermbg=233 "gui=bold guifg=blue guibg=lightblue

"--- vroom

let g:vroom_map_keys = 0
let g:vroom_spec_command = 'zeus rspec '
let g:vroom_use_bundle_exec = 0
let g:vroom_clear_screen = 0
let g:vroom_use_vimux = 1
nnoremap <Leader>ta :VroomRunTestFile<CR>
nnoremap <Leader>tn :VroomRunNearestTest<CR>

"--- splitjoin

let g:splitjoin_ruby_curly_braces = 0

"--- vim-session

let g:session_autosave = 'yes'
let g:session_autosave_periodic = 10
let g:session_autoload = 'yes'
let g:session_default_to_last = 'yes'
nnoremap <Leader>ss :SaveSession<CR>
nnoremap <Leader>so :OpenSession<CR>
nnoremap <Leader>sr :RestartVim<CR>

"--- vim-ruby
"
let g:ruby_no_hanging_indent = 1

"--- vim-flavored-markdown

augroup local
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown | setlocal textwidth=80
augroup END

"--- vim-slim ---

augroup local
  autocmd FileType slim setl nosmartindent
augroup END

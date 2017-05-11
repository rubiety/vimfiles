"--- NERDTree ---

let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

" Auto-change cwd when changing tree root
"let NERDTreeChDirMode=2

nnoremap <silent> <Leader>tt :NERDTreeToggle<CR>

" <Leader>tf will tell NERDTree to highlight the file that's currently open.
" The way this works, we open the NERDTree window first in the CWD, so the find
" command afterward doesn't change the tree root.
nnoremap <silent> <Leader>tf :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" Close vim if the only window left open is a NERDTree
augroup local
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END


"--- Ctrl-P ---

set runtimepath^=~/.vim/bundle/ctrlp

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20
" Use the cwd for CtrlP's working path, not the directory of the open file
let g:ctrlp_working_path_mode = 'w'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

noremap <Leader>pt :CtrlPTag<CR>

"--- Ack.vim ---

" Actually use Ag for doing the searching instead of Ack
let g:ackprg = 'ag --vimgrep'
" Don't jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

"--- NERDCommenter ---

let g:NERDCustomDelimiters = {
      \ 'ruby': { 'left': '# ' }
      \ }

"--- indentLines ---

let g:indentLine_char = '¦'
let g:indentLine_color_term = 10

"--- coffee-script ---

hi link coffeeObject NONE
hi link coffeeBracket NONE
hi link coffeeCurly NONE
hi link coffeeParen NONE
hi link coffeeSpecialOp NONE

" coffee-script highlights operators and stuff, it's really annoying
hi clear Operator
hi clear SpecialOp

" path to coffee
let coffee_compiler = '/usr/local/bin/coffee'

"--- Airline ---

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols_branch = ''
let g:airline_symbols_readonly = ''
let g:airline_symbols_linenr = ''
set laststatus=2   " otherwise the airline only appears for split windows
set noshowmode     " hide default mode text (-- INSERT -- below status line)

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
let g:splitjoin_ruby_hanging_args = 0

"--- vim-session

let g:session_autosave = 'yes'
let g:session_autosave_periodic = 10
let g:session_autoload = 'yes'
let g:session_default_to_last = 'yes'
" Conflicts: nnoremap <Leader>ss :SaveSession<CR>
" Conflicts: nnoremap <Leader>so :OpenSession<CR>
" Conflicts: nnoremap <Leader>sr :RestartVim<CR>

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

" --- vim-tmux-runner ---

let g:VtrClearSequence = "clear"
nmap <leader>o :VtrOpenRunner({'orientation': 'h', 'percentage': 35})<CR>

"--- vim-spec-runner ---

let g:spec_runner_dispatcher = 'call VtrSendCommand("bundle exec {command}")'
let g:disable_write_on_spec_run = 1
map <leader>t <plug>RunCurrentSpecFile
" Conflicting: map <leader>s <plug>RunFocusedSpec
map <leader>l <plug>RunMostRecentSpec

"--- rainbow_parentheses

augroup local
  autocmd VimEnter ruby,clojure RainbowParenthesesToggle
  autocmd Syntax   ruby,clojure RainbowParenthesesLoadRound
  autocmd Syntax   ruby,clojure RainbowParenthesesLoadSquare
  autocmd Syntax   ruby,clojure RainbowParenthesesLoadBraces
augroup END

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ]

"--- vim-sexp

" No auto-pairs, thank you
let g:sexp_enable_insert_mode_mappings = 0

"--- Neomake
" Disabling for now - may be causing performance issues:
" let g:neomake_error_sign = {'text': 'x'}
" let g:neomake_warning_sign = {'text': '!'}
" let g:neomake_message_sign = {'text': 'i'}
" let g:neomake_javascript_enabled_makers = ['eslint']
" 
" autocmd! BufWritePost * Neomake

"-- auto-pairs

let g:AutoPairs = {}
let g:AutoPairsShortcutToggle = "<Leader>apt"
let g:AutoPairsShortcutFastWrap = "<Leader>apw"
let g:AutoPairsShortcutJump = "<Leader>apj"
let g:AutoPairsShortcutBackInsert = "<C-n>"

"-- vim-tmux-navigator

" Define these manually so that when this file is re-sourced,
" these mappings do not mysteriously go away

let g:tmux_navigator_no_mappings = 1

nmap <silent> <C-h> :TmuxNavigateLeft<cr>
nmap <silent> <C-j> :TmuxNavigateDown<cr>
nmap <silent> <C-k> :TmuxNavigateUp<cr>
nmap <silent> <C-l> :TmuxNavigateRight<cr>

"--- Limelight

" TODO: Fix this color
let g:limelight_conceal_ctermfg = 239

"--- vim-togglecursor

let g:togglecursor_default = 'block'
let g:togglecursor_insert = 'line'
let g:togglecursor_leave = 'block'

"--- vim-snipmate

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-2.0'

"--- ruby_bashrockets

command! -range HashrocketStyle :<line1>,<line2>Bashrockets
command! -range KeywordArgumentStyle :<line1>,<line2>Hashrockets

"--- Colorizer

let g:colorizer_auto_filetype = 'scss'
let g:colorizer_skip_comments = 1

"--- vim-jsx

let g:jsx_ext_required = 0

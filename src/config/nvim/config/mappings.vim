" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Easy way to reload config
nmap <Leader>rv :source ~/.config/nvim/init.vim<CR>

" Paste mode (because sometimes I am lazy)
set pastetoggle=<F3>

" Window movement
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-_> <C-w>_

" Easy and fast tab movement
nnoremap tn :tabnew<CR>
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt
nnoremap t6 6gt
nnoremap t7 7gt
nnoremap t8 8gt
nnoremap t9 :tablast<CR>

" pressing < and > in visual mode keeps the selection
vnoremap < <gv
vnoremap > >gv

" Map Q to something useful
noremap Q gq

" Make Y consistent with C and D
nnoremap Y y$

" I hit this way too often, let's just no-op it
noremap K <Esc>

" Make ,h clear the highlight as well as redraw
nnoremap <C-\> :nohls<CR>
inoremap <C-\> <C-O>:nohls<CR>

" For Those People who don't have Caps Lock set to Escape
imap jj <Esc>
imap jk <Esc>

" Buffer Management
noremap <Leader>q :q<CR>
noremap <Leader>w :w<CR>
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
noremap <Leader>tc :tabc

" File Finding
map <C-n> :cn<CR>
map <C-m> :cp<CR>

" Easy Splits
noremap <Leader>v :vsplit<CR>
noremap <Leader>s :split<CR>

" Paste overwriting everything to the end of the line ($)
nmap <Leader>p$ "_Dp
" Open (o) a new line and paste into it
nmap <Leader>po o<Space><Backspace><Esc>p
" Paste overwriting the current (c) line
nmap <Leader>pc "_ddP
" Paste overwriting the current/next word (w)
nmap <Leader>pw viw"_dP
" Select last pasted text
nnoremap gp `[v`]

" Join comments so we can easily apply gqc
vmap <Leader>jc :s/\v[\n ]+#[ ]+/ /g<CR>:nohls<CR>i<Space>#<Space><Esc>
" A form of gqc that joins the selected comment lines first
vmap <Leader>gqc <Leader>jc<S-V>gqc
" Format paragraphs too
nmap <Leader>gqp vipQ$

" Quick way to close tabs
nmap <Leader>tc :tabc<CR>


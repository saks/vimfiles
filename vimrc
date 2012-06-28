set nocompatible               " be iMproved

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

silent! runtime bundles.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------

filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
syntax enable

"russian langmap setup
set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,б\\,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<,Ю\>,Ё\~

" remember folding
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview


"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------

set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest

" Show $ at end of line and trailing space as ~
set lcs=tab:▸\ ,eol:¬,trail:.,extends:>,precedes:<

set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

set nocursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set wrap
set textwidth=79
set formatoptions=n
set colorcolumn=100


" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

  " Treat .thor files as Ruby
  autocmd BufNewFile,BufRead *.thor setfiletype ruby

  " Thorfile, Rakefile and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} set ft=ruby


  autocmd BufNewFile,BufRead *.scss setfiletype css
  autocmd BufNewFile,BufRead *.coffee setfiletype coffee

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

  " set filetype for json file to javascript
  autocmd BufNewFile,BufRead *.json setfiletype javascript
  autocmd BufNewFile,BufRead *_spec.rb setfiletype ruby
endif

"  ---------------------------------------------------------------------------
"  Status Line
"  ---------------------------------------------------------------------------

" set statusline=%F%m%r%h%w[%L]%y[%p%%][%04v][%{fugitive#statusline()}]

" RVM status line
" set statusline+=%{rvm#statusline()}

"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------
"

" saksmlz specific:

" open tag definition (ctags) in new tab instead of new buffer:
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" CTRL+S saves the buffer
nmap <C-s> :w<CR>


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>


" Shift+Insert will paste from system buffer (Control+C)
cmap <S-Insert>		<C-R>+
exe 'inoremap <script> <S-Insert>' paste#paste_cmd['i']


" Text indentation with Alt+[ and so on
nmap <M-Left> <<
nmap <M-Right> >>
vmap <M-Left> <gv
vmap <M-Right> >gv
nmap <M-h> <<
nmap <M-l> >>
vmap <M-h> <gv
vmap <M-l> >gv


" Switch between buffers
" map <M-1> :b1<CR>
" map <M-2> :b2<CR>
" map <M-3> :b3<CR>
" map <M-4> :b4<CR>
" map <M-5> :b5<CR>
" map <M-6> :b6<CR>
" map <M-7> :b7<CR>
" map <M-8> :b8<CR>
" map <M-9> :b9<CR>
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt

" Next/Previous tab
" map <M-.> :bn<CR>
" map <M-,> :bp<CR>
map <M-.> :tabnext<CR>
map <M-,> :tabprevious<CR>


" Text movimg with plugin unimpaired.vim
" Bubble single lines
nmap <M-k> [e
nmap <M-j> ]e
nmap <M-Up> [e
nmap <M-Down> ]e

" Bubble multiple lines
vmap <M-k> [egv
vmap <M-j> ]egv
vmap <M-Up> [egv
vmap <M-Down> ]egv


" Clear highlighting
map <C-space> :nohl <cr>

" Searching / moving
" nnoremap / /\\v
" vnoremap / /\\v
set ignorecase
" ignore folllowing files
set wildignore+=*.bak,*~,*.tmp,*.backup,*swp,*.o,*.obj,.git,*.rbc,*.png,*.xpi
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set mat=5  " Bracket blinking.

" Center screen when scrolling search results
" nmap n nzz
" nmap N Nzz

imap <C-h> <ESC>^
imap <C-l> <ESC>$

" Turn off arrow keys (this might not be a good idea for beginners, but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

" Map ESC
imap jj <ESC>

" ACK
set grepprg=ack

" ,a to Ack (search in files)
nnoremap <leader>a :Ack


" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines up and down
" map <C-J> :m +1 <CR>
" map <C-K> :m -2 <CR>

" close buffer
nmap <leader>d :bd<CR>
" close all buffers
nmap <leader>D :bufdo bd<CR>

" Switch between last two buffers
nnoremap <leader><leader> <c-^>

" Edit/View files relative to current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Saving and exit
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>


" EXTERNAL COPY / PASTE
" Press F2 before and after pasting from an external Window, not required for
" MacVim
set pastetoggle=<F2>
map <C-v> "+gP<CR>
vmap <C-c> "+y

"  ---------------------------------------------------------------------------
"  Function Keys
"  ---------------------------------------------------------------------------

" F2 - Terminal
map <F2> :ConqueTerm zsh<CR>

" F3 - YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" GPicker settings
let g:gpicker_edit_cmd = "tabedit"
nnoremap <M-o> :GPickFile<CR>
vnoremap <M-o> :GPickFile<CR>


" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Buffer window (find file in open buffers)
nmap <silent> <leader>b :FufBuffer<CR>

let my_home = expand("$HOME/")

if filereadable(my_home . '.vim/bundle/vim-autocorrect/autocorrect.vim')
  source ~/.vim/bundle/vim-autocorrect/autocorrect.vim
endif

" BLAAAME
vmap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p<CR>

" Tabularize
if exists(":Tab")
  nmap <leader>a\| :Tab /\|<CR>
  vmap <leader>a\| :Tab /\|<CR>
  nmap <leader>a= :Tab /=<CR>
  vmap <leader>a= :Tab /=<CR>
  nmap <leader>a: :Tab /:\zs<CR>
  vmap <leader>a: :Tab /:\zs<CR>
endif

let g:cssColorVimDoNotMessMyUpdatetime = 1

" Easy commenting
nnoremap <M-/> :TComment<CR>
vnoremap <M-/> :TComment<CR>

" Supertab
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabDefaultCompletionType = "user"
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

"  ---------------------------------------------------------------------------
"  Ruby/Rails
"  ---------------------------------------------------------------------------

" Skip to Models and Views
map <Leader>m :Rmodel
map <Leader>v :Rview

"  ---------------------------------------------------------------------------
"  GUI
"  ---------------------------------------------------------------------------

if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA
  set mouse=v
  set guifont=Monaco\ 10
endif
set guifont=Monaco\ 10

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------

set backupdir=~/.vim/tmp,~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=.hg --exclude=tmp --exclude=vendor/assets --exclude=public --exclude=app/assets --exclude=log -R *<CR><CR>


" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/sh

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc


colorscheme railscasts

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

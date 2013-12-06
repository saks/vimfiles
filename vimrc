" set re=1
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
" set modelines=0
syntax enable

" "russian langmap setup
" " set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz



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
set number
set numberwidth=5
set undofile
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

"  ---------------------------------------------------------------------------
"  Backups
"  ---------------------------------------------------------------------------
set history=1000
set noswapfile
set backupdir=/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set wrap
set textwidth=99
set formatoptions=n
set colorcolumn=100

"  ---------------------------------------------------------------------------
"  Searching / moving
"  ---------------------------------------------------------------------------

set ignorecase

" ignore folllowing files
set wildignore+=*.bak,*~,*.tmp,*.backup,*swp,*.o,*.obj,.git,*.rbc,*.png,*.xpi,*.swf,*.woff,*.eot,*.svg,*.ttf,*.otf

set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set mat=5  " Bracket blinking.

"  ---------------------------------------------------------------------------
"  Some functions used in this config
"  ---------------------------------------------------------------------------
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

function! s:SmartOpenTag()
  let current_word = RubyCursorIdentifier()
  let l:tags = taglist(current_word)
  let l:error_message = 'SmartOpenTag: tag not found: ' . current_word

  if empty(l:tags)
    echom l:error_message
    return
  endif

  let l:current_buffer_filename = expand('%')
  let l:first_item_file_name = l:tags[0].filename

  " iterate througs the files with this tag and compare with current tab file
  for l:tag_info in l:tags
    if l:tag_info.filename == l:current_buffer_filename && l:tag_info.name == current_word
      " go to the tag in the current buffer
      execute 'tag ' . current_word
      return
    endif
  endfor

  " try to find it in opened tabs
  for l:tab_number in range(tabpagenr('$'))
    let l:tab_number += 1

    let l:tab_buffers = tabpagebuflist(l:tab_number)

    " TODO: check for full file name
    if bufname(l:tab_buffers[0]) == l:first_item_file_name
      execute 'tabn ' . l:tab_number
      execute 'tag ' . current_word
      return
    endif
  endfor



  " open new tab for this tag
  " TODO: fix the case when opening tag from file that is not in current source tree
  if 0 == empty(l:tags) && get(l:tags, 0).name == current_word
    execute 'tab new'
    execute 'tag ' . current_word
  else
    echom l:error_message
  endif
endfunction
command! SmartOpenTag :call <SID>SmartOpenTag()



" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup saksmlz_autocommands
    autocmd!

    " Enable file type detection
    filetype on

    au BufWritePre * :call <SID>StripTrailingWhitespaces()

    " remember folding
    " BufWinLeave failed to update view sometimes
    au BufWinLeave,BufLeave * silent! mkview

    " au BufLeave * silent! mkview
    " au BufUnload * silent! mkview
    " au BufUnload * mkview

    au BufWinEnter * silent! loadview

    " scss and coffee files
    au BufNewFile,BufRead *.scss setfiletype css
    au BufNewFile,BufRead *.coffee setfiletype coffee

    " Thorfile is Ruby
    au BufRead,BufNewFile {Thorfile,Berksfile} set ft=ruby

    " Customisations based on house-style (arbitrary)
    au FileType html,css,ruby,javascript setlocal ts=2 sts=2 sw=2 expandtab

    " au FileType python setlocal ts=4 sts=4 sw=4 expandtab

    " Syntax of these languages is fussy over tabs Vs spaces
    " au FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    " au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " When vimrc is edited, reload it
    " au! bufwritepost vimrc source ~/.vimrc

    " Treat .rss files as XML
    " au BufNewFile,BufRead *.rss setfiletype xml

    " set filetype for json file to javascript
    " au BufNewFile,BufRead *.json setfiletype javascript

    " Treat .thor files as Ruby
    " au BufNewFile,BufRead *.thor setfiletype ruby
  augroup END

endif

"  ---------------------------------------------------------------------------
"  Status Line
"  ---------------------------------------------------------------------------

" RVM status line
" set statusline+=%{rvm#statusline()}

"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------
"

" saksmlz specific:
" Use jk intead of <esc>
inoremap jk <esc>
vnoremap jk <esc>
" Stop using <esc>
inoremap <esc> <nop>
vnoremap <esc> <nop>

" open tag definition (ctags) in new tab instead of new buffer:
nnoremap <C-\> :SmartOpenTag<CR>

" CTRL+S saves the buffer
nnoremap <C-s> :w<CR>


" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>

" Shift+Insert will paste from system buffer (Control+C)
cnoremap <S-Insert>		<C-R>+
exe 'inoremap <script> <S-Insert>' paste#paste_cmd['i']



" Text indentation with Alt+Letf/Right and so on
nnoremap <M-Left> <<
nnoremap <M-Right> >>
vmap <M-Left> <gv
vmap <M-Right> >gv
nnoremap <M-h> <<
nnoremap <M-l> >>
vmap <M-h> <gv
vmap <M-l> >gv

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

" Switch between tabs
noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt

" Next/Previous tab
" map <M-.> :bn<CR>
" map <M-,> :bp<CR>
noremap <M-.> :tabnext<CR>
noremap <M-,> :tabprevious<CR>



" Clear highlighting
noremap <C-space> :nohl <cr>

" Turn off arrow keys (this might not be a good idea for beginners, but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
" "nnoremap <up> <nop>
" "nnoremap <down> <nop>
" "nnoremap <left> <nop>
" "nnoremap <right> <nop>
" "inoremap <up> <nop>
" "inoremap <down> <nop>
" "inoremap <left> <nop>
" "inoremap <right> <nop>

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" GPicker settings
let g:gpicker_open_file_in_tabs = 1
nnoremap <M-o> :GPickFile<CR>
vnoremap <M-o> :GPickFile<CR>

let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']

" If you have troubles with special symbls, check out this gist: https://gist.github.com/1634235
" to make it working:
" sudo apt-get install python-pip
" sudo pip install https://github.com/Lokaltog/powerline/tarball/develop

" Airline settings
let g:airline_powerline_fonts=1
let g:airline_enable_branch=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_theme='dark'

" Easy commenting
nnoremap <M-/> :TComment<CR>
vnoremap <M-/> :TComment<CR>

" unite
" Автоматический insert mode
let g:unite_enable_start_insert = 1

" Отображаем Unite в нижней части экрана
let g:unite_split_rule = "botright"

" Отключаем замену статус строки
let g:unite_force_overwrite_statusline = 0

" Размер окна Unite
let g:unite_winheight = 10

" Красивые стрелочки
let g:unite_candidate_icon="▷"

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
  set mousehide  " Hide mouse after chars typed
  set mouse=a  " Mouse in all modes
  " set guifont=Monaco 10
  set guifont=Monaco\ For\ Powerline\ 10

  " EXTERNAL COPY / PASTE
  noremap <C-v> "+gP<CR>
  vnoremap <C-c> "+y
endif

colorscheme railscasts

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

noremap <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=.hg --exclude=tmp --exclude=vendor/assets --exclude=public --exclude=app/assets --exclude=log -R *<CR><CR>

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------
" fix email API
" %s/\.deliver_\([^(]\+\)(\([^)]\+\))/::\1(\2).deliver/
"
" fix brs in erb to haml
" %s/<br\s\?\/>/\r%br\/
"
" fix rspec should syntax
" %s/^\(\s\+\)\(\S.\+\)\.should/\1expect(\2).to/
"
" fix factory girl syntax
" %s/Factory\(\.create\)\?/create/
"
" fix hash syntax
" %s/\([^:]\):\([^=:]\+\)\s\?=>\s\?/\1\2: / | %s/\s:\s/: /
"
" %s/expect(response).to have_tag("\([^"]\+\)"\(, "\([^"]\+\)")\|)\)/assert_select '\1', text: '\3'/ | %s/, text: ''$//

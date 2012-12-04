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

set cursorline
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
set wildignore+=*.bak,*~,*.tmp,*.backup,*swp,*.o,*.obj,.git,*.rbc,*.png,*.xpi

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
  let current_word = expand("<cword>")
  let l:tags = taglist(current_word)

  if empty(l:tags)
    return
  endif

  let l:current_buffer_filename = expand('%')
  let l:first_item_file_name = l:tags[0].filename

  " iterate througs the files with this tag and compare with current tab file
  for l:tag_info in l:tags
    if l:tag_info.filename == l:current_buffer_filename
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
  execute 'tab new'
  execute 'tag ' . current_word
endfunction
command! SmartOpenTag :call <SID>SmartOpenTag()



" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  au BufWritePre * :call <SID>StripTrailingWhitespaces()

  " remember folding
  " BufWinLeave failed to update view sometimes
  au BufWinLeave * silent! mkview
  au BufLeave * mkview

  " au BufLeave * silent! mkview
  " au BufUnload * silent! mkview
  " au BufUnload * mkview

  au BufWinEnter * silent! loadview

  " scss and coffee files
  au BufNewFile,BufRead *.scss setfiletype css
  au BufNewFile,BufRead *.coffee setfiletype coffee

  " Customisations based on house-style (arbitrary)
  au FileType html setlocal ts=2 sts=2 sw=2 expandtab
  au FileType css setlocal ts=2 sts=2 sw=2 expandtab

  au FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  au FileType javascript setlocal ts=2 sts=2 sw=2 expandtab


  au FileType python setlocal ts=4 sts=4 sw=4 expandtab

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

  " Thorfile, Rakefile and Gemfile are Ruby
  " au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} set ft=ruby
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

" open tag definition (ctags) in new tab instead of new buffer:
nmap <C-\> :SmartOpenTag<CR>

" CTRL+S saves the buffer
nmap <C-s> :w<CR>


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Shift+Insert will paste from system buffer (Control+C)
cmap <S-Insert>		<C-R>+
exe 'inoremap <script> <S-Insert>' paste#paste_cmd['i']


" EXTERNAL COPY / PASTE
map <C-v> "+gP<CR>
vmap <C-c> "+y


" Text indentation with Alt+Letf/Right and so on
nmap <M-Left> <<
nmap <M-Right> >>
vmap <M-Left> <gv
vmap <M-Right> >gv
" nmap <M-h> <<
" nmap <M-l> >>
" vmap <M-h> <gv
" vmap <M-l> >gv

" Text movimg with plugin unimpaired.vim
" Bubble single lines
" nmap <M-k> [e
" nmap <M-j> ]e
nmap <M-Up> [e
nmap <M-Down> ]e

" Bubble multiple lines
" vmap <M-k> [egv
" vmap <M-j> ]egv
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



" Clear highlighting
map <C-space> :nohl <cr>

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
"  Function Keys
"  ---------------------------------------------------------------------------
" F8 - Toggle tag bar
nmap <F8> :TagbarToggle<CR>

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" GPicker settings
let g:gpicker_open_file_in_tabs = 1
nnoremap <M-o> :GPickFile<CR>
vnoremap <M-o> :GPickFile<CR>


" let g:cssColorVimDoNotMessMyUpdatetime = 1

" Easy commenting
nnoremap <M-/> :TComment<CR>
vnoremap <M-/> :TComment<CR>

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
  set mousehide  " Hide mouse after chars typed
  set mouse=a  " Mouse in all modes
  set guifont=Monaco\ 10
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

map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=.hg --exclude=tmp --exclude=vendor/assets --exclude=public --exclude=app/assets --exclude=log -R *<CR><CR>

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------
let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']

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

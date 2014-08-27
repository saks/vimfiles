set nocompatible               " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/

call vundle#rc()

" Bundle "git://github.com/tpope/vim-rvm.git"
" Bundle "git://github.com/tpope/vim-fugitive"
" Bundle "git://github.com/chrismetcalf/vim-taglist.git"
" Bundle "git://github.com/sjl/gundo.vim.git"
" Bundle "git://github.com/clones/vim-fuzzyfinder.git"
" Bundle "https://github.com/ervandew/supertab"
" Bundle "git://github.com/scrooloose/syntastic.git"
" Bundle "git://github.com/Bogdanp/rbrepl.vim.git"
" Bundle "git://github.com/skammer/vim-css-color.git"
" Bundle "jQuery"
" Bundle "git://github.com/mileszs/ack.vim.git"
" Bundle "git://github.com/sophacles/vim-bundle-sparkup.git"
" Bundle "git://git.wincent.com/command-t.git"
" Bundle "git://github.com/kana/vim-textobj-user.git"
" Bundle "git://github.com/nelstrom/vim-textobj-rubyblock.git"
" Bundle "git://github.com/vim-scripts/nginx.vim.git"
" Bundle "git://github.com/rson/vim-conque.git"
" Bundle "git://github.com/fholgado/minibufexpl.vim.git"
" Bundle "git://github.com/panozzaj/vim-autocorrect.git"
" Bundle "git://github.com/vim-scripts/L9.git"
" Bundle "git://github.com/jpalardy/vim-slime.git"
" Bundle "git://repo.or.cz/vcscommand"
" Bundle "git://github.com/juvenn/mustache.vim.git"
" Bundle "git://github.com/majutsushi/tagbar"
" Bundle "git://github.com/nviennot/vim-powerline.git"
" Bundle "git://github.com/Lokaltog/powerline.git"
" Bundle "git@github.com:slim-template/vim-slim.git"
" Bundle 'tpope/vim-dispatch.git'
" Bundle "git@github.com:terryma/vim-multiple-cursors.git"
Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround.git'
Bundle 'chrismetcalf/vim-yankring.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'godlygeek/tabular.git'
" Bundle 'gmarik/snipmate.vim.git'
" Bundle 'krisleech/snipmate-snippets.git'
Bundle 'saks/Specky.git'
" Bundle 'Keithbsmiley/rspec.vim'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'saks/gpicker.vim.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'tomtom/quickfixsigns_vim.git'
Bundle 'bling/vim-airline'
Bundle 'ngmy/vim-rubocop'
Bundle 'SirVer/ultisnips'
Bundle 'saks/vim-snippets'
Bundle 'digitaltoad/vim-jade'
" Bundle 'Floobits/floobits-vim'
Bundle 'leafo/moonscript-vim'
Bundle 'ekalinin/Dockerfile.vim'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'Shougo/vimproc.vim'
" Bundle 'Shougo/unite.vim'


filetype plugin indent on     " and turn it back on!

runtime macros/matchit.vim

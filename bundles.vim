set nocompatible               " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/

call vundle#rc()


" Bundle "git://git.wincent.com/command-t.git"
" Bundle "git://github.com/Bogdanp/rbrepl.vim.git"
" Bundle "git://github.com/Lokaltog/powerline.git"
" Bundle "git://github.com/chrismetcalf/vim-taglist.git"
" Bundle "git://github.com/clones/vim-fuzzyfinder.git"
" Bundle "git://github.com/fholgado/minibufexpl.vim.git"
" Bundle "git://github.com/jpalardy/vim-slime.git"
" Bundle "git://github.com/juvenn/mustache.vim.git"
" Bundle "git://github.com/kana/vim-textobj-user.git"
" Bundle "git://github.com/majutsushi/tagbar"
" Bundle "git://github.com/mileszs/ack.vim.git"
" Bundle "git://github.com/nelstrom/vim-textobj-rubyblock.git"
" Bundle "git://github.com/nviennot/vim-powerline.git"
" Bundle "git://github.com/panozzaj/vim-autocorrect.git"
" Bundle "git://github.com/rson/vim-conque.git"
" Bundle "git://github.com/scrooloose/syntastic.git"
" Bundle "git://github.com/sjl/gundo.vim.git"
" Bundle "git://github.com/skammer/vim-css-color.git"
" Bundle "git://github.com/sophacles/vim-bundle-sparkup.git"
" Bundle "git://github.com/tpope/vim-fugitive"
" Bundle "git://github.com/tpope/vim-rvm.git"
" Bundle "git://github.com/vim-scripts/L9.git"
" Bundle "git://github.com/vim-scripts/nginx.vim.git"
" Bundle "git://repo.or.cz/vcscommand"
" Bundle "git@github.com:slim-template/vim-slim.git"
" Bundle "git@github.com:terryma/vim-multiple-cursors.git"
" Bundle "https://github.com/ervandew/supertab"
" Bundle "jQuery"
" Bundle "Floobits/floobits-vim"
" Bundle "Keithbsmiley/rspec.vim"
" Bundle "Shougo/unite.vim"
" Bundle "Shougo/vimproc.vim"
" Bundle "Valloric/YouCompleteMe"
" Bundle "derekwyatt/vim-scala"
" Bundle "digitaltoad/vim-jade"
" Bundle "gcmt/taboo.vim"
" Bundle "gmarik/snipmate.vim.git"
" Bundle "krisleech/snipmate-snippets.git"
" Bundle "mhinz/vim-startify"
" Bundle "ngmy/vim-rubocop"
" Bundle "szw/vim-ctrlspace"
" Bundle "tpope/vim-dispatch.git"

Bundle "leafo/moonscript-vim"
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'SirVer/ultisnips'
Bundle 'bling/vim-airline'
Bundle 'chrismetcalf/vim-yankring.git'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'klen/python-mode'
Bundle 'kylef/apiblueprint.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'saks/Specky.git'
Bundle 'saks/gpicker.vim.git'
Bundle 'saks/vim-snippets'
Bundle 'tomtom/quickfixsigns_vim.git'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'

filetype plugin indent on     " and turn it back on!

runtime macros/matchit.vim

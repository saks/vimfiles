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
Bundle 'gmarik/vundle'
Bundle "git://github.com/kchmck/vim-coffee-script.git"
Bundle "git://github.com/tpope/vim-rails.git"
Bundle "git://github.com/tpope/vim-surround.git"
Bundle "git://github.com/chrismetcalf/vim-yankring.git"
Bundle "git://github.com/tpope/vim-endwise.git"
Bundle "git://github.com/godlygeek/tabular.git"
Bundle "git://github.com/gmarik/snipmate.vim.git"
Bundle "git://github.com/krisleech/snipmate-snippets.git"
Bundle "git://github.com/vim-scripts/Specky.git"
Bundle "git://github.com/tpope/vim-unimpaired.git"
Bundle "git://github.com/tomtom/tcomment_vim.git"
Bundle "git://github.com/saks/gpicker.vim.git"
Bundle "git://github.com/tpope/vim-fugitive.git"

filetype plugin indent on     " and turn it back on!

runtime macros/matchit.vim

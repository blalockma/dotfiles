" Terminal sounds.
set visualbell
set t_vb=

" Tab sizes.
set tabstop=4
set shiftwidth=4

" Set cursor modes.
set ttimeout
set ttimeoutlen=1
let &t_SR = "\<esc>[3 q"  " Start Replace mode: blinking underline
let &t_SI = "\<esc>[6 q"  " Start Insert mode: steady bar
let &t_EI = "\<esc>[1 q"  " Exit Insert mode: blinking block

" Quickly reset cursor mode to blinking block on start.
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

" Editor display settings.
set relativenumber number

" Vim-Plug Setup
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'OmniSharp/omnisharp-vim'

call plug#end()

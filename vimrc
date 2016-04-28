set number
set nobackup
set noundofile
set expandtab
set ts=4 sw=4
set history=1000
set hidden
syntax on
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'L9'

Plugin 'scrooloose/nerdtree'

Plugin 'FuzzyFinder'

Plugin 'itchyny/lightline.vim'

Plugin 'Shutnik/jshint2.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'docteurklein/php-getter-setter.vim'

Plugin 'shawncplus/phpcomplete.vim'


call vundle#end()
filetype plugin indent on

map <Leader>t :NERDTree<CR>
map <Leader>q :NERDTreeClose<CR>
map <Leader>d :TagbarToggle<CR>

"lightline config
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Bright',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'fileformat', 'fileencoding', 'filetype', 'percent',
      \     'charvalue', 'lineinfo', 'datetime' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \   'datetime': ' %{strftime("%d-%m-%y %H:%M")}',
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }
  "    \ 'separator': { 'left': '>', 'right': '<' },
  "    \ 'subseparator': { 'left': '»', 'right': '«' }
  function! MyModified()
      return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction
  function! MyFilename()
      return ('' != MyReadonly()? MyReadonly() . ' ' : '') .
                  \ (&ft == 'vimfiler'  ? vimfiler#get_status_string() :
                  \  &ft == 'unite'     ? unite#get_status_string() :
                  \  &ft == 'vimshell'  ? vimshell#get_status_string() :
                  \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                  \ ('' != MyModified() ? ' ' . MyModified() : '')
  endfunction
  function! MyReadonly()
      return &readonly ? '' : ''
  endfunction
  function! MyFugitive()
      if exists("*fugitive#head")
          let _ = fugitive#head()
          return strlen(_) ? ''._ : ''
      endif
      return ''
  endfunction
  let g:unite_force_overwrite_statusline = 0

set t_Co=256
colorscheme jellybeans

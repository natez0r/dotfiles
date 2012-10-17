call pathogen#infect() " load the plugins, i think?

filetype plugin indent on 
let mapleader=',' " leader for custom commands

nmap <silent> <leader>/ :nohlsearch<CR>
" Strip trailing whitespace
nnoremap <leader>rstrip :call <SID>StripTrailingWhitespaces()<CR>

set ruler " show column numbers
set hlsearch "highlight search results
set number " show line numbers
set colorcolumn=100 " show where column 100 is
set background=dark
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
syntax on " syntax highlighting, son
colorscheme solarized
:set cursorcolumn

"##############################################################################                                                                         
" Easier split navigation                                                                                                                               
"##############################################################################                                                                         

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

function! <SID>StripTrailingWhitespaces()
  " Save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Strip trailing whitespace, suppressing no-match error
  %s/\s\+$//e

  " Restore
  let @/=_s
  call cursor(l, c)
endfunction

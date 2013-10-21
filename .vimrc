call pathogen#infect() " load the plugins, i think?

filetype plugin indent on 
let mapleader=',' " leader for custom commands
let g:ruby_space_errors=1

nmap <silent> <leader>/ :nohlsearch<CR>
" Strip trailing whitespace
nnoremap <leader>rstrip :call <SID>StripTrailingWhitespaces()<CR>
map <Leader>rt :!ctags -f tags --extra=+f -a --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>
nnoremap S diw"0P

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

" Error hightlighting
:hi rubySpaceError ctermfg=white ctermbg=red guifg=white guibg=red cterm=bold
set tags=./tags,tags;$HOME

"#############################################################################
" Rails dangerous method highlighting
"############################################################################
hi DangerousMethods guifg=White ctermfg=White guibg=Red ctermbg=Red term=bold

syn match DangerousMethods '\.update_attribute'
syn match DangerousMethods '\.decrement\!*'
syn match DangerousMethods '\.increment\!*'
syn match DangerousMethods '\.toggle\!*'
syn match DangerousMethods '\.decrement_counter'
syn match DangerousMethods '\.delete'
syn match DangerousMethods '\.delete_all'
syn match DangerousMethods '\.find_by_sql'
syn match DangerousMethods '\.increment_counter'
syn match DangerousMethods '\.update_all'
syn match DangerousMethods '\.update_counters'

"##############################################################################                                                                         
" Easier split navigation                                                                                                                               
"##############################################################################                                                                         

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
map <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Backspace in visual mode shouldn't delete, it should move back
vnoremap <BS> <BS>

" Allow 'ii' to exit INSERT mode
imap ii <Esc>

autocmd vimenter * if !argc() | NERDTree | endif
map <Leader>f :NERDTreeToggle<CR>

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

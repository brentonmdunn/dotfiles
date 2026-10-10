" map <Esc> to jj
inoremap jk <Esc>
inoremap kj <Esc>

set tabstop=4
set shiftwidth=4
set expandtab

" Enable file‑type detection, plugins, and indentation
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" Optional: use a more friendly colorscheme
" colorscheme desert   " or any other you like
"
"
set backspace=indent,eol,start
set number
set relativenumber

set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <Esc> :nohlsearch<CR><Esc>

set autoindent
set smartindent


set list
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set cursorline

autocmd ColorScheme * highlight MatchParen ctermbg=blue ctermfg=white guibg=#0000FF guifg=#FFFFFF


" ============================================================
"  Assembly (.s / .S — GAS / RISC-V)
" ============================================================

" Make sure GAS-style asm files are detected as filetype=asm
autocmd BufRead,BufNewFile *.s,*.S set filetype=asm

augroup asm_settings
  autocmd!
  " Assembly conventionally uses real tabs at width 8 to align
  " the label / mnemonic / operand columns.
  autocmd FileType asm setlocal tabstop=8 shiftwidth=8 noexpandtab
  " Comment leader for gc-style plugins / commentstring
  autocmd FileType asm setlocal commentstring=#\ %s
  " smartindent is C-oriented and shifts labels around; drop it for asm
  autocmd FileType asm setlocal nosmartindent
augroup END

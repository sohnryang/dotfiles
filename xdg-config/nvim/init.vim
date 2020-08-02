filetype plugin indent on
syntax on
set nu
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab

let g:python_host_prog=$HOME.'/.nvim-py2/bin/python'
let g:python3_host_prog=$HOME.'/.nvim-py3/bin/python'

"packages
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jelera/vim-javascript-syntax'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'vim-python/python-syntax'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'udalov/kotlin-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'joshdick/onedark.vim'
Plug 'rhysd/vim-clang-format'
Plug 'pboettch/vim-cmake-syntax'
Plug 'tpope/vim-liquid'
Plug 'keith/swift.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'

"should be last
Plug 'ryanoasis/vim-devicons'
call plug#end()

"colorscheme
if !exists('$TMUX')
    set termguicolors
else
    let g:gruvbox_termcolors=16
endif
colorscheme onedark
let g:airline_theme='onedark'

"NERDTree
let NERDTreeShowHidden = 1

"vim-autoformat settings
noremap <F3> :Autoformat<CR>

"zsh-theme filetype
au BufNewFile,BufRead *.zsh-theme setlocal ft=zsh

"mouse
set mouse=a

"python syntax highlighting
let g:python_highlight_all=1

"vimtex
let g:tex_flavor = 'tex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'luatex'
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_method = 'zathura'
let g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'

"editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"clang format
let g:clang_format#code_style = 'google'

"coc.nvim settings
set cmdheight=2
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

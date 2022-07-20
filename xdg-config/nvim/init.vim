filetype plugin indent on
syntax on
set nu
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab

let g:python3_host_prog = '/home/curling_grad/.nvim-py/bin/python'

"packages
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'HerringtonDarkholme/yats.vim'
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
Plug 'lambdalisue/suda.vim'
Plug 'junegunn/fzf.vim'
Plug 'Shirk/vim-gas'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tikhomirov/vim-glsl'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'andweeb/presence.nvim'
Plug 'honza/vim-snippets'
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'brgmnn/vim-opencl'
Plug 'morhetz/gruvbox'

"should be last
Plug 'ryanoasis/vim-devicons'
call plug#end()

"colorscheme
set termguicolors
let g:onedark_terminal_italics = 1
colorscheme gruvbox
let g:airline_powerline_fonts = 1

"control-p for fzf
noremap <C-p> :Files<CR>

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
let g:vimtex_fold_manual = 1
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_method = 'zathura'
set conceallevel=1
let g:tex_conceal='abdmg'

"editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"clang format
let g:clang_format#code_style = 'google'

"coc.nvim settings
set cmdheight=2
noremap <F2> :call CocActionAsync('rename')<CR>
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)

"GNU assembly filetype
au BufNewFile,BufRead *.S setlocal ft=gas
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let java_highlight_functions = 1

"fzf.vim settings
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"gitsigns
lua <<EOF
require('gitsigns').setup()
EOF

"treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "go", "rust", "python", "typescript", "tsx" },
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

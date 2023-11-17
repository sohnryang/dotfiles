filetype plugin indent on
syntax on
set nu
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab

let g:python3_host_prog = $HOME.'/.nvim-py/bin/python'

"packages
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
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
Plug 'junegunn/fzf'
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
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'
Plug 'mfussenegger/nvim-dap-python'
Plug 'brgmnn/vim-opencl'
Plug 'morhetz/gruvbox'
Plug 'petRUShka/vim-magma'
Plug 'petRUShka/vim-sage'
Plug 'stevearc/aerial.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v2.x'}
Plug 'github/copilot.vim'
Plug 'tpope/vim-surround'
Plug 'calincru/flex-bison-syntax'
Plug 'whonore/Coqtail'

call plug#end()

"split terminal
nnoremap <Leader>tt <Cmd>te<CR>
nnoremap <Leader>th <Cmd>sp<CR><Cmd>te<CR>
nnoremap <Leader>tv <Cmd>vs<CR><Cmd>te<CR>

"colorscheme
set termguicolors
let g:onedark_terminal_italics = 1
colorscheme gruvbox
let g:airline_powerline_fonts = 1

"control-p for fzf
noremap <C-p> :Files<CR>

"NERDTree
let NERDTreeShowHidden = 1
nnoremap <Leader>f :Neotree toggle<CR>

"vim-autoformat settings
noremap <F3> :Autoformat<CR>

"zsh-theme filetype
au BufNewFile,BufRead *.zsh-theme setlocal ft=zsh

"mouse
set mouse=a

"python syntax highlighting
let g:python_highlight_all=1

"vimtex
let g:vimtex_compiler_method = 'tectonic'
let g:vimtex_fold_manual = 1
let g:vimtex_view_method = 'general'
let g:vimtex_syntax_conceal = {
      \ 'accents': 1,
      \ 'ligatures': 1,
      \ 'cites': 1,
      \ 'fancy': 1,
      \ 'spacing': 1,
      \ 'greek': 1,
      \ 'math_bounds': 1,
      \ 'math_delimiters': 1,
      \ 'math_fracs': 1,
      \ 'math_super_sub': 0,
      \ 'math_symbols': 1,
      \ 'sections': 1,
      \ 'styles': 1,
      \}
set conceallevel=1

"editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"clang format
let g:clang_format#code_style = 'llvm'

"coc.nvim settings
set cmdheight=2
noremap <Leader>r <Cmd>call CocActionAsync('rename')<CR>
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
nmap <silent> gd <Plug>(coc-definition)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-line)
nnoremap <Leader>d <Plug>(coc-definition)
nnoremap <Leader>en <Plug>(coc-diagnostic-next)
nnoremap <Leader>ep <Plug>(coc-diagnostic-prev)

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

"nvim-dap
lua <<EOF
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = jit.os == "linux" and '/usr/bin/lldb-vscode' or '/opt/homebrew/opt/llvm/bin/lldb-vscode',
  name = 'lldb'
}
dap.adapters.python = {
  type = 'executable';
  command = '/usr/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = true,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require('dapui').setup()
require('dap-go').setup()
require('dap-python').setup('/usr/bin/python')
EOF
nnoremap <silent> <F5> <Cmd>lua require'dapui'.open()<CR><Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <Leader><F5> <Cmd>lua require'dap'.terminate()<CR>
nnoremap <silent> <F8> <Cmd>lua require'dap'.pause()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <Leader><F11> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>c <Cmd>lua require'dapui'.close()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

"treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cmake", "cpp", "go", "rust", "python", "typescript", "tsx" },
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

imap <silent><script><expr> <Leader><Tab> copilot#Accept()
let g:copilot_enabled = 0

"aerial
lua <<EOF
require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '<leader>s', '<cmd>AerialToggle!<CR>')
EOF

"neotree
lua <<EOF
require('neo-tree').setup({
  window = {
    width = 30,
  },
  filesystem = {
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true, -- only works on Windows for hidden files/directories
    },
  },
})
EOF

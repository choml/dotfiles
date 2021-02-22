set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=80
set signcolumn=yes

call plug#begin('~/.vim/plugged')
" Python stuff
Plug 'ambv/black'
Plug 'jmcantrell/vim-virtualenv'

" Neovim lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Neovim Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Code formatter
Plug 'sbdchd/neoformat'

" Vim stuff
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" Viz
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'

call plug#end()

if executable('rg')
    let g:rg_derive_root='true'
endif

" vim theme
colorscheme gruvbox
highlight Normal guibg=none
set background=dark

" autocomplete
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

let mapleader = " "

" enable treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" lsp
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" netrw
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Sex!<CR>

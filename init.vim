set termguicolors
call plug#begin('~/.config/nvim/plugins/')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'akinsho/bufferline.nvim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'ItsTerm1n4l/prime.nvim'
  Plug 'windwp/nvim-autopairs'
call plug#end()
lua require('init')




" Set colorscheme (my modified version)
"source $HOME/.config/nvim/themes/prime.vim

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

let g:prime_contrast = v:true


colorscheme prime

"source $HOME/.config/nvim/lua/indent.lua
"highlight IndentBlanklineIndent1 guifg=#458588 gui=nocombine
set tabstop=4
set shiftwidth=4
set number
set numberwidth=2
filetype indent on
" Open nvim-tree
" NvimTreeOpen

" Keybinds
imap <C-s> <esc>:w<enter>i
imap <C-q> <esc>:q<enter>
map <C-q> <esc>:q<enter>
imap <C-\> <esc>:undo<enter>i
map <C-\> <esc>:undo<enter>
imap <C-r> <esc>:redo<enter>i

" Various settings

let g:nvim_tree_auto_close=1
let g:indent_blankline_char = '¦'
let g:indent_blankline_filetype_exclude = [
      \ 'help', 'markdown', 'text', 'rst', 'man',
      \ 'startify', 'tsplayground',
      \]

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

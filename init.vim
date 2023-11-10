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
  Plug 'ItsTerm1n4l/spice.nvim'  
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
call plug#end()
lua require('init')



set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set cursorline

" Set colorscheme
colorscheme spice


set tabstop=4
set shiftwidth=4
set number
set numberwidth=2

filetype indent on
" Open nvim-tree
" NvimTreeOpen

" Keybinds
imap <C-s> <esc>:w<enter>i<Right>
imap <C-q> <esc>:q<enter>
map <C-q> <esc>:q<enter>
imap <C-\> <esc>:undo<enter>i<Right>
map <C-\> <esc>:undo<enter><Right>
imap <C-r> <esc>:redo<enter>i<Right>
map <C-t> <esc>:NvimTreeToggle<enter> 
imap <C-t> <esc>:NvimTreeToggle<enter>i<Right>
nnoremap ; :
vnoremap ; :
set nowrap

" Various settings
command Tree NvimTreeToggle

"CoC settings
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

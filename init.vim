call plug#begin()
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'knsh14/vim-github-link'
call plug#end()

"colorscheme tokyonight-night
let g:lightline = {'colorscheme': 'tokyonight'}

lua << EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
	file = false,
            folder = false,
            folder_arrow = false,
            git = false,
            modified = false,
            diagnostics = false,
            bookmarks = false,
      }
    }
  }
})

-- OR setup with some options
EOF

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc



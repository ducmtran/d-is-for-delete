-- vim-plug
vim.cmd([[
  call plug#begin()
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'itchyny/lightline.vim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'knsh14/vim-github-link'
  call plug#end()
]])

vim.cmd("colorscheme tokyonight-night")
vim.g.lightline = { colorscheme = "tokyonight" }

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
      },
    },
  },
})

-- Vim runtimepath (packpath follows runtimepath in Neovim)
vim.opt.runtimepath:prepend(vim.fn.expand("~/.vim"))
vim.opt.runtimepath:append(vim.fn.expand("~/.vim/after"))
vim.cmd("source ~/.vimrc")

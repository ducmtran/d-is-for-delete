vim.cmd("source ~/.vimrc")

-- vim-plug
vim.cmd([[
  call plug#begin()
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'knsh14/vim-github-link'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'akinsho/bufferline.nvim'
  call plug#end()
]])

vim.cmd("colorscheme tokyonight-night")
-- vim.g.lightline = { colorscheme = "tokyonight" }

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    numbers = function(opts)
      return string.format('%s', opts.id)
    end
  }
}

-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n', '<leader>b', ':Lexplore<CR>', { desc = 'Toggle netrw sidebar' })
vim.g.netrw_winsize = 30

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' }) -- grep in cwd
vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Telescope grep' }) -- grep string under cursor
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fe', ':Telescope file_browser<CR>')

-- Use Tab and Shift-Tab to cycle through buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Vim runtimepath (packpath follows runtimepath in Neovim)
vim.opt.runtimepath:prepend(vim.fn.expand("~/.vim"))
vim.opt.runtimepath:append(vim.fn.expand("~/.vim/after"))



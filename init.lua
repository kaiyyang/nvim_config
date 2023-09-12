local g = vim.g
local cmd = vim.cmd
local api = vim.api

-- Leader/local leader
g.mapleader = [[;]]
g.maplocalleader = [[,]]

-- Skip some remote provider loading
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Better Escape Settings
g.better_escape_shortcut = 'jj'
g.better_escape_interval = 200
-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
}

for i = 1, 10 do
  g['loaded_' .. disabled_built_ins[i]] = 1
end

-- Settings
local opt = vim.opt
 opt.textwidth = 100
 opt.scrolloff = 7
 opt.wildignore = { '*.o', '*~', '*.pyc' }
 opt.wildmode = 'longest,full'
 opt.whichwrap:append '<,>,h,l'
 opt.inccommand = 'nosplit'
 opt.lazyredraw = true
 opt.showmatch = true
 opt.ignorecase = true
 opt.smartcase = true
 opt.tabstop = 2
 opt.softtabstop = 0
 opt.expandtab = true
 opt.shiftwidth = 2
 opt.number = true
 opt.relativenumber = true
 opt.smartindent = true
 opt.laststatus = 3
 opt.showmode = false
 opt.shada = [['20,<50,s10,h,/100]]
 opt.hidden = true
 opt.shortmess:append 'c'
 opt.joinspaces = false
 opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]
 opt.updatetime = 100
 opt.conceallevel = 2
 opt.concealcursor = 'nc'
 opt.previewheight = 5
 opt.undofile = true
 opt.synmaxcol = 500
 opt.display = 'msgsep'
 opt.cursorline = true
 opt.modeline = false
 opt.mouse = 'nivh'
 opt.signcolumn = 'yes:1'
 opt.cmdheight = 0
 opt.splitbelow = true
 opt.splitright = true
 opt.timeoutlen = 200
 opt.fillchars = [[vert:│,horiz:─,eob: ]]

-- Keybindings
local silent = { silent = true, noremap = true }

-- Quit, close buffers, etc.
local map = vim.api.nvim_set_keymap
-- map('n', '<leader>q', '<cmd>qa<cr>', silent)
-- map('n', '<leader>x', '<cmd>x!<cr>', silent)
-- map('n', '<leader>d', '<cmd>Sayonara<cr>', { silent = true, nowait = true, noremap = true })

-- Version control
map('n', 'gs', '<cmd>Neogit<cr>', silent)

-- Yank to clipboard
map('n', '+y', '"+y', silent)
map('v', '+y', '"+y', silent)

-- Window movement
map('n', '<c-h>', '<c-w>h', silent)
map('n', '<c-j>', '<c-w>j', silent)
map('n', '<c-k>', '<c-w>k', silent)
map('n', '<c-l>', '<c-w>l', silent)

-- Source all the core config files
local core_conf_files = {
  "plugins.vim", -- all the plugins installed and their configurations
}
for _, name in ipairs(core_conf_files) do
  local path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
  local source_cmd = "source " .. path
  vim.cmd(source_cmd)
end

-- Mason for lsp
require('mason').setup()
require('mason-lspconfig').setup()

-- ColorScheme
require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'auto',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = 'rose' },

		-- Blend colours against the "base" background
		CursorLine = { bg = 'foam', blend = 10 },
		StatusLine = { fg = 'love', bg = 'love', blend = 10 },

		-- By default each group adds to the existing config.
		-- If you only want to set what is written in this config exactly,
		-- you can set the inherit option:
		Search = { bg = 'gold', inherit = false },
	}
})

-- Set colorscheme after options
cmd [[colorscheme rose-pine]]


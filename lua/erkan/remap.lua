-- nice utility func
local nmap = function(keys, func, desc)
	if desc then
		desc = 'LSP: ' .. desc
	end

	vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end


--
-- vim.g.mapleader = ' '
-- Personal keymaps
-- split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

nmap("<leader>m", mark.add_file, 'Mark file')
nmap("<leader>z", ui.toggle_quick_menu, 'Toggle quick menu')

nmap('<C-h>', function() ui.nav_file(1) end, 'Switch to marked file [1]')
nmap('<C-t>', function() ui.nav_file(2) end, 'Switch to marked file [2]')
nmap('<C-n>', function() ui.nav_file(3) end, 'Switch to marked file [3]')
nmap('<C-s>', function() ui.nav_file(4) end, 'Switch to marked file [4]')
nmap('<leader>u>', vim.cmd.UndotreeToggle, 'Undo tree toggle')

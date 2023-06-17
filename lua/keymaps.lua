-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Macro Keybindings
vim.keymap.set('n', '<leader>mr', 'qq', { desc = '[M]acro [R]ecord' })
vim.keymap.set('n', '<leader>me', 'q', { desc = '[M]acro [E]nd' })
vim.keymap.set('n', '<leader>mu', '@q', { desc = '[M]acro [U]se' })

-- Unbind space for normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- better normal mode initiator key
vim.keymap.set({ 'i', 't' }, 'jk', '<esc>')

-- Search Keybindings
vim.keymap.set('n', '<leader>sk', ':Telescope keymaps<CR>', { desc = '[S]earch [K]eymaps' })

-- Format Code
vim.keymap.set('n', '<leader>f', ':Format<CR>')

-- Run Code
vim.keymap.set('n', '<leader>rc', ':RunCode<CR>', { desc = '[R]un [C]ode' })

-- Open Terminal
vim.keymap.set('n', '<leader>tt', ':ToggleTerm size=12 direction=horizontal<CR>', { desc = '[T]oggle [T]erminal' })

-- ThePrimeagen Keybinds
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected text down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move selected text up

vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- Jump down page, keep cursor in middle
vim.keymap.set("n", "<C-u>", "<C-u>zz")      -- Jump up page, keep cursor in middle

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>p", "\"+p")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace [W]ord' })

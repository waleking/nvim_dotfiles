vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap

-- general keymaps

-- use jk as ESC (escape) in the Insert mode
keymap("i", "jk", "<ESC>", {})

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", {})

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {})
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", {})
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {})
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {})
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {})

-- Map Tab to :bnext (next buffer) in bufferline
keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })

-- Map Shift-Tab to :bprev (previous buffer)
keymap("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })

-- Debugging (nvim-dap)
local opts = { noremap = true, silent = true }

keymap("n", "<F5>", '<cmd>lua require"dap".continue()<CR>', opts)
keymap("n", "<F10>", '<cmd>lua require"dap".step_over()<CR>', opts)
keymap("n", "<F11>", '<cmd>lua require"dap".step_into()<CR>', opts)
keymap("n", "<leader>t", '<cmd>lua require"dapui".toggle()<CR>', opts)
-- set up a break point
keymap("n", "<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)

vim.g.mapleader = " "

local keymap = vim.keymap

-- general
keymap.set("n", "<leader>nh", ":nohol<CR>")
keymap.set("n", "x", '"_x"')
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
keymap.set("n", "<leader>q", "<C-w>v")
keymap.set("n", "<leader>w", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sc", ":close<CR>")

keymap.set("n", "<leader>t", ":tabnew<CR>")
keymap.set("n", "<leader>tc", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- Plugins
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")

keymap.set("n", "gH", vim.lsp.buf.hover)
keymap.set("n", "gD", vim.lsp.buf.definition)
keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
--

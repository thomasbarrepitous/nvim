-- Leader = Space
vim.g.mapleader = " "

-- Remap :Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- More convenient
vim.keymap.set("n", ";", ":")

-- Better navigation
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Go remaps
vim.keymap.set("n", "<leader>goR", "<cmd>GoRun%<CR>")
vim.keymap.set("n", "<leader>goB", "<cmd>GoBuild<CR>")
vim.keymap.set("n", "<leader>goT", "<cmd>GoTest<CR>")
vim.keymap.set("n", "<leader>goi", "<cmd>GoImport<CR>")
vim.keymap.set("n", "<leader>god", "<cmd>GoDrop<CR>")
vim.keymap.set("n", "<leader>goD", "<cmd>GoDoc<CR>")
vim.keymap.set("n", "<leader>goF", "<cmd>GoFillStructs<CR>")
vim.keymap.set("n", "<leader>got", "<cmd>GoAddTags<CR>")
vim.keymap.set("n", "<leader>gor", "<cmd>GoRemoveTags<CR>")

-- -- Go Debug
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
-- Conflict with telescope for now so disabled
-- vim.keymap.set("n", "<leader>gds", "<cmd>DapStepOver<CR>")
vim.keymap.set("n", "<leader>goc", "<cmd>DapContinue<CR>")
-- vim.keymap.set("n", "<leader>gdi", "<cmd>DapStepInto<CR>")
-- vim.keymap.set("n", "<leader>gdo", "<cmd>DapStepOut<CR>")
vim.keymap.set("n", "<leader>dus", function()
	local dapui = require("dapui")
	dapui.toggle()
end)

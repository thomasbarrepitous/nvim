local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local opts = {
	previewer = false,
	theme = "dropdown",
}
vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files(opts)
end, {})
vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})

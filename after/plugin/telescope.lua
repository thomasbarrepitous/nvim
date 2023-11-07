local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local theme = {
	previewer = false,
	theme = "dropdown",
}
require("telescope").setup({
	pickers = {
		find_files = theme,
		live_grep = theme,
		git_files = theme,
	},
})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})

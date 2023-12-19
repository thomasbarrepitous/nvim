local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "lua_ls", "gopls" },
	handlers = {
		lsp_zero.default_setup,
		require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls({
			single_file_support = false,
			on_attach = function(client, bufnr)
				print("LSP !")
			end,
		})),
		require("lspconfig").gopls.setup({}),
	},
})

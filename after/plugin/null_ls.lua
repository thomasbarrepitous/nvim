local null_ls = require("null-ls")
sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.completion.spell,
	null_ls.builtins.formatting.black,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end
null_ls.setup({ sources = sources, on_attach = on_attach })

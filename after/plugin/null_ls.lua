local null_ls = require("null-ls")
sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.completion.spell,
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.gofumpt,
	null_ls.builtins.formatting.goimports_reviser,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local templ_format = function(client, bufnr)
	local filename = vim.api.nvim_buf_get_name(bufnr)

	-- vim.fn.jobstart(cmd, {
	-- 	on_exit = function()
	-- 		Reload the buffer only if it's still the current buffer
	-- 		if vim.api.nvim_get_current_buf() == bufnr then
	-- 			vim.cmd("e!")
	-- 		end
	-- 	end,
	-- })
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			vim.api.nvim_command("silent !templ fmt " .. vim.fn.shellescape(filename))
			-- if vim.api.nvim_get_current_buf() == bufnr then
			vim.cmd("e!")
			-- end
		end,
	})
end

local on_attach = function(client, bufnr)
	if vim.bo.filetype == "templ" then
		templ_format(client, bufnr)
	else
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end
end
null_ls.setup({ sources = sources, on_attach = on_attach })

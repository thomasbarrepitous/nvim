local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "lua_ls", "html", "tailwindcss", "ts_ls", "eslint" },
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
        require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls({
            single_file_support = false,
            on_attach = function(client, bufnr)
                print("LSP !")
            end,
        })),
        require("lspconfig").ts_ls.setup({}),
        -- require("lspconfig").gopls.setup({}),
        -- require("lspconfig").templ.setup({}),
        require("lspconfig").html.setup({ filetypes = { "html", "templ" } }),
        require("lspconfig").tailwindcss.setup({}),
        require("lspconfig").svelte.setup({}),
        require("lspconfig").eslint.setup({
            on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        }),
    },
})

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use("christoomey/vim-tmux-navigator")
    use("easymotion/vim-easymotion")
    use({
        "nvim-telescope/telescope.nvim",
        -- tag = "0.1.4",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("lukas-reineke/indent-blankline.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        },
    })
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })

    -- use({ "projekt0n/github-nvim-theme" })
    use { 'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }


    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    -- use({ "github/copilot.vim" })
    -- use({ "https://github.com/fatih/vim-go" })
    -- use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    -- use({ "mfussenegger/nvim-dap" })
    -- use({ "leoluz/nvim-dap-go" })
    -- use({ "joerdav/templ.vim" })
    -- Formatter
    use {
        'stevearc/conform.nvim',
        config = function()
            require("conform").setup({
                format_on_save = {
                    timeout_ms = 1000,
                    lsp_fallback = true,
                },
                formatters_by_ft = {
                    javascript = { "prettierd", "prettier" },
                    javascriptreact = { "prettierd", "prettier" },
                    typescript = { "prettierd", "prettier" },
                    typescriptreact = { "prettierd", "prettier" },
                    svelte = { "prettierd", "prettier" },
                    python = { "black" },
                    lua = { "stylua" },
                },
            })
        end,
    }

    -- Spell checker
    use {
        "lewis6991/spellsitter.nvim",
        config = function()
            require("spellsitter").setup()
        end,
    }
    use {
        'greggh/claude-code.nvim',
        requires = {
            'nvim-lua/plenary.nvim', -- Required for git operations
        },
        config = function()
            require('claude-code').setup()
        end
    }
end)

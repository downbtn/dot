return {
    -- lsp/completion
    {
        "dense-analysis/ale",
        lazy = false, 
    },
    {
        "preservim/tagbar",
    },
    {
        "williamboman/mason.nvim",
        priority = 1000,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        priority = 800,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require'lspconfig'.rust_analyzer.setup{
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = false;
                        }
                    }
                },
                capabilities = capabilities,
            }
            require'lspconfig'.pylsp.setup{
                capabilities = capabilities,
            }
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        priority = 999,
    },
    {
        "hrsh7th/nvim-cmp",
        priority = 900,
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end                    
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "vsnip" },
                }), {{name = "buffer"}},
                mapping = {
                    ['<Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end,
                    ['<CR>'] = function(fallback)
                        if cmp.visible() then
                            cmp.confirm()
                        else
                            fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
                        end
                    end,
                    ['<C-n>'] = cmp.select_next_item,
                    ['<C-p>'] = cmp.select_prev_item,
                    ['<C-y>'] = cmp.confirm,
                    ['<Esc>'] = function(fallback)
                        if cmp.visible() then
                            cmp.abort()
                        else
                            fallback()
                        end
                    end,
                },
            })
        end
    },
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-nvim-lsp",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    -- languages
	"euclidianAce/BetterLua.vim",
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_general_viewer = "evince"
        end,
        config = function()
            vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
        end
    },
    -- cosmetic
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_background = "medium"
            vim.g.gruvbox_material_better_performance = 1
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            require'nvim-tree'.setup({
                view = {
                    width = 30,
                },
            })
        end,
    },
    "junegunn/Goyo.vim",
    -- extra features
	"tpope/vim-surround",
	"mg979/vim-visual-multi",
	"preservim/nerdcommenter",
}

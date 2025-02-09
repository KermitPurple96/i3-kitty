local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'Mofiqul/dracula.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind.nvim'
    use 'nvim-neotest/nvim-nio'
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'jayp0521/mason-nvim-dap.nvim'
    use 'numToStr/Comment.nvim'
    use 'windwp/nvim-autopairs'
    use 'nvim-lualine/lualine.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'Vimjas/vim-python-pep8-indent'
    use 'simrat39/rust-tools.nvim'
    use 'mattn/emmet-vim'
    use 'windwp/nvim-ts-autotag'
    use 'kovetskiy/sxhkd-vim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

vim.o.termguicolors = true
vim.o.syntax = "on"
vim.o.background = "dark"
vim.cmd [[colorscheme dracula]]

require('nvim-tree').setup()

require('telescope').setup({
    defaults = {
        file_ignore_patterns = {"node_modules", ".git/"},
        layout_config = {
            horizontal = {prompt_position = "top", results_width = 0.6},
        },
        sorting_strategy = "ascending",
        prompt_prefix = "🔍 ",
    }
})

require('nvim-treesitter.configs').setup({
    ensure_installed = "all",
    highlight = {enable = true},
    autotag = {enable = true},
})

local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    }, {
        {name = 'buffer'},
    }),
})

lspconfig.pyright.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.tsserver.setup{}

require('Comment').setup()
require('nvim-autopairs').setup()

require('lualine').setup({
    options = {
        theme = 'dracula',
    },
})

require('colorizer').setup()

-- Indicadores Git (gitsigns.nvim)
require('gitsigns').setup()

-- Opcional: Configuración de debugging (nvim-dap)
require('dapui').setup()

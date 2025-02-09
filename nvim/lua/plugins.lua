

vim.cmd.packadd('packer.nvim')

-- Inicializa packer y los plugins
require('packer').startup(function(use)
    -- Packer puede administrarse a sí mismo
    use 'wbthomason/packer.nvim'

    -- Tema
    use 'Mofiqul/dracula.nvim'

    -- Explorador de archivos
    use 'nvim-tree/nvim-tree.lua'

    -- Búsqueda avanzada
    -- use 'nvim-telescope/telescope.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} } -- Dependencia necesaria
    }


    -- Resaltado avanzado de sintaxis
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- LSP y autocompletado
    
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind.nvim'

    -- Depuración
    use 'nvim-neotest/nvim-nio'
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'jayp0521/mason-nvim-dap.nvim'

    -- Comentarios y autoparejas
    use 'numToStr/Comment.nvim'
    use 'windwp/nvim-autopairs'

    -- Estado de la barra inferior
    use 'nvim-lualine/lualine.nvim'

    -- Colores en códigos hexadecimales
    use 'norcalli/nvim-colorizer.lua'

    -- Git
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    -- Lenguajes específicos
    use 'Vimjas/vim-python-pep8-indent'
    use 'simrat39/rust-tools.nvim'
    use 'mattn/emmet-vim'
    use 'windwp/nvim-ts-autotag'
    use 'kovetskiy/sxhkd-vim'

    -- Sincronizar si packer fue instalado por primera vez
    if packer_bootstrap then
        require('packer').sync()
    end
end)

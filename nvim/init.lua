-- Verifica que packer.nvim esté instalado
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

-- Cargar el archivo de configuración de plugins
require('plugins')

-- Opcional: sincronizar automáticamente si packer se instaló por primera vez
if packer_bootstrap then
    require('packer').sync()
end


-- Configuración de plugins y funcionalidades básicas
-- Tema Dracula
vim.o.termguicolors = true
vim.o.syntax = "on"
vim.o.background = "dark"
vim.cmd [[colorscheme dracula]]
vim.o.tabstop = 4        -- Número de espacios que representa un tab
vim.o.shiftwidth = 4     -- Número de espacios para autoindentación
vim.o.softtabstop = 4    -- Número de espacios para un tab en modo insert
vim.o.expandtab = true   -- Convierte tabs en espacios
vim.o.smarttab = true    -- Usa tabstop y shiftwidth para <Tab> y <Backspace>
vim.o.autoindent = true  -- Habilita autoindentación
vim.o.smartindent = true -- Habilita indentación inteligente
vim.o.number = true         -- Muestra número de líneas
vim.o.relativenumber = true -- Activa columna relativa

-- Explorador de archivos (nvim-tree)
require('nvim-tree').setup()

-- Búsqueda avanzada (Telescope)
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

-- Resaltado avanzado de sintaxis (nvim-treesitter)
require('nvim-treesitter.configs').setup({
    ensure_installed = "all",
    highlight = {enable = true},
    autotag = {enable = true}, -- Cierre automático de etiquetas
})

-- LSP y autocompletado
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

-- Configura servidores LSP básicos
lspconfig.pyright.setup{} -- Python
lspconfig.rust_analyzer.setup{} -- Rust
lspconfig.tsserver.setup{} -- JavaScript/TypeScript

-- Comentarios (Comment.nvim)
require('Comment').setup()

-- Emparejamiento automático (autopairs)
require('nvim-autopairs').setup()

-- Barra inferior (lualine)
require('lualine').setup({
    options = {
        theme = 'dracula',
    },
})

-- Colores hexadecimales (colorizer)
require('colorizer').setup()

-- Indicadores Git (gitsigns.nvim)
require('gitsigns').setup()

-- Opcional: Configuración de debugging (nvim-dap)
require('dapui').setup()

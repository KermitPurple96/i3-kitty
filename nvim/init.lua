-- Verifica que Packer esté instalado
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd('packadd packer.nvim')
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Cargar Packer
vim.cmd('packadd packer.nvim')

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer puede administrarse a sí mismo
    use 'Mofiqul/dracula.nvim'   -- Tema Dracula

    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Configuración básica de Neovim con Dracula y columna relativa
vim.o.termguicolors = true  -- Habilita colores en la terminal
vim.o.syntax = "on"         -- Activa resaltado de sintaxis
vim.o.background = "dark"   -- Configura fondo oscuro
vim.o.number = true         -- Muestra número de líneas
vim.o.relativenumber = true -- Activa columna relativa

-- Configuración del tema Dracula
local dracula_status, dracula = pcall(require, "dracula")
if dracula_status then
    dracula.setup({
        colors = {
            bg = "#282a36", -- Fondo oscuro
            fg = "#f8f8f2", -- Texto claro
            selection = "#44475a",
            comment = "#6272a4",
            red = "#ff5555",
            orange = "#ffb86c",
            yellow = "#f1fa8c",
            green = "#50fa7b",
            purple = "#bd93f9",
            cyan = "#8be9fd",
            pink = "#ff79c6",
        },
        italic_comment = true, -- Comentarios en itálica
        transparent_bg = false -- No hacer el fondo transparente
    })
    vim.cmd("colorscheme dracula")
else
    print("Error: Dracula no se pudo cargar.")
end

-- Alternar entre números relativos y absolutos dinámicamente
vim.api.nvim_create_autocmd({"InsertEnter"}, {
    pattern = "*",
    command = "set norelativenumber"
})

vim.api.nvim_create_autocmd({"InsertLeave"}, {
    pattern = "*",
    command = "set relativenumber"
})

-- Si usas un archivo de plugins separado, coméntalo o ajústalo
-- require('plugins')

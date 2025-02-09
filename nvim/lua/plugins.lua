vim.cmd.packadd('packer.nvim')

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'  -- Packer puede administrarse a sí mismo
    use 'Mofiqul/dracula.nvim'    -- Tema Dracula
end)

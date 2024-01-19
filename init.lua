vim.cmd("source ~/.config/nvim/plug_load.vim")
vim.cmd("source ~/.config/nvim/mappings.vim")
if vim.g.vscode then
    require('sets')
else
    require('sets')
    require('functions')
    require('setups')
end

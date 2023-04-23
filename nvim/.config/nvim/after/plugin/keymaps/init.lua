local Remap = require("masonblalock.keymap-setup")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

inoremap("kj", "<Esc>")
nnoremap("<CR>", ":nohlsearch<CR>")
nnoremap("<leader>b", ":!dotnet build<CR>")
nnoremap("J", "5j")
nnoremap("K", "5k")
